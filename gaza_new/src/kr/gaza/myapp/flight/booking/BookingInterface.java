package kr.gaza.myapp.flight.booking;

import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookingInterface {
    ProductVO getProductVO(@Param("from") String from, @Param("to") String to);
    List<FlightVO> getFlightVO(@Param("productNum") int productNum, @Param("flightDate") String flightDate);
    List<Integer> getSeatLeft(@Param("flightList") List<FlightVO> flightList);
    void addPassenger(PassengerVO passengerVO);
    List<FlightVO> getFlightList(List<String> flightNums);
}
