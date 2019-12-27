package kr.gaza.myapp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;
import kr.gaza.myapp.eventPackage.EPtravelInterface;
import kr.gaza.myapp.eventPackage.TravelVO;
import kr.gaza.myapp.flight.booking.BookingInterface;
import kr.gaza.myapp.flight.booking.BookingVO;
import kr.gaza.myapp.flight.booking.JourneyVO;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {	
		HomeInterface dao = sqlSession.getMapper(HomeInterface.class);
		ModelAndView mav = new ModelAndView();
		//추천상품 글 가져오기
		EPtravelInterface recommandDao = sqlSession.getMapper(EPtravelInterface.class);
		List<TravelVO> recommandList = recommandDao.getAllRecord();
		
		//이벤트 글 가져오기
		List<AllianceVO> eventList = dao.getEvent();
		
		//공지사항 글 가져오기
		List<NoticeBoardVO> noticeList = dao.getNotice();
		
		//이용후기 글 가져오기
		List<ReviewBoardVO> reviewList = dao.getReview();
		
		
		mav.setViewName("index");
		mav.addObject("recommandList", recommandList);
		mav.addObject("eventList", eventList);
		mav.addObject("noticeList", noticeList);
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	@RequestMapping(value = "/JSP/simpleBooking")
	public ModelAndView simpleBooking(
			@RequestParam("airportFrom-1") String airportFrom2,
			@RequestParam("airportTo-1") String airportTo2,
			@RequestParam("fromDate") String fromDate2,
			@RequestParam("toDate") String toDate2,
			@RequestParam("trip-type") String flight_type2,
			@RequestParam("num-of-passengers") String numOfPassengers2,
			@RequestParam("class-type") String seatType2,
			HttpServletRequest request
			) {	
	
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("JSP/flight/booking/booking2");
        
        BookingVO bookingVO = new BookingVO();
        bookingVO.setJourneyType(request.getParameter("flight-type"));
        String[] airportFrom = {airportFrom2, airportTo2};
        String[] airportTo = {airportTo2, airportFrom2};
        String[] flightDate = {fromDate2, toDate2};
        String numOfPassengers = numOfPassengers2;
        String seatType = seatType2;
        for (int i = 0; i < airportFrom.length; i++) {
            JourneyVO journeyVO = new JourneyVO();
            JourneyVO journeyVO2 = new JourneyVO();
            journeyVO.setAirportFrom(airportFrom[i]);
            journeyVO.setAirportTo(airportTo[i]);
            journeyVO.setNumOfPassengers(numOfPassengers);
            journeyVO.setFlightClass(seatType);
            flightDate[i] = flightDate[i].replace("/","-");
            
                journeyVO.setFlightDate(flightDate[i]);
                bookingVO.getJourneyList().add(journeyVO);
            
        }

        BookingInterface bookingDAO = sqlSession.getMapper(BookingInterface.class);
        List<JourneyVO> journeyList = bookingVO.getJourneyList();
        for (int i = 0; i < journeyList.size(); i++) {
            String from = journeyList.get(i).getAirportFromIATA();
            String to = journeyList.get(i).getAirportToIATA();
            bookingVO.getProductList().add(bookingDAO.getProductVO(from, to));
        }
        
        List<ProductVO> productList = bookingVO.getProductList();
        for (int i = 0; i < productList.size(); i++)
            bookingVO.getFlightList().add(bookingDAO.getFlightVO(productList.get(i).getProductNum(), journeyList.get(i).getFlightDate()));

        for (int i = 0; i < bookingVO.getFlightList().size(); i++) {
            List<FlightVO> flightList = bookingVO.getFlightList().get(i);
            bookingVO.getSeatLeftList().add(bookingDAO.getSeatLeft(flightList));
        }

        for (JourneyVO journeyVO : bookingVO.getJourneyList())
            journeyVO.getFlightDate().replace("-","/");

        request.setAttribute("bookingVO", bookingVO);
         request.setAttribute("journey", new String[]{"가는", "오는"});

        request.setAttribute("cheapestPriceList", getCheapestPrice(bookingVO));
        return modelAndView;
	}
	 private List<List<Integer>> getCheapestPrice(BookingVO bookingVO) {
	        int price = 0;
	        double temp = 0;
	        List<List<Integer>> priceList = new ArrayList<>();

	        BookingInterface bookingDAO = sqlSession.getMapper(BookingInterface.class);
	        BookingVO vo = new BookingVO();
	        List<JourneyVO> journeyList = bookingVO.getJourneyList();
	        for (int i = 0; i < journeyList.size(); i++) {
	            String from = journeyList.get(i).getAirportFromIATA();
	            String to = journeyList.get(i).getAirportToIATA();
	            vo.getProductList().add(bookingDAO.getProductVO(from, to));
	        }
	        List<ProductVO> productList = vo.getProductList();
	        for (int i = 0; i < productList.size(); i++) {
	            for (int dateMod = -3; dateMod <= 3; dateMod++) {
	                String journeyDate = journeyList.get(i).getFlightDate();
	                int targetYear = Integer.parseInt(journeyDate.substring(0,4));
	                int targetMonth = Integer.parseInt(journeyDate.substring(5,7))-1;
	                int targetDate = Integer.parseInt(journeyDate.substring(8,10))+dateMod;
	                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                Calendar calendar = Calendar.getInstance();
	                calendar.set(targetYear, targetMonth, targetDate);
	                vo.getFlightList().add(bookingDAO.getFlightVO(productList.get(i).getProductNum(), simpleDateFormat.format(calendar.getTime())));
	            }
	            List<List<FlightVO>> flightVOList = vo.getFlightList();
	            priceList.add(new ArrayList<>());
	            //揶쏉옙野꺿뫖�돩�뤃占�
	            temp = productList.get(i).getPrice() * productList.get(i).getProductSale();
	            for (int j = 0; j < flightVOList.size(); j++) {
	                for (int k = 0; k < flightVOList.get(j).size(); k++) {
	                    if (price == 0 || temp * flightVOList.get(j).get(k).getFlightSale() < price)
	                        price = (int) Math.round(temp * flightVOList.get(j).get(k).getFlightSale() / 100) * 100;
	                }
	                priceList.get(i).add(j, price);
	                price = 0;
	            }
	        }
	        return priceList;
	    }
}

