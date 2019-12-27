package kr.gaza.myapp.eventPackage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
	public class EventPackageController {
	@Autowired
	SqlSession sqlSession;
	@RequestMapping("/JSP/eventNpackage/event_list")
	public ModelAndView EventList() {
		EPallianceInterface dao = sqlSession.getMapper(EPallianceInterface.class);
		List<AllianceVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/eventNpackage/event_list");
		return mav;
	}
	
	@RequestMapping("/JSP/eventNpackage/event_detail")
	public ModelAndView DetailList(HttpServletRequest req) {
		EPallianceInterface dao = sqlSession.getMapper(EPallianceInterface.class);
		AllianceVO vo = new AllianceVO();
		vo.setEventNum(Integer.parseInt(req.getParameter("eventNum")));
		AllianceVO vo2 = dao.eventSelect(vo);
		
		List<AllianceVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo2);
		mav.addObject("lst",lst);
		mav.setViewName("JSP/eventNpackage/event_detail");
		
		return mav;
	}
	
	@RequestMapping("/JSP/eventNpackage/best_package")
	public ModelAndView BestPackage() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		TravelVO vo = new TravelVO();
		List<TravelVO> lst = dao.getBestRecord(vo.getOnePageRecord());
		List<TravelVO> saleList = dao.getSaleRecord(vo.getOnePageRecord());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.addObject("saleList",saleList);
		
		mav.setViewName("JSP/eventNpackage/best_package");
		return mav;
	}
	
	@RequestMapping("/JSP/eventNpackage/recommend_package")
	public ModelAndView RecommendPackage() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/eventNpackage/recommend_package");
		return mav;
	}
}
