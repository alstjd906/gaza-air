package kr.gaza.myapp;

import java.util.List;

import kr.gaza.myapp.board.noticeBoard.NoticeBoardVO;
import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;
import kr.gaza.myapp.eventPackage.AllianceVO;

public interface HomeInterface {
	//이벤트 글 가져오기
	public List<AllianceVO> getEvent();
	
	//공지사항 글 가져오기
	public List<NoticeBoardVO> getNotice();
	
	//이용후기 글 가져오기
	public List<ReviewBoardVO> getReview();
}
