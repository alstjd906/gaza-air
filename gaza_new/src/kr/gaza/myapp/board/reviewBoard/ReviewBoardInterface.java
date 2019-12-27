package kr.gaza.myapp.board.reviewBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.gaza.myapp.board.reviewBoard.ReviewBoardVO;

public interface ReviewBoardInterface {
	// �۾���
	public int reviewBoardInsert(ReviewBoardVO vo);
	// �۾��� �������� �ҷ��� �� ���ο� num ��������
	public int getInsertedNum(String memberId);
	// ����
	public int reviewBoardUpdate(ReviewBoardVO vo);
	// ����
	public int reviewBoardDelete(int num);
	// ��ȸ��
	public void reviewBoardHit(int num);
	// ���
	public List<ReviewBoardVO> getAllRecord(ReviewBoardVO vo);
	// �ѷ��ڵ��
	public int reviewBoardTotalRecord(int reviewType);
	// �۳��� ����
	public ReviewBoardVO reviewBoardSelect(ReviewBoardVO vo);
	// �۳��� ���⿡�� ������, ������ ����������
	public String reviewBoardGetTitles(int reviewNum, int reviewType);
	// ������ ���ڵ� ��ȣ ��������
	public int reviewBoardGetLastNum(int tabType);
	// ���� ��, ���� �� ��������
	public ReviewBoardVO reviewBoardGetPrevNext(ReviewBoardVO vo);
}
