package kr.gaza.myapp.board.noticeBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeBoardInterface {
	// ���
	public List<NoticeBoardVO> getAllRecord(@Param("param1") int param1);
	// �ѷ��ڵ��
	public int noticeBoardTotalRecord(int noticeType);
	// �۳��� ����
	public NoticeBoardVO noticeBoardSelect(NoticeBoardVO vo);
	// �۳��� ���⿡�� ������, ������ ����������
	public String noticeBoardGetTitles(int noticeNum, int tabType);
	// ������ ���ڵ� ��ȣ ��������
	public int noticeBoardGetLastNum(int tabType);
	// ���� ��, ���� �� ��������
	public NoticeBoardVO noticeBoardGetPrevNext(int tabType, int noticeNum);
	// ��ȸ�� ����
	public void noticeHitUpdate(int noticeNum);
}
