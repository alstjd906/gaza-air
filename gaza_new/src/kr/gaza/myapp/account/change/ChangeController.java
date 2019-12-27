package kr.gaza.myapp.account.change;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.account.member.MemberInterface;
import kr.gaza.myapp.account.member.MemberVO;

@Controller
public class ChangeController {
	@Autowired
	SqlSession sqlSession;
	//회원정보 페이지 이동.
	@RequestMapping(value="/JSP/account/change/account_info")
	public ModelAndView accountView(HttpServletRequest req) {
		
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		HttpSession ses = req.getSession();
		MemberVO vo = new MemberVO();
		vo.setMemberId((String)ses.getAttribute("memberId"));
		
		MemberVO vo1 = dao.getMember(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo1);
		mav.setViewName("JSP/account/change/account_info");
	    
	    return mav;
	}
	//회원정보 수정
	@RequestMapping(value="/JSP/account/change/account_info_edit", method=RequestMethod.POST)
	public ModelAndView accountEdit(MemberVO vo, HttpServletRequest req) {
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		HttpSession sess = req.getSession();
		vo.setMemberId((String)sess.getAttribute("memberId"));
		
		String ag1 = req.getParameter("ag1");
		String ag2 = req.getParameter("ag2");
		String dr1 = req.getParameter("dr1");
	    String dr2 = req.getParameter("dr2");
		if(ag1 == null) ag1 = "off";
        if(ag2 == null) ag2 = "off";
        if(dr1 == null) dr1 = "off";
        if(dr2 == null) dr2 = "off";
        
        vo.setAgree(ag1+"/"+ag2);
        vo.setDirectronic(dr1+"/"+dr2);
		int cnt = dao.updateRecord(vo);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:account_info");
		}else {
			mav.addObject("cnt", cnt);
			mav.setViewName("/JSP/account/change/account_info");
		}
		
		return mav;
	}
	//회원정보-비밀번호변경-비밀번호 확인
	@RequestMapping("/JSP/account/change/password_recheck")
	public String passwordRecheck(HttpServletRequest req) {
		HttpSession sess = req.getSession();
		String id = (String)sess.getAttribute("memberId");
		req.setAttribute("memberId", id);
		return "JSP/account/change/password_recheck";
	}
	
	//회원 비밀번호 변경페이지로 이동.
	@RequestMapping(value="/JSP/account/change/password_change", method=RequestMethod.POST)
	public ModelAndView passwordChangeView(MemberVO vo) {
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		int cnt = dao.pwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("JSP/account/change/password_change");
		}else {
			mav.addObject("cnt", cnt);
			mav.setViewName("JSP/account/change/password_recheck");
		}
		
		return mav;
	}
	//회원 비밀번호 변경
	@RequestMapping(value="/JSP/account/change/password_changeOk", method=RequestMethod.POST)
	public ModelAndView passwordChangeOk(@RequestParam("oldPassword") String oldPwd,
			@RequestParam("password") String newPwd, HttpServletRequest req) {
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		HttpSession sess = req.getSession();
		String memberId = (String)sess.getAttribute("memberId");
		int cnt = dao.updatePassword(memberId, oldPwd, newPwd);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/account/change/password_changeOk");
		mav.addObject("cnt", cnt);
		
		return mav;
	}
	//회원 탈퇴 뷰페이지로 이동.
	@RequestMapping("/JSP/account/change/account_delete")
	public String accountDelView() {
		
		return "JSP/account/change/account_delete";
	}
	//회원 탈퇴
	@RequestMapping(value="/JSP/account/change/account_deleteOk", method=RequestMethod.POST)
	public ModelAndView accountDelOk(@RequestParam("memberId") String id,
			@RequestParam("pwdChk") String pwd, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPwd(pwd);
		int cnt = dao.delAccount(vo);
		if(cnt>0) sess.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName("JSP/account/change/account_deleteOk");
		return mav;
	}
}
