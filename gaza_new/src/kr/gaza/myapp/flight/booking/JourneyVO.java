package kr.gaza.myapp.flight.booking;

public class JourneyVO {
    private String airportFrom;
    private String airportFromCity;
    private String airportFromIATA;
    private String airportTo;
    private String airportToCity;
    private String airportToIATA;
    private String flightDate;
    private String flightClass;
    private String numOfPassengers;

    public String getAirportFrom() {
        return airportFrom;
    }

    public void setAirportFrom(String airportFrom) {
        this.airportFrom = airportFrom;
        this.airportFromCity = airportFrom.substring(0,airportFrom.lastIndexOf('('));
        this.airportFromIATA = airportFrom.substring(airportFrom.lastIndexOf('(')+1, airportFrom.lastIndexOf(')'));
    }

    public String getAirportFromCity() {
        return airportFromCity;
    }

    public void setAirportFromCity(String airportFromCity) {
        this.airportFromCity = airportFromCity;
    }

    public String getAirportFromIATA() {
        return airportFromIATA;
    }

    public void setAirportFromIATA(String airportFromIATA) {
        this.airportFromIATA = airportFromIATA;
    }

    public String getAirportTo() {
        return airportTo;
    }

    public void setAirportTo(String airportTo) {
        this.airportTo = airportTo;
        this.airportToCity = airportTo.substring(0,airportTo.lastIndexOf('('));
        this.airportToIATA = airportTo.substring(airportTo.lastIndexOf('(')+1, airportTo.lastIndexOf(')'));
    }

    public String getAirportToCity() {
        return airportToCity;
    }

    public void setAirportToCity(String airportToCity) {
        this.airportToCity = airportToCity;
    }

    public String getAirportToIATA() {
        return airportToIATA;
    }

    public void setAirportToIATA(String airportToIATA) {
        this.airportToIATA = airportToIATA;
    }

    public String getFlightDate() {
        return flightDate;
    }

    public void setFlightDate(String flightDate) {
        this.flightDate = flightDate;
    }

    public String getFlightClass() {
        return flightClass;
    }

    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }

    public String getNumOfPassengers() {
        return numOfPassengers;
    }

    public void setNumOfPassengers(String numOfPassengers) {
        this.numOfPassengers = numOfPassengers;
    }
}
