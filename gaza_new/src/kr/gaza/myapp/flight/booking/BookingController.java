package kr.gaza.myapp.flight.booking;

import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

@Controller
public class BookingController {
    @Autowired
    private SqlSession sqlSession;

    @GetMapping (value = "/JSP/flight/booking/booking1")
    public ModelAndView bookingView1(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String city = request.getParameter("city");
        String iata = request.getParameter("iata");
        String trip_type = request.getParameter("trip_type");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/JSP/flight/booking/booking1");

        if (city != null) modelAndView.addObject("city", city);
        if (iata != null) modelAndView.addObject("iata", iata);
        if (trip_type != null) modelAndView.addObject("trip_type", trip_type);
        return modelAndView;
    }

    @PostMapping (value = "/JSP/flight/booking/booking2")
    public ModelAndView bookingView2(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("JSP/flight/booking/booking2");
        
        BookingVO bookingVO = new BookingVO();
        bookingVO.setJourneyType(request.getParameter("flight-type"));
        String[] airportFrom = request.getParameter("airportFrom").split("&");
        String[] airportTo = request.getParameter("airportTo").split("&");
        String[] flightDate = request.getParameter("flightDate").split("&");
        String numOfPassengers = request.getParameter("numOfPassengers");
        String seatType = request.getParameter("seat-type");
        for (int i = 0; i < airportFrom.length; i++) {
            JourneyVO journeyVO = new JourneyVO();
            JourneyVO journeyVO2 = new JourneyVO();
            journeyVO.setAirportFrom(airportFrom[i]);
            journeyVO.setAirportTo(airportTo[i]);
            journeyVO.setNumOfPassengers(numOfPassengers);
            journeyVO.setFlightClass(seatType);
            flightDate[i] = flightDate[i].replace("/","-");
            if (bookingVO.getJourneyType().equals("round-way")) {
                journeyVO2.setAirportFrom(airportTo[i]);
                journeyVO2.setAirportTo(airportFrom[i]);
                journeyVO2.setNumOfPassengers(numOfPassengers);
                journeyVO2.setFlightClass(seatType);
                String[] dates = flightDate[i].split(" → ");
                journeyVO.setFlightDate(dates[0]);
                journeyVO2.setFlightDate(dates[1]);
                bookingVO.getJourneyList().add(journeyVO);
                bookingVO.getJourneyList().add(journeyVO2);
            } else {
                journeyVO.setFlightDate(flightDate[i]);
                bookingVO.getJourneyList().add(journeyVO);
            }
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

        // journeydate 占쎈７筌띾８�뼄占쎈뻻 獄쏅떽��疫뀐옙
        for (JourneyVO journeyVO : bookingVO.getJourneyList())
            journeyVO.getFlightDate().replace("-","/");

        request.setAttribute("bookingVO", bookingVO);
        if (bookingVO.getJourneyType().equals("multi-way"))
            request.setAttribute("journey", new String[]{"첫번째", "두번째", "세번째", "네번째", "다섯번째", "여섯번째"});
        else request.setAttribute("journey", new String[]{"가는", "오는"});

        request.setAttribute("cheapestPriceList", getCheapestPrice(bookingVO));
        return modelAndView;
    }

    @PostMapping (value="/JSP/flight/booking/changeDate", produces="application/text;charset=UTF-8")
    public @ResponseBody
    ModelAndView changeDate(@RequestParam("airportFrom") String airportFrom,
                     @RequestParam("airportTo") String airportTo,
                     @RequestParam("flightDate") String flightDate,
                     @RequestParam("dateMod") int dateMod,
                     HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        BookingVO bookingVO = new BookingVO();
        JourneyVO journeyVO = new JourneyVO();
        journeyVO.setAirportFrom(airportFrom);
        journeyVO.setAirportTo(airportTo);
        flightDate = flightDate.replace("/","-");
        int targetYear = Integer.parseInt(flightDate.substring(0,4));
        int targetMonth = Integer.parseInt(flightDate.substring(5,7)) - 1;
        int targetDate = Integer.parseInt(flightDate.substring(8,10)) + dateMod;

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.set(targetYear, targetMonth, targetDate);
        journeyVO.setFlightDate(simpleDateFormat.format(calendar.getTime()));
        bookingVO.getJourneyList().add(journeyVO);

        BookingInterface bookingDAO = sqlSession.getMapper(BookingInterface.class);
        String from = journeyVO.getAirportFromIATA();
        String to = journeyVO.getAirportToIATA();
        bookingVO.getProductList().add(bookingDAO.getProductVO(from, to));

        List<ProductVO> productList = bookingVO.getProductList();
        bookingVO.getFlightList().add(bookingDAO.getFlightVO(productList.get(0).getProductNum(), journeyVO.getFlightDate()));
        List<FlightVO> flightList = bookingVO.getFlightList().get(0);
        bookingVO.getSeatLeftList().add(bookingDAO.getSeatLeft(flightList));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("vo", bookingVO);
        modelAndView.addObject("aa", "dd");
        return modelAndView;
    }
    
    @GetMapping (value = "/JSP/flight/booking/booking3")
    public ModelAndView bookingView3(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("JSP/flight/booking/booking3");

        return modelAndView;
    }

    @PostMapping (value = "/JSP/flight/booking/booking4")
    public ModelAndView bookingView4(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("JSP/flight/booking/booking4");
        List<String> airportFroms = Arrays.asList(request.getParameter("airportFrom").split("#@!"));
        List<String> airportTos = Arrays.asList(request.getParameter("airportTo").split("#@!"));
        List<String> flightNums = Arrays.asList(request.getParameter("flightNum").split("#@!"));
        BookingInterface bookingDAO = sqlSession.getMapper(BookingInterface.class);

        modelAndView.addObject("airportFroms", airportFroms);
        modelAndView.addObject("airportTos", airportTos);
        modelAndView.addObject("flightList", bookingDAO.getFlightList(flightNums));

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
