package kr.gaza.myapp.myhome.reservation;

import java.util.List;

public interface ReservationInterface {
	//flightRecord 가져오기.
	public List<ReservationVO> flightRecord(int memberNum);
}
