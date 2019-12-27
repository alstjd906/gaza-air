CREATE SEQUENCE peoplenum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE foodnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE accountnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE creditnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Passengernum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE orderedFlightnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ordertblnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE paymentnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE adminnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE flightnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE seatReservenum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE seatTypenum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE membernum_sq
START WITH 1235
INCREMENT BY 1;

CREATE SEQUENCE productnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE favoritenum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE myMilesnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE milesnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE gradeTypenum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE eventnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE recommandproductnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE airportnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE noticeboardnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE reviewboardnum_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE replynum_sq
START WITH 1
INCREMENT BY 1;


CREATE TABLE seatReserve (
	seatReserveNum NUMBER NOT NULL,
	flightNum NUMBER NOT NULL,
	seatType NUMBER NOT NULL,
	seatNo NUMBER NOT NULL,
	reserved NUMBER
);

CREATE TABLE seat (
	seatType NUMBER NOT NULL,
	seatContent VARCHAR2(255) NOT NULL
);

CREATE TABLE reviewBoardReply (
	replyNum NUMBER NOT NULL,
	commentt VARCHAR2(1000),
	memberId VARCHAR2(15) NOT NULL,
	reviewNum NUMBER,
	ip VARCHAR2(20),
	writeDate DATE
);

CREATE TABLE reviewBoard (
	reviewNum NUMBER NOT NULL,
	reviewType NUMBER NOT NULL,
	subject VARCHAR2(200) NOT NULL,
	content CLOB NOT NULL,
	writer VARCHAR2(15) NOT NULL,
	hit NUMBER,
	regdate DATE NOT NULL,
	ip VARCHAR(20) NOT NULL
);

CREATE TABLE recommandProduct (
	recommandNum NUMBER NOT NULL,
	productNum NUMBER,
	regdate DATE DEFAULT sysdate,
    rcontent varchar2(200) not null
);

CREATE TABLE product (
	productNum NUMBER NOT NULL,
	depart VARCHAR2(5) NOT NULL,
	arrive VARCHAR2(5) NOT NULL,
	price NUMBER NOT NULL,
	productCnt NUMBER NOT NULL,
	sale NUMBER,
	regdate DATE DEFAULT sysdate
);

CREATE TABLE people (
	peopleNum NUMBER NOT NULL,
	peopleType VARCHAR2(10) NOT NULL,
	peopleSale Number NOT NULL
);

CREATE TABLE payment (
	payNum NUMBER NOT NULL,
	orderNum NUMBER NOT NULL,
	memberNum NUMBER NOT NULL,
	milesNum NUMBER NOT NULL,
	paymentType NUMBER NOT NULL,
	totalPrice NUMBER NOT NULL,
	payDate DATE NOT NULL
);

CREATE TABLE ordertbl (
	orderNum NUMBER NOT NULL
);

CREATE TABLE orderedFlight (
	orderedFlightNum NUMBER NOT NULL,
	orderNum NUMBER,
	foodNum NUMBER,
	PassengerNum NUMBER,
	seatReserveNum NUMBER,
	flightNum NUMBER NOT NULL
);

CREATE TABLE noticeBoard (
	noticeNum NUMBER NOT NULL,
	noticeType NUMBER NOT NULL,
	subject VARCHAR2(200) NOT NULL,
	content CLOB NOT NULL,
	hit NUMBER,
	regdate DATE DEFAULT sysdate NOT NULL
);

CREATE TABLE miles (
	milesNum NUMBER NOT NULL,
	point NUMBER,
	startDate DATE DEFAULT sysdate
);

