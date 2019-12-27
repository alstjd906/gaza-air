package kr.gaza.myapp.admin;

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

import java.util.List;

public interface AdminInterface {
    List<AdminVO> adminAllRecord();
    List<AirportVO> airportAllRecord();
    List<FlightVO> flightAllRecord();
    List<FoodVO> foodAllRecord();
    List<peopleVO> peopleAllRecord();
    List<ProductVO> productAllRecord();
    List<SeatReserveVO> seatReserveAllRecord();
    List<SeatVO> seatAllRecord();
    List<AllianceVO> allianceAllRecord();
    List<NoticeBoardVO> noticeAllRecord();
    List<ReviewBoardVO> reviewAllRecord();
    List<MemberVO> memberAllRecord();
    List<AirplaneVO> airplaneAllRecord();
    AdminVO login(AdminVO vo);
}
