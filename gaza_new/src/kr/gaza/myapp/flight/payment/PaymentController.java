package kr.gaza.myapp.flight.payment;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.flight.booking.BookingInterface;
import kr.gaza.myapp.flight.booking.PassengerVO;

@Controller
public class PaymentController {
    @Autowired
    private SqlSession sqlSession;

    @PostMapping ("/JSP/flight/payment/payment")
    public ModelAndView paymentView1(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/JSP/flight/payment/payment");

        List<String> airportFroms = Arrays.asList(request.getParameter("airportFrom").split("#@!"));
        List<String> airportTos = Arrays.asList(request.getParameter("airportTo").split("#@!"));
        List<String> flightNums = Arrays.asList(request.getParameter("flightNum").split("#@!"));
        BookingInterface bookingDAO = sqlSession.getMapper(BookingInterface.class);

        modelAndView.addObject("airportFroms", airportFroms);
        modelAndView.addObject("airportTos", airportTos);
        modelAndView.addObject("flightList", bookingDAO.getFlightList(flightNums));

        return modelAndView;
    }

    @PostMapping("/JSP/flight/payment/payment-complete")
    public ModelAndView paymentView2(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/JSP/flight/payment/payment-complete");
//        PaymentInterface dao = sqlSession.getMapper(PaymentInterface.class);
//        HttpSession sess = request.getSession();
//        
//        //�� �޾ƿͼ� PassengerVO�� ���
//        PassengerVO pvo = new PassengerVO();
//        pvo.setFlightNum(flightNum);//�ö���Ʈ��ȣ
//        pvo.setPassengerBirth(pBirth);//�������
//        pvo.setPassengerName(pName);//�̸�
//        
//        //�ſ�ī�� insert
//        int cResult = dao.creditInsert(creVO);
//        
//        //passenger insert
//        int pResult = dao.passengerInsert(pvo);
//
//        PassengerVO passVO = new PassengerVO();
//        
//        //payment insert payNum, orderNum, memberNum, milesNum, paymentType, totalPrice, payDate
//        PaymentVO payVO = new PaymentVO();
//        int price =  Integer.parseInt(totalPrice);
//        payVO.setTotalPrice(price);
//        
//        System.out.println("���"+airportFrom);
//        System.out.println("����"+airportTo);
//        System.out.println("flightNum"+flightNum);
//        System.out.println("�°���"+passengers);
//        System.out.println("�°��̸�"+pName);
//        System.out.println("�°�����"+pBirth);
//        System.out.println("����"+price);
//        System.out.println("ī��ȸ��"+creVO.getCompany());
//        System.out.println("ī���ȣ"+creVO.getCreditNo());
//        System.out.println("ī�常��"+creVO.getExpireDate());
        
        
	    return modelAndView;
    }



























}
