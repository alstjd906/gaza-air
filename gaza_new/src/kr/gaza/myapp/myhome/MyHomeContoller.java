package kr.gaza.myapp.myhome;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;

@Controller
public class MyHomeContoller {
	@Autowired
	SqlSession sqlSession;
	@RequestMapping(value="/JSP/mypage/myhome", method=RequestMethod.GET)
	public ModelAndView myHome(HttpServletRequest req) {
		MyHomeDAOInterface dao = sqlSession.getMapper(MyHomeDAOInterface.class);
		HttpSession sess = req.getSession();
		
		//세션에서 가져온 회원번호, 아이디
		int memberNum = (int)sess.getAttribute("memberNum");
		String memberId = (String)sess.getAttribute("memberId");
		
		MyHomeVO vo =  dao.memberRecord(memberNum); 
		MyHomeVO vo2 = dao.memberMiles(memberNum);
		
		MyHomeVO vo3 = dao.memberGrade(vo2.getMyMileage());
		MyHomeVO vo4 = dao.memberNeedMileage(vo2.getMyMileage());
		int myNeedMiles = (vo4.getNeedMileage() - vo2.getMyMileage());
		
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
		
		//내가 작성한 이용후기, 문의사항 가져오기
		List<ReviewBoardVO> reviewList0 = dao.getReview0(memberId);
		List<ReviewBoardVO> reviewList1 = dao.getReview1(memberId);
		
		ModelAndView mav = new ModelAndView();
		if(vo!=null) {
			mav.addObject("vo",vo);
			mav.addObject("vo2",vo2);
			mav.addObject("vo3",vo3);
			mav.addObject("myNeedMiles",myNeedMiles);
			mav.addObject("flightI",flightI);
			mav.addObject("reviewList0", reviewList0);
			mav.addObject("reviewList1", reviewList1);
			mav.addObject("orderedFlightNumList", orderedFlightNumList);
			mav.setViewName("JSP/mypage/myhome");
		}else {
			mav.setViewName("redirect:/");
		}

		
		return mav;
	}
	@RequestMapping("/JSP/mypage/mypage_GradeInfo")
	public String gradeInfo() {
		return "JSP/mypage/mypage_GradeInfo";
	}
	@RequestMapping(value="/JSP/mypage/interested_route", method=RequestMethod.GET)
	public String myRoute(HttpServletRequest req) {
		
		
		return "JSP/mypage/interested_route";
	}
	
	
	
}
