package kr.gaza.myapp.eventPackage;

import java.util.List;

public interface EPtravelInterface {
	public List<TravelVO> getAllRecord();
	
	public List<TravelVO> getBestRecord(int onePageRecord);
	
	public List<TravelVO> getSaleRecord(int onePageRecord);
}