CREATE TABLE member (
	memberNum NUMBER NOT NULL,
	memberId VARCHAR2(15) NOT NULL,
	memberPwd VARCHAR2(15) NOT NULL,
	memberNameKor VARCHAR2(10) NOT NULL,
	memberNameEng VARCHAR2(30) NOT NULL,
	nation VARCHAR2(50) NOT NULL,
	gender VARCHAR2(1) NOT NULL,
	tel VARCHAR2(13) NOT NULL,
	altTel VARCHAR2(13),
	zipcode VARCHAR2(5) NOT NULL,
	addr VARCHAR2(100) NOT NULL,
	detailaddr VARCHAR2(50),
	email VARCHAR2(50) NOT NULL,
	birthday VARCHAR2(10) NOT NULL,
	agree VARCHAR2(200) NOT NULL,
	directronic VARCHAR2(200),
	flightcnt NUMBER DEFAULT 0,
	regdate DATE DEFAULT sysdate NOT NULL
);

CREATE TABLE grade (
	gradeType VARCHAR2(30) NOT NULL,
	needmiles NUMBER
);

CREATE TABLE food (
	foodNum NUMBER NOT NULL,
	foodType VARCHAR2(30),
	foodName VARCHAR2(30),
	foodImg VARCHAR2(100),
	foodContent VARCHAR2(255),
	foodingredient VARCHAR2(255),
	foodPrice NUMBER
);

CREATE TABLE flight (
	flightNum NUMBER NOT NULL,
	airplaneName VARCHAR2(20) NOT NULL,
	productNum NUMBER NOT NULL,
	departTime VARCHAR2(30) NOT NULL,
	arriveTime VARCHAR2(30) NOT NULL,
	sale NUMBER
);

CREATE TABLE favorite (
	favoriteNum NUMBER NOT NULL,
	productNum NUMBER,
	memberNum NUMBER 
);

CREATE TABLE event (
	eventNum NUMBER NOT NULL,
	eventName VARCHAR2(50) NOT NULL,
	eventThumbnail VARCHAR2(100) NOT NULL,
	eventImg VARCHAR2(100) NOT NULL,
	eventContent VARCHAR2(255) NOT NULL,
	eventCompany VARCHAR(40) NOT NULL,
	startDate VARCHAR2(10) NOT NULL,
	endDate VARCHAR2(10) NOT NULL,
	regDate DATE DEFAULT sysdate
);

CREATE TABLE credit (
	creditNum NUMBER NOT NULL,
	payNum NUMBER,
	company VARCHAR2(20) NOT NULL,
	creditNo NUMBER NOT NULL,
	expireDate VARCHAR2(5) NOT NULL,
	creditName VARCHAR2(10) NOT NULL
);

CREATE TABLE airport (
	airportNum NUMBER NOT NULL,
	IATA VARCHAR2(5) NOT NULL,
	city VARCHAR2(50) NOT NULL,
	continent VARCHAR2(50) NOT NULL,
	latitude VARCHAR2(20) NOT NULL,
	longitude VARCHAR2(20) NOT NULL,
	cityimg VARCHAR2(100) NOT NULL
);

CREATE TABLE airplane (
	airplaneName VARCHAR2(20) NOT NULL,
	seatMAX NUMBER NOT NULL
);

CREATE TABLE admin (
	adminNum NUMBER NOT NULL,
	adminId VARCHAR2(15) NOT NULL,
	adminPwd VARCHAR2(15) NOT NULL,
	adminName VARCHAR2(10) NOT NULL,
	adminTel VARCHAR2(13) NOT NULL,
	adminEmail VARCHAR2(50) NOT NULL,
	adminRegdate DATE DEFAULT sysdate NOT NULL
);

CREATE TABLE account (
	accountNum NUMBER NOT NULL,
	payNum NUMBER,
	bankName VARCHAR2(20) NOT NULL,
	accountNo NUMBER NOT NULL,
	accountName VARCHAR2(10) NOT NULL
);

CREATE TABLE MyMiles (
	myMilesNum NUMBER NOT NULL,
	milesNum NUMBER,
	memberNum NUMBER
);

CREATE TABLE Passenger (
	PassengerNum NUMBER NOT NULL,
	peopleNum NUMBER NOT NULL,
	PassengerName VARCHAR2(10) NOT NULL,
	PassengerBirth VARCHAR2(10) NOT NULL,
	flightNum NUMBER NOT NULL
);