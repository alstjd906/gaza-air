package kr.gaza.myapp.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminEditController2 {
	@Autowired
	SqlSession sqlSession;
	//seat 수정폼 이동
	@RequestMapping("/JSP/admin/admin_seatForm")
	public String AdminEditForm() {
		return "JSP/admin/admin_seatForm";
	}
	//seatType 추가 
		@RequestMapping(value="/JSP/admin/seatAddOk",method=RequestMethod.POST)
		public ModelAndView SeatAddOk(AdminVO2 vo, HttpServletRequest req) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.insertSeat(vo);
				
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_seat");
			}else {
				mav.setViewName("redirect:admin_seatForm");
			}
			return mav;
		}
		//seatType 수정폼 이동
		@RequestMapping("/JSP/admin/admin_seatEdit")
		public ModelAndView AdminSeatEdit(@RequestParam("seatType") int seatType) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			
			ModelAndView mav = new ModelAndView();
			AdminVO2 vo = dao.seatAllSelect(seatType);
			
			mav.addObject("vo", vo);
			mav.setViewName("JSP/admin/admin_seatEdit");
			return mav;
		}
		//seatType 수정
		@RequestMapping(value="JSP/admin/seatEditOk", method=RequestMethod.POST)
		public ModelAndView seatUpdate(AdminVO2 vo) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.updateSeat(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("seatType",vo.getSeatType());
			if(cnt>0) {
				mav.setViewName("redirect:admin_seat");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//seatType 삭제
		@RequestMapping("/JSP/admin/seatDelOk")
		public ModelAndView SeatDelete(@RequestParam("seatType") int seatType) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.deleteSeat(seatType);
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_seat");
			}else{
				mav.addObject("seatType",seatType);
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//seatReserve 수정폼 이동
		@RequestMapping("/JSP/admin/admin_seatReserveForm")
		public String SeatReserveEditForm() {
			return "JSP/admin/admin_seatReserveForm";
		}
		//seatReserve 추가 
		@RequestMapping(value="/JSP/admin/seatReserveAddOk",method=RequestMethod.POST)
		public ModelAndView SeatReserveAddOk(AdminVO2 vo, HttpServletRequest req) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.insertSeatReserve(vo);
				
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_seatReserve");
			}else {
				mav.setViewName("redirect:admin_seatReserveForm");
			}
			return mav;
		}
		//seatReserve 수정폼 이동
		@RequestMapping("/JSP/admin/admin_seatReserveEdit")
		public ModelAndView AdminSeatReserveEdit(@RequestParam("seatReserveNum") int seatReserveNum) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			
			ModelAndView mav = new ModelAndView();
			AdminVO2 vo = dao.seatReserveAllSelect(seatReserveNum);
			
			mav.addObject("vo", vo);
			mav.setViewName("JSP/admin/admin_seatReserveEdit");
			return mav;
		}
		//seatReserve 수정
		@RequestMapping(value="JSP/admin/seatReserveEditOk", method=RequestMethod.POST)
		public ModelAndView seatReserveUpdate(AdminVO2 vo) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.updateSeatReserve(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("seatReserveNum",vo.getSeatReserveNum());
			if(cnt>0) {
				mav.setViewName("redirect:admin_seatReserve");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}

		//seatReserve 삭제
		@RequestMapping("/JSP/admin/seatReserveDelOk")
		public ModelAndView SeatReserveDelete(@RequestParam("seatReserveNum") int seatReserveNum) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.deleteSeatReserve(seatReserveNum);
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_seatReserve");
			}else{
				mav.addObject("seatReserveNum",seatReserveNum);
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//people 수정폼 이동
		@RequestMapping("/JSP/admin/admin_peopleForm")
		public String PeopleEditForm() {
			return "JSP/admin/admin_peopleForm";
		}
		//people 추가
		@RequestMapping(value="/JSP/admin/peopleAddOk",method=RequestMethod.POST)
		public ModelAndView PeopleAddOk(AdminVO2 vo, HttpServletRequest req) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.insertPeople(vo);
			
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_people");
			}else {
				mav.setViewName("redirect:admin_peopleForm");
			}
			
			return mav;
		}
		//people 수정폼 이동
		@RequestMapping("/JSP/admin/admin_peopleEdit")
		public ModelAndView AdminPeopleEdit(@RequestParam("peopleNum") int peopleNum) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			
			ModelAndView mav = new ModelAndView();
			AdminVO2 vo = dao.peopleAllSelect(peopleNum);
			
			mav.addObject("vo", vo);
			mav.setViewName("JSP/admin/admin_peopleEdit");
			return mav;
		}
		//people 수정
		@RequestMapping(value="JSP/admin/peopleEditOk", method=RequestMethod.POST)
		public ModelAndView peopleUpdate(AdminVO2 vo) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.updatePeople(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("peopleNum",vo.getPeopleNum());
			if(cnt>0) {
				mav.setViewName("redirect:admin_people");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//people 삭제
		@RequestMapping("/JSP/admin/peopleDelOk")
		public ModelAndView PeopleDelete(@RequestParam("peopleNum") int peopleNum) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.deletePeople(peopleNum);
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_people");
			}else{
				mav.addObject("peopleNum",peopleNum);
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//food 수정폼 이동
		@RequestMapping("/JSP/admin/admin_foodForm")
		public String FoodEditForm() {
			return "JSP/admin/admin_foodForm";
		}
		//food 추가
		@RequestMapping(value="/JSP/admin/foodAddOk",method=RequestMethod.POST)
		public ModelAndView FoodAddOk(AdminVO2 vo, HttpServletRequest req) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.insertFood(vo);
			
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_food");
			}else {
				mav.setViewName("redirect:admin_foodForm");
			}
			
			return mav;
		}
		//food 수정폼 이동
		@RequestMapping("/JSP/admin/admin_foodEdit")
		public ModelAndView AdminFoodEdit(@RequestParam("foodNum") int foodNum) {
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			
			ModelAndView mav = new ModelAndView();
			AdminVO2 vo = dao.foodAllSelect(foodNum);
			
			mav.addObject("vo", vo);
			mav.setViewName("JSP/admin/admin_foodEdit");
			return mav;
		}
		//food 수정
		@RequestMapping(value="JSP/admin/foodEditOk", method=RequestMethod.POST)
		public ModelAndView foodUpdate(AdminVO2 vo) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.updateFood(vo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("foodNum",vo.getFoodNum());
			if(cnt>0) {
				mav.setViewName("redirect:admin_food");
			}else {
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		//food 삭제
		@RequestMapping("/JSP/admin/foodDelOk")
		public ModelAndView FoodDelete(@RequestParam("foodNum") int foodNum) {
			
			AdminEditInterface2 dao = sqlSession.getMapper(AdminEditInterface2.class);
			int cnt = dao.deleteFood(foodNum);
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:admin_food");
			}else{
				mav.addObject("foodNum",foodNum);
				mav.setViewName("redirect:admin");
			}
			return mav;
		}
		
		
		
		
		
		
		
		
		
		
		
}
