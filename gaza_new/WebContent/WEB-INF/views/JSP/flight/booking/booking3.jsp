<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공권 예약 - 탑승자/예약자 정보입력</title>
    <link rel="stylesheet" href="<%=css%>/booking.css">
    <!-- 국제 전화번호-->
    <link rel="stylesheet" href="<%=vendor%>/intl-tel-input-16.0.0/build/css/intlTelInput.css">
    <script src="<%=vendor%>/intl-tel-input-16.0.0/build/js/intlTelInput.js"></script>
    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
    <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
</head>
<body>
<%@ include file="../../common/nav.jspf" %>
    <div class="overlay"></div>
    <section class="content">
    
        <h3>탑승자 정보</h3>
        
        <ul class="list-type2 last-note">
            <li>반드시 실제 탑승하실 분의 성명을 입력하십시오. (예약 후 변경이 불가합니다)</li>
            <li>외국 국적이신 경우 성함을 여권상 영문으로 입력하여 주시기 바랍니다.</li>
            <li>탑승 완료 후에는 소급하여 할인을 적용 받을 수 없으므로 할인 대상 손님께서는 항공권 구입, 탑승 시 할인 증빙서류를 소지하여 주시기 바랍니다.</li>
            <li>소아/유아 동반 시, 반드시 나이를 확인할 수 있는 서류를 준비하시기 바랍니다.</li>
            <li>임신 32주 이상의 임신부 고객은 탑승이 제한될 수 있으니 사전에 확인하시기 바랍니다. (37주 이상은 탑승불가)&nbsp; 
                <a href="https://flyasiana.com/C/KR/KO/contents/traveling-while-pregnant?/cms/contents/menu/CM201802220000728319?menuId=CM201802220000728319" target="_blank" class="btn_arrow">
                    <i class="fas fa-exclamation pregnant-hint"></i>
                </a>
            </li>
        </ul>
    
        <h3 id="reservation-info">예약자 연락처 정보</h3>
        <ul class="list-type2">
            <li>예약정보수신 연락처에 작성하신 이메일로 구매 결과와 여정안내서를 전송해드립니다.</li>
        </ul>
        <div class="table-form">
            <div class="row clearfix">
                <div class="table-row-title">
                    이메일
                </div>
                <div>
                    <input type="text" id="emailAddress" nname="emailAddress" placeholder="이메일 입력" title="이메일 아이디 입력" style="width:200px;"> @ &nbsp;
                    <select id="emailDomain" name="emailDomain" title="이메일 도메인 선택" style="width:180px; margin-top: -3px;">
                        <option value="" selected>직접입력</option>
                        <option value="korea.com">korea.com</option>
                        <option value="dreamwiz.com">dreamwiz.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="lycos.co.kr">lycos.co.kr</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                        <option value="netian.com">netian.com</option>
                        <option value="empal.com">empal.com</option>
                        <option value="hanmir.com">hanmir.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="hanafos.com">hanafos.com</option>
                        <option value="chol.com">chol.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="aol.com">aol.com</option>
                        <option value="sbcglobal.net">sbcglobal.net</option>
                        <option value="hotmail.co.kr">hotmail.co.kr</option>
                        <option value="yahoo.co.jp">yahoo.co.jp</option>
                    </select>
                    <input type="text" id="emailDomainText" name="emailDomainText" placeholder="도메인 입력" title="이메일 도메인 입력" style="width:298px;">
                </div>
            </div>
            <div class="row clearfix">
                <div class="table-row-title">
                    전화번호
                </div>
                <div class="two-in-row">
                    <input id="phone" name="phone" type="text">
                </div>
                <div class="table-row-title">
                    수신동의
                </div>
                <div class="two-in-row receive-type-wrapper">
                    <input type="checkbox" id="email" class="checkbox3" checked>
                    <label for="email" class="checkbox3">이메일</label>
                    <input type="checkbox" id="sms" class="checkbox3" checked>
                    <label for="sms" class="checkbox3">SMS</label>
                </div>
            </div>
        </div>

        <div class="flex">
            <a href="javascript:history.back()"><button class="whiteBtn left">&lt; 이전</button></a>
            <a href="javascript:" onclick="return toBooking4()"><button class="right blueBtn">다음 &gt;</button></a>
        </div>

        <ul class="list-type2 bg-gray6 last-note">
            <li class="list-inside-title">유의사항</li>
            <li>예약 클래스에 따라 마일리지 적립이 불가하거나 적립률이 상이할 수 있으며, 실제 운항하는 항공사의 기준에 따라 적립이 이루어집니다.</li>
            <li>해당 항공사 마일리지 적립 규정상 적립이 불가한 경우에는 회원번호를 입력하셔도 적립이 되지 않습니다.</li>
            <li>실제 운항항공사가 스타얼라이언스 및 마일리지 제휴항공사가 아닌 공동운항편은 아시아나클럽 계정으로 사후 적립만 가능합니다.<br>현재 시스템 문제로, 숫자와 영문을 조합한 이메일 주소만 사용 가능합니다.</li>
        </ul>
    </section>
    <form action="<%=jsp %>/flight/booking/booking4" method="post" id="booking3frm">
        <input type="hidden" name="airportFrom">
        <input type="hidden" name="airportTo">
        <input type="hidden" name="flightNum">
    </form>
    <%@ include file="../../common/footer.jspf" %>
    <script src="<%=js%>/booking.js"></script>
</body>
</html>