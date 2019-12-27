package kr.gaza.myapp.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.aviation.airplane.AirplaneVO;
import kr.gaza.myapp.aviation.airport.AirportVO;
import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;

@Controller
public class AdminEditController {
	@Autowired
	SqlSession sqlSession;
	//어드민 수정폼 이동
	@RequestMapping("/JSP/admin/admin_editForm")
	public String AdminEditForm() {
		return "JSP/admin/admin_editForm";
	}
	
	//어드민 추가 
	@RequestMapping(value="/JSP/admin/adminAddOk",method=RequestMethod.POST)
	public ModelAndView AdminAddOk(AdminVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertAdmin(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_admin");
		}else {
			mav.setViewName("redirect:admin_editForm");
		}
		return mav;
	}
	
	
	//어드민 삭제
	@RequestMapping("/JSP/admin/del")
	public ModelAndView AdminDelete(@RequestParam("adminNum") int adminNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteAdmin(adminNum);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_admin");
		}else { //삭제 실패
			mav.addObject("adminNum",adminNum);
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	
	
	//에어포트 수정폼 이동
	@RequestMapping("/JSP/admin/admin_airportForm")
	public String AdminAirportForm() {
		return "JSP/admin/admin_airportForm";
	}
	
		
	//에어포트 추가
	@RequestMapping(value="/JSP/admin/airportAddOk",method=RequestMethod.POST)
	public ModelAndView AdminAirpotAddOk(AirportVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertAirport(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_airport");
		}else {
			mav.setViewName("redirect:admin_airportForm");
		}
		return mav;
	}
	//에어포트 수정폼 이동
	@RequestMapping("/JSP/admin/admin_airportEdit")
	public ModelAndView AdminAirPortEdit(@RequestParam("airportNum") int airportNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		
		ModelAndView mav = new ModelAndView();
		AirportVO vo = dao.airportAllSelect(airportNum);
		
		mav.addObject("vo", vo);
		mav.setViewName("JSP/admin/admin_airportEdit");
		return mav;
	}
		
	//에어포트 수정
		@RequestMapping(value="JSP/admin/airportEditOk", method=RequestMethod.POST)
		public ModelAndView airportUpdate(AirportVO vo) {
			
			AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
			int cnt = dao.updateAirport(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("airportNum",vo.getAirportNum());
			if(cnt>0) {
				mav.setViewName("redirect:admin_airport");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
	
	
	//에어포트 삭제
	@RequestMapping("/JSP/admin/airportDel")
	public ModelAndView AirportDelete(@RequestParam("airportNum") int airportNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteAirport(airportNum);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_airport");
		}else { //삭제 실패
			mav.addObject("airportNum",airportNum);
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
		
		
	//에어플레인 수정폼 이동
	@RequestMapping("/JSP/admin/admin_airplaneForm")
	public String AdminAirplaneForm() {
		return "JSP/admin/admin_airplaneForm";
	}

	
	//에어플레인 추가
	@RequestMapping(value="/JSP/admin/airplaneAddOk",method=RequestMethod.POST)
	public ModelAndView AdminAirplaneAddOk(AirplaneVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertAirplane(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_airplane");
		}else {
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	//에어플레인 수정폼 이동
	@RequestMapping("/JSP/admin/admin_airplaneEdit")
	public ModelAndView AdminAirPlaneEdit(@RequestParam("airplaneName") String airplaneName) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		
		ModelAndView mav = new ModelAndView();
		AirplaneVO vo = dao.airplaneAllSelect(airplaneName);
		
		mav.addObject("vo", vo);
		mav.setViewName("JSP/admin/admin_airplaneEdit");
		return mav;
	}
		
	//에어플레인 수정
		@RequestMapping(value="JSP/admin/airplaneEditOk", method=RequestMethod.POST)
		public ModelAndView airplaneUpdate(AirplaneVO vo) {
			AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
			int cnt = dao.updateAirplane(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("airplaneName",vo.getAirplaneName());
			if(cnt>0) {
				mav.setViewName("redirect:admin_airplane");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
	
	
	//에어플레인 삭제
	@RequestMapping("/JSP/admin/airplaneDel")
	public ModelAndView AirportDelete(AirplaneVO vo) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteAirplane(vo);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_airplane");
		}else { //삭제 실패
			mav.addObject("airplaneName",vo.getAirplaneName());
			mav.setViewName("redirect:admin");
		}
		return mav;
	}

	//프로덕트 추가폼 이동
	@RequestMapping("/JSP/admin/admin_productForm")
	public String AdminProductForm() {
		return "JSP/admin/admin_productForm";
	}
	
		
	//프로덕트 추가
	@RequestMapping(value="/JSP/admin/productAddOk",method=RequestMethod.POST)
	public ModelAndView AdminProductAddOk(ProductVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertProduct(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_product");
		}else {
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	
	
	//프로덕트 수정폼 이동
	@RequestMapping("/JSP/admin/admin_productEdit")
	public ModelAndView AdminProductEdit(@RequestParam("productNum") int productNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		
		ModelAndView mav = new ModelAndView();
		ProductVO vo = dao.productAllSelect(productNum);
		
		mav.addObject("vo", vo);
		mav.setViewName("JSP/admin/admin_productEdit");
		return mav;
	}
		
	//프로덕트 수정
		@RequestMapping(value="JSP/admin/productEditOk", method=RequestMethod.POST)
		public ModelAndView productUpdate(ProductVO vo) {
			
			AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
			int cnt = dao.updateProduct(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("productNum",vo.getProductNum());
			if(cnt>0) {
				mav.setViewName("redirect:admin_product");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		
	//프로덕트 삭제
		@RequestMapping("/JSP/admin/productDel")
		public ModelAndView productDelete(@RequestParam("productNum") int productNum) {
			AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
			int cnt = dao.deleteProduct(productNum);
			
			ModelAndView mav = new ModelAndView();
			if(cnt>0) { // 삭제성공
				mav.setViewName("redirect:admin_product");
			}else { //삭제 실패
				mav.addObject("productNum",productNum);
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		
	//플라이트 수정폼 이동
	@RequestMapping("/JSP/admin/admin_flightForm")
	public String AdminFlightForm() {
		return "JSP/admin/admin_flightForm";
	}

	
	//프로덕트 추가
	@RequestMapping(value="/JSP/admin/flightAddOk",method=RequestMethod.POST)
	public ModelAndView AdminFlightAddOk(FlightVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertFlight(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_flight");
		}else {
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	//에어플레인 수정폼 이동
	@RequestMapping("/JSP/admin/admin_flightEdit")
	public ModelAndView AdminFlightEdit(@RequestParam("flightNum") int flightNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		
		ModelAndView mav = new ModelAndView();
		FlightVO vo = dao.flightAllSelect(flightNum);
		
		mav.addObject("vo", vo);
		mav.setViewName("JSP/admin/admin_flightEdit");
		return mav;
	}
		
	//에어플레인 수정
	@RequestMapping(value="JSP/admin/flightEditOk", method=RequestMethod.POST)
	public ModelAndView flightUpdate(FlightVO vo) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.updateFlight(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("flightNum",vo.getFlightNum());
		if(cnt>0) {
			mav.setViewName("redirect:admin_flight");
		}else {
			mav.setViewName("redirect:admin");
		}
		return mav;
	}


	//플라이트 삭제
	@RequestMapping("/JSP/admin/flightDel")
	public ModelAndView flightDelete(@RequestParam("flightNum") int flightNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteFlight(flightNum);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_flight");
		}else { //삭제 실패
			mav.addObject("flightNum",flightNum);
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	
	
	//공지사항 수정폼 이동
	@RequestMapping("/JSP/admin/admin_noticeForm")
	public String AdminNoticeForm() {
		return "JSP/admin/admin_noticeForm";
	}
	
	//공지사항 보기
	@RequestMapping("/JSP/admin/admin_noticeView")
	public ModelAndView noticeView(NoticeBoardVO vo ) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		vo = dao.selectNotice(vo.getNoticeNum());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("JSP/admin/admin_noticeView");
		
		return mav;
	}
		
	//공지사항 추가
	@RequestMapping(value="/JSP/admin/noticeAddOk",method=RequestMethod.POST)
	public ModelAndView AdminNoticeAddOk(NoticeBoardVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		vo.setNoticeType(1);
		int cnt = dao.insertNotice(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_notice");
		}else {
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	
	
	//공지사항 삭제
	@RequestMapping("/JSP/admin/noticeDel")
	public ModelAndView noticeDelete(@RequestParam("noticeNum") int noticeNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteNotice(noticeNum);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_notice");
		}else { //삭제 실패
			mav.addObject("noticeNum",noticeNum);
			mav.setViewName("redirect:admin");
		}
		return mav;
	}
	
	//공지사항 보기
	@RequestMapping("/JSP/admin/admin_reviewView")
	public ModelAndView reviewView(ReviewBoardVO vo ) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		vo = dao.selectReview(vo.getReviewNum());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("JSP/admin/admin_reviewView");
		
		return mav;
	}
	
	
	//이벤트 수정폼 이동
	@RequestMapping("/JSP/admin/admin_allianceForm")
	public String AdminAllianceForm() {
		return "JSP/admin/admin_allianceForm";
	}
	
	//이벤트 추가 
	@RequestMapping(value="/JSP/admin/allianceAddOk",method=RequestMethod.POST)
	public ModelAndView AllinaceAddOk(AllianceVO vo, HttpServletRequest req) {
		
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.insertAlliance(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:admin_alliance");
		}else {
			mav.setViewName("redirect:admin_allianceForm");
		}
		return mav;
	}
	
	//이벤트 삭제
	@RequestMapping("/JSP/admin/allianceDel")
	public ModelAndView EventDelete(@RequestParam("eventNum") int eventNum) {
		AdminEditInterface dao = sqlSession.getMapper(AdminEditInterface.class);
		int cnt = dao.deleteAlliance(eventNum);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) { // 삭제성공
			mav.setViewName("redirect:admin_alliance");
		}else { //삭제 실패
			mav.addObject("adminNum",eventNum);
			mav.setViewName("redirect:admin");
		}
		return mav;
	}			
}
