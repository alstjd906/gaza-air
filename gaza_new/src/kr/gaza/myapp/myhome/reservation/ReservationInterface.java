package kr.gaza.myapp.myhome.reservation;

import java.util.List;

public interface ReservationInterface {
	//flightRecord ��������.
	public List<ReservationVO> flightRecord(int memberNum);
}
