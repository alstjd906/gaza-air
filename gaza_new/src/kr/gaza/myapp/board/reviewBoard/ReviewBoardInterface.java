package kr.gaza.myapp.board.reviewBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;

public interface ReviewBoardInterface {
	// 글쓰기
	public int reviewBoardInsert(ReviewBoardVO vo);
	// 글쓰고 뷰페이지 불러올 때 새로운 num 가져오기
	public int getInsertedNum(String memberId);
	// 수정
	public int reviewBoardUpdate(ReviewBoardVO vo);
	// 삭제
	public int reviewBoardDelete(int num);
	// 조회수
	public void reviewBoardHit(int num);
	// 목록
	public List<ReviewBoardVO> getAllRecord(ReviewBoardVO vo);
	// 총레코드수
	public int reviewBoardTotalRecord(int reviewType);
	// 글내용 보기
	public ReviewBoardVO reviewBoardSelect(ReviewBoardVO vo);
	// 글내용 보기에서 다음글, 이전글 제목가져오기
	public String reviewBoardGetTitles(int reviewNum, int reviewType);
	// 마지막 레코드 번호 가져오기
	public int reviewBoardGetLastNum(int tabType);
	// 이전 글, 다음 글 가져오기
	public ReviewBoardVO reviewBoardGetPrevNext(ReviewBoardVO vo);
}
