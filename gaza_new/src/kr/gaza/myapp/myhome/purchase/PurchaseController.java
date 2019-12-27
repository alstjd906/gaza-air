package kr.gaza.myapp.myhome.purchase;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PurchaseController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/JSP/mypage/purchase_list")
	public ModelAndView reservationDetailView(HttpServletRequest req) {
		PurchaseInterface dao = sqlSession.getMapper(PurchaseInterface.class);
	
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("JSP/mypage/purchase_list");
		
		return mav;
	}
	@RequestMapping(value="/JSP/mypage/search_list")
	public ModelAndView purchaseDetailView(HttpServletRequest req) {
		PurchaseInterface dao = sqlSession.getMapper(PurchaseInterface.class);
		HttpSession sess = req.getSession();
		int memberNum = (int)sess.getAttribute("memberNum");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");

		List<PurchaseVO> lst = dao.purchaseRecord(memberNum, startDate, endDate);//3개 레코드 들어가있음
		List<PurchaseVO> depAriList = new ArrayList<>();
		
		for(int i=0;i<lst.size();i++) {
			System.out.println(lst.get(i).getPayDate());
			System.out.println(lst.get(i).getOrderNum());
			int flightNumList = dao.flightList(lst.get(i).getOrderNum());
			
			int array[] = new int[lst.size()];
			array[i] = flightNumList;
			
			int productNum  = dao.productNum(array[i]);
			
			int array1[] = new int[lst.size()];
			array1[i] = productNum;
			
			PurchaseVO depAriVO = dao.depAriList(array1[i]);
			depAriVO.setDepart(depAriVO.getDepart());
			depAriVO.setArrive(depAriVO.getArrive());
			System.out.println(depAriVO.getDepart());
			
			depAriList.add(i, depAriVO);
		}
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("depAriList",depAriList);
		mav.setViewName("JSP/mypage/search_list");
	

		
		return mav;
	}

}
