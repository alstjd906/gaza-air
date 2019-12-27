package kr.gaza.myapp.flight.payment;

import kr.gaza.myapp.flight.booking.PassengerVO;

public interface PaymentInterface {
//    public List<PaymentVO> getAllRecord();
//
//    public int paymentInsert(EventVO vo);
//
//    public int paymentUpdate(EventVO vo);
//
//    public int paymentDelete(int num);
//
//    public void paymentSelect(EventVO vo);
	
	int creditInsert(CreditVO vo);
	
	int passengerInsert(PassengerVO vo);

	int paymentInsert(PaymentVO vo);
}