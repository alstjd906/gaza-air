package kr.gaza.myapp.flight.booking;

public class PassengerVO {
    public int passengerNum;
    public int peopleNum;
    public String passengerName;
    public String passengerBirth;
    public int flightNum;

    public int getPassengerNum() {
        return passengerNum;
    }

    public void setPassengerNum(int passengerNum) {
        this.passengerNum = passengerNum;
    }

    public int getPeopleNum() {
        return peopleNum;
    }

    public void setPeopleNum(int peopleNum) {
        this.peopleNum = peopleNum;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerBirth() {
        return passengerBirth;
    }

    public void setPassengerBirth(String passengerBirth) {
        this.passengerBirth = passengerBirth;
    }

    public int getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(int flightNum) {
        this.flightNum = flightNum;
    }
}
