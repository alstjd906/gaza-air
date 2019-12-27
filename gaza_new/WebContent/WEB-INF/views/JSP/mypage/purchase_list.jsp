<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>구매 내역</title>
        <link rel="stylesheet" href="<%=css %>/my_page.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
        <script>
	        $(function(){
	    		$("#btn-search1").click(function(){
	    			var startDate = document.getElementById("flightDate-1").value;
	    			var endDate = document.getElementById("flightDate-2").value;
	    			$.ajax({
	    				url:"<%=jsp%>/mypage/search_list",
	    				data: "startDate="+startDate+"&endDate="+endDate,
	    				success:function(result){
	    					$("#no-data").html(result);
	    				}
	    			});
	    		});
	        });
        </script>
    </head>
    <body>
    <%@ include file="../common/nav.jspf" %>
        <div class="overlay"></div>
        <section class="content">
            <h3>구매 내역</h3>
            <ul class="list-type2 list-border">
                <li>최근 12개월 이내에 구매하신 항공권의 결제/환불 내역 및 영수증을 확인하실 수 있습니다.</li>
                <li>가자에어 홈페이지 또는 모바일에서 결제/환불하신 내역만 조회가 가능하며, 예약센터 및 지점 공항 등에서 진행하신 결제, 여정변경, 취소 등의 내역은 조회가 불가하므로 양해 부탁
                    드립니다.</li>
                <li>마일리지 사용에 대한 내역은 ‘마일리지 적립/사용 내역’ 메뉴에서 확인하실 수 있습니다. <a href="">바로가기</a></li>
                <li>6월30일 이전 발권한 예약에 한하여 추가 예약변경이 있는 경우, 구매내역 조회가 일부 제한 됩니다. 추가 문의 사항은 각 지역 예약센터에서 도와 드리겠습니다.</li>
            </ul>

            <div class="purchase-inquire">
                <div class="purchase-list-container">
                    <div class="row clearfix">
                        <div class="col-fourth">조회 기간</div>
                        <div class="col-three-fourth">
                            <div class="row clearfix">
                                <div class="col-eighth">
                                    <input type="radio" class="radio1" name="period" id="month-1-1" checked>
                                    <label for="month-1-1">1개월</label>
                                </div>
                                <div class="col-eighth">
                                    <input type="radio" class="radio1" name="period" id="month-1-3">
                                    <label for="month-1-3">3개월</label>
                                </div>
                                <div class="col-eighth">
                                    <input type="radio" class="radio1" name="period" id="month-1-6">
                                    <label for="month-1-6">6개월</label>
                                </div>
                                <div class="col-eighth">
                                    <input type="radio" class="radio1" name="period" id="month-1-12">
                                    <label for="month-1-12">1년</label>
                                </div>
                                <div class="col-eighth">
                                    <input type="radio" class="radio1" name="period" id="month-1-custom">
                                    <label for="month-1-custom">직접입력</label>
                                </div>
                            </div>
                            <br>
                            <input type="button" class="blueBtn" value="조회하기" id="btn-search1">
                            <div>
                                <input type="text" id="flightDate-1" readonly> 부터
                                <input type="text" id="flightDate-2" readonly> 까지
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="length" value="${fn:length(list) }"/>
                <c:if test="${length != 0 }">
                <div class="section-title purchase-title">
                    <span class="font-brown" id="startDate"></span>부터
                    <span class="font-brown" id="endDate"></span>까지 조회 결과
                </div>
                <table>
                	<colgroup>
                		<col style="width:210px"/>
                		<col style="width:320px"/>
                		<col style="width:210px"/>
                		<col style="width:210px"/>
                		<col style="width:210px"/>
                	</colgroup>
                	<thead>
                		<tr>
                			<th>구매일</th>
                			<th>상품</th>
                			<th>결제금액</th>
                			<th>결제상태</th>
                			<th>비고</th>
                		<tr>
                	<thead>   
                    <tbody id="no-data">
                        <tr>
                            <td colspan="5">조회된 데이터가 없습니다.<td>
                        </tr>
                    </tbody>
                </table>
                </c:if>
                 <c:if test="${length == 0 }">
		            <div class="no-record">
		                <p>온라인에서 확인 가능한 구매내역이 없습니다.</p>
					                예약 관련 구매/환불 영수증 확인을 원하실 경우 구매내역 메뉴을 이용해주세요. <br>
					                가자에어 온라인 이외의 경로에서 예약한 내역을 확인하고 싶으실 경우 <span class="font-brown">예약센터 1588-8000</span> 또는 각 구매처로 연락 주시기
					                바랍니다.
		            </div>
            	</c:if>
            	</div>
        </section>
        
        <!-- Moment Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    
        <!-- Lightpick CSS -->
        <link rel="stylesheet" href="<%=vendor %>/javascript-datepicker-lightpick/css/lightpick.css">
        <!-- Lightpick JS -->
        <script src="<%=vendor %>/javascript-datepicker-lightpick/js/lightpick.js"></script>
        
        <%@ include file="../common/footer.jspf" %>
        <script src="<%=js %>/mypage.js"></script>
    </body>
</html>