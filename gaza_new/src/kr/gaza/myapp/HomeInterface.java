package kr.gaza.myapp;

import java.util.List;

import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;

public interface HomeInterface {
	//�̺�Ʈ �� ��������
	public List<AllianceVO> getEvent();
	
	//�������� �� ��������
	public List<NoticeBoardVO> getNotice();
	
	//�̿��ı� �� ��������
	public List<ReviewBoardVO> getReview();
}
