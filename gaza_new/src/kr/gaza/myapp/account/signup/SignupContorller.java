package kr.gaza.myapp.account.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.account.member.MemberInterface;
import kr.gaza.myapp.account.member.MemberVO;

@Controller
public class SignupContorller {
	@Autowired
	SqlSession sqlSession;
	
	//signup1 페이지 이동.
	@RequestMapping("/JSP/account/signup/signup1")
	public String signupView1() {
		return "JSP/account/signup/signup1";
	}
	//signup2 페이지 이동.
	@RequestMapping("/JSP/account/signup/signup2")
	public String signupView2() {
		return "JSP/account/signup/signup2";
	}
	//signup3 페이지 이동.
	@RequestMapping(value="/JSP/account/signup/signup3", method=RequestMethod.POST)
	public String signupView3(@RequestParam("agree1") String agree1, 
			@RequestParam("agree2") String agree2, HttpServletRequest req) {
			HttpSession sess = req.getSession();
			sess.setAttribute("agree_personalCollectionOption", agree1);
			sess.setAttribute("agree_personalProvide", agree2);
		return "JSP/account/signup/signup3";
	}
	//signup4 페이지 이동.
	@RequestMapping(value="/JSP/account/signup/signup4", method=RequestMethod.POST)
	public String signupView4() {
		return "JSP/account/signup/signup4";
	}
	//signup5 페이지 이동.
	@RequestMapping(value="/JSP/account/signup/signup5", method=RequestMethod.POST)
	public ModelAndView signupView5(MemberVO vo, HttpServletRequest req) {
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		HttpSession sess = req.getSession();
		
		String agree1 = (String)sess.getAttribute("agree_personalCollectionOption");
        String agree2 = (String)sess.getAttribute("agree_personalProvide");
        String direct1 = req.getParameter("receiveEmail");
        String direct2 = req.getParameter("receiveSMS");
        
		if(agree1 == null) agree1 = "off";
        if(agree2 == null) agree2 = "off";
        if(direct1 == null) direct1 = "off";
        if(direct2 == null) direct2 = "off";
        
        vo.setAgree(agree1+"/"+agree2);
        vo.setDirectronic(direct1+"/"+direct2);
		
		int cnt = dao.insertRecord(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName("JSP/account/signup/signup5");
		return mav;
	}
	//중복 id체크
	@RequestMapping(value="/JSP/account/signup/idChk", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public ModelAndView idDupChk(@RequestParam("txtID") String id, HttpServletRequest req) {
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		boolean tf = dao.idCheck(id);
		String isOk = String.valueOf(tf);
		ModelAndView mav = new ModelAndView();
		mav.addObject("isOk", isOk);
		mav.setViewName("JSP/account/signup/idDuplicateCheck");
		
		return mav;
	}
}
