package kr.gaza.myapp.flight.payment;

public class CreditVO {
    private int creditNum;
    private int payNum;
    private String company;
    private String creditNo;
    private String year;
    private String month;
    private String expireDate;
    private String creditName;

    public int getCreditNum() {
        return creditNum;
    }

    public void setCreditNum(int creditNum) {
        this.creditNum = creditNum;
    }

    public int getPayNum() {
        return payNum;
    }

    public void setPayNum(int payNum) {
        this.payNum = payNum;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCreditNo() {
        return creditNo;
    }

    public void setCreditNo(String creditNo) {
        this.creditNo = creditNo;
    }
    
    public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
		setExpireDate();
	}

	public String getExpireDate() {
        return expireDate;
    }

    public void setExpireDate() {
        expireDate = year+"/"+month;
    }

    public String getCreditName() {
        return creditName;
    }

    public void setCreditName(String creditName) {
        this.creditName = creditName;
    }
}
