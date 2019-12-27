package kr.gaza.myapp.myhome.purchase;

import org.apache.ibatis.annotations.Param;

import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.myhome.MyHomeVO;

import java.util.List;

public interface PurchaseInterface {
	//flightRecord
	List<PurchaseVO> purchaseRecord(@Param("memberNum") int memberNum, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	public MyHomeVO memberRecord(int memberNum);
	
	public MyHomeVO memberMiles(int memberNum);
	
	public MyHomeVO memberGrade(int mymileage);
	
	public MyHomeVO memberNeedMileage(int mymileage);
	
	public List<MyHomeVO> orderNumList(int memberNum);
	
	public int flightList(int orderNum);
	
	public int productNum(int orderNum);
	
	public MyHomeVO flightInfo(int flightNum);
	
	public MyHomeVO DepAri(int productNum);
	//이용후기 글 가져오기
	public List<ReviewBoardVO> getReview0(String memberId);
	//문의사항 글 가져오기
	public List<ReviewBoardVO> getReview1(String memberId);
	
	public MyHomeVO departCity(String depart); 
	
	public MyHomeVO arriveCity(String arrive); 
	
	public PurchaseVO depAriList(int productNum);
}
