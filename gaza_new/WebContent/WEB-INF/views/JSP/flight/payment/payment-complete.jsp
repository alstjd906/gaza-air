<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제완료</title>
    <link rel="stylesheet" href="<%=css%>/booking.css">
    <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
    <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
</head>
<body>
<%@ include file="../../common/nav.jspf" %>
    <section class="content">
        <h3>결제가 완료되었습니다.</h3>
        
        <div class="payment-complete-section">
            <div class="price-table">
                <div class="row clearfix">
                    <div class="col-fourth">총 결제금액</div>
                    <div class="col-fourth">사용마일리지</div>
                    <div class="col-fourth">총 할인금액</div>
                    <div class="col-fourth font-blue4">최종 결제금액</div>
                </div>
                <div class="row clearfix">
                    <div class="col-fourth">402,900 원</div>
                    <div class="col-fourth">0 원</div>
                    <div class="col-fourth">0 원</div>
                    <div class="col-fourth font-blue4">402,900 원</div>
                </div>
            </div>
        </div>
        
        <div class="payment-complete-section">
            <p>결제정보</p>
            <div class="payment-complete-table">
                <div class="row clearfix">
                    <div class="col-fifth">결제번호</div>
                    <div class="col-four-fifth">
                        2019234028
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-fifth">결제타입</div>
                    <div class="col-four-fifth">
                        카드
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-fifth">결제정보</div>
                    <div class="col-four-fifth">
                        삼성카드 / 1234-1234-1234-1234
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-fifth">결제금액</div>
                    <div class="col-four-fifth font-blue4">
                        1,007,200 원
                    </div>
                </div>
            </div>
        </div>
        
        <div class="payment-complete-section">
            <p>마일리지</p>
            <div class="payment-complete-table">
                <div class="row clearfix">
                    <div class="col-fifth">적립포인트</div>
                    <div class="col-four-fifth font-blue4">
                        1,007P
                    </div>
                </div>
            </div>
        </div>
        
        <div class="button-wrapper">
            <a href = "<%=path%>/"><input type = "button" value="홈으로" class="blueBtn"></a>
            <a href = "<%=jsp%>/mypage/reservation_list"><input type = "button" value="예약현황" class="whiteBtn"></a>
        </div>
    </section>
    <%@ include file="../../common/footer.jspf" %>
    <script src="<%=js%>/payment.js"></script>
</body>
</html>