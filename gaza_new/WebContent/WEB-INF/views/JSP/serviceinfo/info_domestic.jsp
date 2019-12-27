<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>국내선 기내통신 판매</title>
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/information.css">
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <%@ include file="../common/nav.jspf" %>
        <%@ include file="info_nav.jspf" %>
        <section class="content">
            <h3>국내선 기내통신 판매</h3>
            <div class="info-banner">
                    <div class="banner-domestic-1">
                        <div>
                            <p>가자항공은 국내선 탑승 고객님을 위해 고유 캐릭터인 가자 색동이를 이용한 캐릭터 상품 및 로고상품, 일반상품을 통신판매하고 있습니다.</p>
                        </div>
                    </div>
                </div>
            <p class="section-title">기내통신 구입 방법</p>
            <ul class="list-type2">
	                <li>구입을 원하시는 고객님께서는 카탈로그 내에 있는 주문서를 작성하셔서 승무원에게 전달해 주시기바랍니다.</li>
	                <li>ASIANA SHOP 사이트를 방문하시면 더욱 다양한 상품들을 구입하실 수 있습니다.</li>
            	</ul>
             <p class="section-title">기내 아시아나 인기 로고 상품</p>
             <table class="table-list">
                <col-group>
                    <col style="width: 33.33%; height: 280px; padding: 20px; border: 1px solid #eee !important">
                    <col style="width: 33.33%; height: 280px; padding: 20px; border: 1px solid #eee !important">
                    <col style="height: 280px; padding: 20px; border: 1px solid #eee !important">
                </col-group>
                <tbody>
                    <tr>
                        <td class="text-align-center">
                            <div style="height: 300px; width: 100%;  background: url(<%=path%>/Resources/IMG/information/domestic.jpg) no-repeat 0 0; clear: both;"></div>
                            <div class="font-brown">가자항공 모형 비행기</div>
                            <div style="font-size: 110%">A380-800 비행기 축소모델입니다.<br/>(1:100, 1:150, 1:200 보유)</div>
                        </td>
                        <td class="text-align-center">
                            <div style="height: 300px; width: 100%;  background: url(<%=path%>/Resources/IMG/information/domestic2.jpg) no-repeat 0 0; clear: both;"></div>
                            <div class="font-brown">가자항공 에이프런</div>
                            <div style="font-size: 110%">착용감이 좋고 편리한 에이프런,<br/>자수장식이 멋스러움과 고급스러움을<br/> 더해줍니다.</div>
                           
                        </td>
                        <td class="text-align-center">
                            <div style="height: 300px; width: 100%;  background: url(<%=img%>/information/domestic3.jpg) no-repeat 0 0; clear: both;"></div>
                            <div class="font-brown">가자항공 기내담요</div>
                            <div style="font-size: 110%">가자항공에서 제작한 담요입니다.<br/>물세탁이 가능하고, 보관 및 사용이간편합니다.</div>
                            
                        </td>
                    </tr>
                </tbody>
            </table>
            <ul class="list-type2 last-note bg-gray5">
                <li class="list-inside-title">고객센터(CUSTOMER CENTER)</li>
                <li>국내 상담문의 : 080-330-3434</li>
                <li>평일 운영시간 : 08:00 ~ 12:00, 13:00 ~ 17:00 (주말 및 공휴일 제외)</li>
            </ul>
        </section>

        <%@ include file="../common/footer.jspf" %>
        <script src="<%=path %>/Resources/JS/information.js"></script>
    </body>
</html>
