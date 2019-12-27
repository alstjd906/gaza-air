package kr.gaza.myapp.flight.booking;

import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;

import java.util.ArrayList;
import java.util.List;

public class BookingVO {
    private String journeyType;
    private List<JourneyVO> journeyList = new ArrayList<>();

    private List<ProductVO> productList = new ArrayList<>();
    private List<List<FlightVO>> flightList = new ArrayList<>();
    private List<List<Integer>> seatLeftList = new ArrayList<>();

    public String getJourneyType() {
        return journeyType;
    }

    public void setJourneyType(String journeyType) {
        this.journeyType = journeyType;
    }

    public List<JourneyVO> getJourneyList() {
        return journeyList;
    }

    public void setJourneyList(List<JourneyVO> journeyList) {
        this.journeyList = journeyList;
    }

    public List<ProductVO> getProductList() {
        return productList;
    }

    public void setProductList(List<ProductVO> productList) {
        this.productList = productList;
    }

    public List<List<FlightVO>> getFlightList() {
        return flightList;
    }

    public void setFlightList(List<List<FlightVO>> flightList) {
        this.flightList = flightList;
    }

    public List<List<Integer>> getSeatLeftList() {
        return seatLeftList;
    }

    public void setSeatLeftList(List<List<Integer>> seatLeftList) {
        this.seatLeftList = seatLeftList;
    }
}
