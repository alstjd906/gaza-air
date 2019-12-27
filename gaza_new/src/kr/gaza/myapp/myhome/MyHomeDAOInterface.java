package kr.gaza.myapp.myhome;

import java.util.List;

import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;

public interface MyHomeDAOInterface {
	public MyHomeVO memberRecord(int memberNum);
	
	public MyHomeVO memberMiles(int memberNum);
	
	public MyHomeVO memberGrade(int mymileage);
	
	public MyHomeVO memberNeedMileage(int mymileage);
	
	public List<MyHomeVO> orderNumList(int memberNum);
	
	public int flightList(int orderNum);
	
	public int getOrderedNum(int orderNum);
	
	public MyHomeVO flightInfo(int flightNum);
	
	public MyHomeVO DepAri(int productNum);
	//�̿��ı� �� ��������
	public List<ReviewBoardVO> getReview0(String memberId);
	//���ǻ��� �� ��������
	public List<ReviewBoardVO> getReview1(String memberId);
	
	public MyHomeVO departCity(String depart); 
	
	public MyHomeVO arriveCity(String arrive); 
}
