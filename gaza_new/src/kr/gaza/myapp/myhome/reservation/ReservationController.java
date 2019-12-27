package kr.gaza.myapp.myhome.reservation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.myhome.MyHomeDAOInterface;
import kr.gaza.myapp.myhome.MyHomeVO;

@Controller
public class ReservationController {
	@Autowired
	SqlSession sqlSession;
	//예약현황 페이지 이동.
	@RequestMapping(value="/JSP/mypage/reservation_list")
	public ModelAndView reservationListView(HttpServletRequest req) {
		MyHomeDAOInterface dao = sqlSession.getMapper(MyHomeDAOInterface.class);
		HttpSession sess = req.getSession();
		int memberNum = (int)sess.getAttribute("memberNum");
		MyHomeVO vo =  dao.memberRecord(memberNum); 
		MyHomeVO vo2 = dao.memberMiles(memberNum);
	
		List<MyHomeVO> orderNumList = dao.orderNumList(memberNum); 
		List<MyHomeVO> flightI = new ArrayList<>();
		List<Integer> orderedFlightNumList = new ArrayList<>();
		
		for(int i=0;i<orderNumList.size();i++) {//3 orderNumList안에 orderNum을 3개 세팅
			
			int num = dao.flightList(orderNumList.get(i).getOrderNum());
			orderedFlightNumList.add(dao.getOrderedNum(orderNumList.get(i).getOrderNum()));
			
			int array[] = new int[orderNumList.size()];
			array[i] = num;
			
			MyHomeVO flightInfoVO = dao.flightInfo(array[i]);//airplaneName, departTime, arriveTime, productNum을 세팅
			MyHomeVO flightInfoVO2 = dao.DepAri(flightInfoVO.getProductNum());//productNum3개를 넣어서 depart, arrive위치를 구해옴.
			MyHomeVO flightInfoVO3 = dao.departCity(flightInfoVO2.getDepart());
			MyHomeVO flightInfoVO4 = dao.arriveCity(flightInfoVO2.getArrive());
			flightInfoVO.setArrive(flightInfoVO2.getArrive());
			flightInfoVO.setDepart(flightInfoVO2.getDepart());
			flightInfoVO.setDepartCity(flightInfoVO3.getDepartCity());
			flightInfoVO.setArriveCity(flightInfoVO4.getArriveCity());
		
			
			flightI.add(i, flightInfoVO);

		}//orderNumList
		
		
		ModelAndView mav = new ModelAndView();
		if(vo!=null) {
			mav.addObject("flightI",flightI);
			mav.addObject("orderedFlightNumList", orderedFlightNumList);
			mav.setViewName("JSP/mypage/reservation_list");
		}else {
			mav.setViewName("redirect:/");
		}

		return mav;
	}
	//예약 상세 페이지 이동.
	@RequestMapping(value="/JSP/mypage/reservation_detail")
	public ModelAndView reservationDetailView() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("JSP/mypage/reservation_detail");
		
		return mav;
	}
}
