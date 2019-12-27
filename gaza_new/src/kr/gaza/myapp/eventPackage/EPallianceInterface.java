package kr.gaza.myapp.eventPackage;

import java.util.List;

public interface EPallianceInterface {
	public List<AllianceVO> getAllRecord();
	
	public int eventInsert(AllianceVO vo);
	
	public int eventUpdate(AllianceVO vo);
	
	public int eventDelete(int num);

	public AllianceVO eventSelect(AllianceVO vo);
}
