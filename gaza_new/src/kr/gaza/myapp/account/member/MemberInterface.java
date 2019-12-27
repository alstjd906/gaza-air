package kr.gaza.myapp.account.member;

public interface MemberInterface {

	public boolean idCheck(String userId);

	public int insertRecord(MemberVO vo);

	public MemberVO login(MemberVO vo);

	public MemberVO getMember(MemberVO vo);

	public int updateRecord(MemberVO vo);

	public int updatePassword(String memberId, String oldPwd, String newPwd);

	public int delAccount(MemberVO vo);

	public String findId(MemberVO vo);

	public String findPw(MemberVO vo);
	
	public void verification(MemberVO vo);
	
	public int pwdChk(MemberVO vo);

	public String ipinCheck(boolean lookingForId, String id, String pw);
}
