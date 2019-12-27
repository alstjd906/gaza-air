package kr.gaza.myapp.admin;

public interface AdminEditInterface2 {
	public int insertSeat(AdminVO2 vo);
	public AdminVO2 seatAllSelect(int num);
	public int updateSeat(AdminVO2 vo);
	public int deleteSeat(int num);
	public int insertSeatReserve(AdminVO2 vo);
	public AdminVO2 seatReserveAllSelect(int num);
	public int updateSeatReserve(AdminVO2 vo);
	public int deleteSeatReserve(int num);
	public int insertPeople(AdminVO2 vo);
	public AdminVO2 peopleAllSelect(int num);
	public int updatePeople(AdminVO2 vo);
	public int deletePeople(int num);
	public int insertFood(AdminVO2 vo);
	public AdminVO2 foodAllSelect(int num);
	public int updateFood(AdminVO2 vo);
	public int deleteFood(int num);
	
}
