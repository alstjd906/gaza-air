<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>이용안내</title>
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/information.css">
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <%@ include file="../common/nav.jspf" %>
        <%@ include file="info_nav.jspf" %>
        <section class="content info-reservation">
            <h3>이용안내</h3>
            <div id="tab-1-container">
                <div class="info-banner">
                    <div class="banner-baggage-1">
                        <div>
                            <p class="banner-title">수하물이란?</p>
                            <p>수하물은 고객이 여행 시 휴대 또는 탁송을 의뢰한 소지품 및 물품을 의미하는 단어입니다.<br/>
							     짐을 준비하시는 고객님의 여행이 한결 편안할 수 있도록 꼭 알아두셔야 하는 수하물 관련<br/>정보를 안내해 드리고 있습니다.</p>
                        </div>
                    </div>
                </div>
                
                <p class="section-title">수하물 종류</p>
                <ul class="list-type2">
	                <li>위탁수하물(Checked Baggage) : 고객이 항공사에 탁송 의뢰하여 수하물표를 발행한 수하물</li>
	                <li>휴대수하물(Carry on Baggage) : 위탁수하물이 아닌, 기내에 휴대하여 운송하는 수하물</li>
	            </ul>
	            
	             <p class="section-title">여행 가방 준비하는 방법</p>
                <ul class="list-type2">
	                <li>영문으로 작성한 이름과 연락처가 기재된 이름표를 가방 외부의 잘 보이는 부분에 부착해 주십시오.</li>
	                <li>항공사에서 지정한 크기와 무게를 지켜서 준비하여 주시고, 내용품이 손상되지 않도록 적절히 포장을 하십시오.</li>
	            </ul>
                </div>
        </section>
        <%@ include file="../common/footer.jspf" %>
        <script src="<%=path %>/Resources/JS/information.js"></script>
    </body>
</html>