package kr.gaza.myapp.myhome;

public class MyHomeVO {
	private int memberNum;
	private String memberNameKor;
	private String memberNameEng;
	private String memberGrade;
	private int memberFlightCnt;
	private int myMileage; 
	private int needMileage;
	private int myNeedMileage;
	private int orderedFlightNum;
	private int flightNum;
	private int orderNum;
	private int productNum;
	private String departTime;
	private String arriveTime;
	private String airplaneName;
	private String depart;
	private String arrive;
	private String departCity;
	private String arriveCity;

	
	
	
	public String getDepartCity() {
		return departCity;
	}
	public void setDepartCity(String departCity) {
		this.departCity = departCity;
	}
	public String getArriveCity() {
		return arriveCity;
	}
	public void setArriveCity(String arriveCity) {
		this.arriveCity = arriveCity;
	}
	public int getOrderedFlightNum() {
		return orderedFlightNum;
	}
	public void setOrderedFlightNum(int orderedFlightNum) {
		this.orderedFlightNum = orderedFlightNum;
	}
	public int getFlightNum() {
		return flightNum;
	}
	public void setFlightNum(int flightNum) {
		this.flightNum = flightNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getDepartTime() {
		return departTime;
	}
	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getAirplaneName() {
		return airplaneName;
	}
	public void setAirplaneName(String airplaneName) {
		this.airplaneName = airplaneName;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public int getNeedMileage() {
		return needMileage;
	}
	public int getMyNeedMileage() {
		return myNeedMileage;
	}
	public void setMyNeedMileage(int myNeedMileage) {
		this.myNeedMileage = myNeedMileage;
	}
	public void setNeedMileage(int needMileage) {
		this.needMileage = needMileage;
	}
	private int favoriteCnt; 
	
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberNameKor() {
		return memberNameKor;
	}
	public void setMemberNameKor(String memberNameKor) {
		this.memberNameKor = memberNameKor;
	}
	public String getMemberNameEng() {
		return memberNameEng;
	}
	public void setMemberNameEng(String memberNameEng) {
		this.memberNameEng = memberNameEng;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public int getMemberFlightCnt() {
		return memberFlightCnt;
	}
	public void setMemberFlightCnt(int memberFlightCnt) {
		this.memberFlightCnt = memberFlightCnt;
	}
	public int getMyMileage() {
		return myMileage;
	}
	public void setMyMileage(int availableMileage) {
		this.myMileage = availableMileage;
	}
	public int getFavoriteCnt() {
		return favoriteCnt;
	}
	public void setFavoriteCnt(int favoriteCnt) {
		this.favoriteCnt = favoriteCnt;
	}
	
	
}
