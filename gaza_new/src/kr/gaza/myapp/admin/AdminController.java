package kr.gaza.myapp.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.account.member.MemberVO;
import kr.gaza.myapp.aviation.airplane.AirplaneVO;
import kr.gaza.myapp.aviation.airport.AirportVO;
import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.food.FoodVO;
import kr.gaza.myapp.aviation.personType.peopleVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import kr.gaza.myapp.aviation.seatType.SeatVO;
import kr.gaza.myapp.aviation.seatreserve.SeatReserveVO;
import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;
import kr.gaza.myapp.eventPackage.EPtravelInterface;
import kr.gaza.myapp.eventPackage.TravelVO;
@Controller
public class AdminController {
	@Autowired
	SqlSession sqlSession;

    @RequestMapping("/admin_login")
    public String adminIndex() {
        return "JSP/admin/admin_login";
    }

    @PostMapping("/JSP/admin/admin_loginOk")
    public ModelAndView adminLoginOk(AdminVO vo1, HttpServletRequest req) {
        AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
        AdminVO vo = dao.login(vo1);

        ModelAndView mav = new ModelAndView();
        if (vo != null) {
            HttpSession ses = req.getSession();
            ses.setAttribute("adminNum", vo.getAdminNum());
            ses.setAttribute("adminId", vo.getAdminId());
            ses.setAttribute("adminPwd", vo.getAdminPwd());
        }
        mav.setViewName("JSP/admin/admin_loginOk");

        return mav;
    }

    @GetMapping("/admin_logout")
    public String logOut() {
        return "JSP/admin/admin_logout";
    }

    @RequestMapping("/JSP/admin/admin_dash")
	public String adminDash() {
		return "JSP/admin/admin_dash";
	}

	@RequestMapping("/JSP/admin/admin_airport")
	public ModelAndView adminAirport() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<AirportVO> lst = dao.airportAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_airport");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_flight")
	public ModelAndView adminFlight() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<FlightVO> lst = dao.flightAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_flight");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_food")
	public ModelAndView adminFood() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<FoodVO> lst = dao.foodAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_food");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_people")
	public ModelAndView adminPeople() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<peopleVO> lst = dao.peopleAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_people");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_product")
	public ModelAndView adminProduct() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<ProductVO> lst = dao.productAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_product");
		
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_seatReserve")
	public ModelAndView adminSeatReserve() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<SeatReserveVO> lst = dao.seatReserveAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_seatReserve");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_seat")
	public ModelAndView adminSeat() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<SeatVO> lst = dao.seatAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_seat");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_alliance")
	public ModelAndView adminAlliance() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<AllianceVO> lst = dao.allianceAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_alliance");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_notice")
	public ModelAndView adminNotice() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<NoticeBoardVO> lst = dao.noticeAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_notice");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_review")
	public ModelAndView adminReview() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<ReviewBoardVO> lst = dao.reviewAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_review");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_member")
	public ModelAndView adminMember() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<MemberVO> lst = dao.memberAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", lst);
		mav.setViewName("JSP/admin/admin_member");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_admin")
	public ModelAndView adminAdmin() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<AdminVO> lst = dao.adminAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_admin");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_airplane")
	public ModelAndView adminAirplane() {
		AdminInterface dao = sqlSession.getMapper(AdminInterface.class);
		List<AirplaneVO> lst = dao.airplaneAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_airplane");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_recommend_kor")
	public ModelAndView recommendKor() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_recommend_kor");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_recommend_asia")
	public ModelAndView recommendAsia() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_recommend_asia");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_recommend_europe")
	public ModelAndView recommendEurope() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_recommend_europe");
		return mav;
	}
	
	@RequestMapping("/JSP/admin/admin_recommend_america")
	public ModelAndView recommendAmerica() {
		EPtravelInterface dao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> lst = dao.getAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		mav.setViewName("JSP/admin/admin_recommend_america");
		return mav;
	}
}
