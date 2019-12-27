package kr.gaza.myapp.admin;

import kr.gaza.myapp.aviation.airplane.AirplaneVO;
import kr.gaza.myapp.aviation.airport.AirportVO;
import kr.gaza.myapp.aviation.flight.FlightVO;
import kr.gaza.myapp.aviation.product.ProductVO;
import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;

public interface AdminEditInterface {
	public int insertAdmin(AdminVO vo);
	public int deleteAdmin(int num);
	public int insertAirport(AirportVO vo);
	public AirportVO airportAllSelect(int num);
	public int updateAirport(AirportVO vo);;
	public int deleteAirport(int num);
	public int insertAirplane(AirplaneVO vo);
	public AirplaneVO airplaneAllSelect(String name);
	public int updateAirplane(AirplaneVO vo);
	public int deleteAirplane(AirplaneVO vo);
	public ProductVO productAllSelect(int num);
	public int insertProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(int num);
	public int insertFlight(FlightVO vo);
	public FlightVO flightAllSelect(int num);
	public int updateFlight(FlightVO vo);
	public int deleteFlight(int num);
	public NoticeBoardVO selectNotice(int num);
	public ReviewBoardVO selectReview(int num);
	public int insertNotice(NoticeBoardVO vo);
	public int deleteNotice(int num);
	public int insertAlliance(AllianceVO vo);
	public int deleteAlliance(int num);
}
