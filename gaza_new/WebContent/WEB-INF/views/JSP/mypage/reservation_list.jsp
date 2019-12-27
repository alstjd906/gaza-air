<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>예약내역</title>
        <link rel="stylesheet" href="<%=css %>/my_page.css">
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
    <%@ include file="../common/nav.jspf" %>
        <div class="overlay"></div>
        <section class="content">
            <h3>예약 내역</h3>
            <ul class="list-type2 list-border">
                <li>가자에어 홈페이지 및 모바일을 통한 예약 또는 예약센터나 국내지점, 여행사를 통한 예약 중 가자에어클럽 회원번호가 반영된 예약을 조회하실 수 있습니다.</li>
                <li>탑승일이 지난 예약기록은 ‘항공권 구매내역’에서 확인하실 수 있습니다. <a href="<%=jsp %>/mypage/purchase_list" class="font-brown">구매내역 페이지로 이동</a></li>
                <li class="font-red">타인의 항공권을 예약/발권하신 경우 ‘예약정보로 찾기’를 통해 예약조회 서비스를 이용하실 수 있습니다.</li>
            </ul>
			<c:set var="length" value="${fn:length(flightI) }"/>
            <div id="result">  
            	<c:if test="${length == 0}">
            		<div class="no-record">
		                <p>온라인에서 확인 가능한 예약내역이 없습니다.</p>
				                예약 관련 구매/환불 영수증 확인을 원하실 경우 구매내역 메뉴을 이용해주세요. <br>
				                가자에어 온라인 이외의 경로에서 예약한 내역을 확인하고 싶으실 경우 <span class="font-brown">예약센터 1588-8000</span> 또는 각 구매처로 연락 주시기
				                바랍니다.
            		</div>
            	</c:if>
            	<c:if test="${length != 0}">
	                <div class="reserve-table">
	                    <div>
	                        <table>
	                            <colgroup>
	                                <col style="width: 100px;" />
	                                <col style="width: 200px" />
	                                <col style="width: 350px" />
	                                <col style="width: 200px" />
	                                <col style="width: 200px" />
	                                <col style="width: 110px" />
	                            </colgroup>
	                            <thead>
	                                <tr>
	                                    <th>여정</th>
	                                    <th>출발 일자</th>
	                                    <th>출발 - 도착지</th>
	                                    <th>도착 일자</th>
	                                    <th>편명</th>
	                                    <th>상세 보기</th>
	                                </tr>
	                            </thead>
	                            <tbody>
                                <tr>
                                        <td>
                                            <div>1</div>
                                        </td>
                                        <td>
                                            <div>2019.12.25  05:10</div>
                                        </td>
                                        
                                        <td>
                                            <div>서울/인천 → 울란바타르</div>
                                        </td>
                                        
                                        <td>
                                            <div>2019.12.25  13:50</div>
                                        </td>
                                        <td>
                                            <div>GZ107</div>
                                        </td>
                                        <td>
                                            <div><a href="<%=jsp %>/mypage/reservation_detail?orderedFlightNum=99999">
                                            	<input type="button" class="blueBtn" value="상세보기" id="detail0"></a>
                                            </div>
                                        </td>
                                    </tr>
	                             <c:forEach var="i" begin="1" end="${length}" step="1">
                                <fmt:parseDate value="${flightI[i-1].departTime}" pattern="yyyy-MM-dd HH:mm" var="depart"/>
                                <fmt:formatDate var="date1" pattern="yyyy-MM-dd HH:mm" value="${depart }"/>
                                <fmt:parseDate value="${flightI[i-1].arriveTime}" pattern="yyyy-MM-dd HH:mm" var="arrive"/>
                                 <fmt:formatDate var="arriveTime" pattern="yyyy-MM-dd HH:mm" value="${arrive }"/>  
                                    <tr>
                                        <td>
                                            <div>${i+1 }</div>
                                        </td>
                                        <td>
                                            <div>${date1 }</div>
                                        </td>
                                        
                                        <td>
                                            <div>${flightI[i-1].departCity } → ${flightI[i-1].arriveCity }</div>
                                        </td>
                                        
                                        <td>
                                            <div>${arriveTime }</div>
                                        </td>
                                        <td>
                                            <div>${flightI[i-1].airplaneName }</div>
                                        </td>
                                        <td>
                                            <div><a href="<%=jsp %>/mypage/reservation_detail?orderedFlightNum=${orderedFlightNumList[i-1]}">
                                            	<input type="button" class="blueBtn" value="상세보기" id="detail1"></a>
                                            </div>
                                        </td>
                                    </tr>
                                   </c:forEach>    
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </c:if>
            </div>
           
    
            <ul class="list-type2 last-note bg-gray6">
                <li class="list-inside-title">유의사항</li>
                <li>국내선 항공권 예약변경은 항공편 출발 30분전까지 가능합니다.</li>
                <li>국제선 항공권 예약변경은 항공편 출발 2시간 전까지 가능합니다.</li>
                <li>구매한 항공권에 대한 예약변경 및 환불 시 운임규정에 따른 예약변경 수수료 (재발행 수수료) 및 환불 위약금 또는 환불 수수료가 징수될 수 있습니다.</li>
                <li>구매 이후 항공권의 지불 수단 변경은 불가합니다.</li>
                <li>취소된 예약 확인 후에는 예약번호가 온라인 예약 목록에서 삭제되오니 이용에 참고하시기 바랍니다.</li>
                <li>홈페이지 (모바일)에서 2명 이상 동시에 예약, 발권 완료하여 동일한 예약번호로 예약된 경우 일부 인원 만 변경 및 환불 불가하므로 재구매 후 기존 항공권은 홈페이지에서 환불하여 주시기 바랍니다.</li>
                <li>마일리지 좌석승급의 경우 추후 홈페이지에서 여정변경 및 환불이 불가합니다.</li>
            </ul>
        </section>
    	<%@ include file="../common/footer.jspf" %>
        <!-- Moment Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <!-- Lightpick CSS -->
        <link rel="stylesheet" href="<%=vendor %>/javascript-datepicker-lightpick/css/lightpick.css">
        <!-- Lightpick JS -->
        <script src="<%=vendor %>/javascript-datepicker-lightpick/js/lightpick.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="<%=js %>/mypage.js"></script>
    </body>
</html>