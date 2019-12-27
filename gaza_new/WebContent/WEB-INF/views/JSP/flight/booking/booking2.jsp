<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>항공권 예약 - 항공편 선택</title>
        <link rel="stylesheet" href="<%=css%>/booking.css">
        <!-- Font Awesome CDN -->
        <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
        <script>window.onbeforeunload=() => window.scrollTo(0, 0)</script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <%@ include file="/WEB-INF/views/JSP/common/nav.jspf" %>
        <c:set var="journeyList" value="${bookingVO.journeyList}"/>
        <c:set var="flightList" value="${bookingVO.flightList}"/>
        <c:set var="productList" value="${bookingVO.productList}"/>
        <c:set var="seatLeftList" value="${bookingVO.seatLeftList}"/>
        <div class="overlay"></div>
        <div class="cur-route itinerary">
            <c:if test="${bookingVO.journeyType == 'multi-way'}">
                <div class="row clearfix book-input-form multi-way-row">
                    <div class="col-fourth itinerary-select">
                        <label for="airportFrom-0">
                            <i class="fas fa-map-marker-alt"></i>
                            출발지
                        </label>
                        <input type="text" id="airportFrom-0" name="airportFrom-0" class="open-airport-picker" value="다구간" readonly>
                    </div>
                    <div class="col-fourth itinerary-select">
                        <label for="airportTo-0">
                            <i class="fas fa-map-marker-alt"></i>
                            도착지
                        </label>
                        <input type="text" id="airportTo-0" name="airportTo-0" class="open-airport-picker" value="다구간" readonly>
                    </div>
                    <div class="col-fourth itinerary-select">
                        <label for="flightDate-0">
                            <i class="far fa-calendar-alt"></i>
                            탑승일
                        </label>
                        <input type="text" id="flightDate-0" name="flightDate-0" class="flightDate" value="다구간" readonly>
                    </div>
                    <div class="col-fourth itinerary-select">
                        <label for="num-of-passengers">
                            <i class="fas fa-user"></i>
                            탑승객
                        </label>
                        <input type="text" id="num-of-passengers-0" name="num-of-passengers-0" value="${journeyList[0].numOfPassengers}" readonly>
                    </div>
                    <a href="javascript:" onclick="return input_check()"><i class="fas fa-redo-alt"></i></a>
                </div>
            </c:if>
            <c:set var="numOfJourney" value="${fn:length(journeyList)}"/>
            <c:if test="${bookingVO.journeyType == 'round-way'}">
                <c:set var="numOfJourney" value="1"/>
            </c:if>
            <c:forEach var="i" begin="1" end="${numOfJourney}" step="1">
                <div class="row clearfix book-input-form">
                    <div class="col-fourth itinerary-select">
                        <label for="airportFrom-${i}">
                            <i class="fas fa-map-marker-alt"></i>
                            출발지
                        </label>
                        <input type="text" id="airportFrom-${i}" name="airportFrom-${i}" class="open-airport-picker" value="${journeyList[i-1].airportFrom}" readonly>
                    </div>
                    <div class="col-fourth itinerary-select">
                        <label for="airportTo-${i}">
                            <i class="fas fa-map-marker-alt"></i>
                            도착지
                        </label>
                        <input type="text" id="airportTo-${i}" name="airportTo-${i}" class="open-airport-picker" value="${journeyList[i-1].airportTo}" readonly>
                    </div>
                    <div class="col-fourth itinerary-select">
                        <label for="flightDate-${i}">
                            <i class="far fa-calendar-alt"></i>
                            탑승일
                        </label>
                        <input type="text" id="flightDate-${i}" name="flightDate-${i}" class="flightDate" value="${journeyList[i-1].flightDate}" readonly>
                    </div>
                    <c:if test="${i==1}">
                        <div class="col-fourth itinerary-select">
                            <label for="num-of-passengers">
                                <i class="fas fa-user"></i>
                                탑승객
                            </label>
                            <input type="text" id="num-of-passengers" name="num-of-passengers" value="${journeyList[0].numOfPassengers}" readonly>
                        </div>
                        <i class="fas fa-redo-alt"></i>
                    </c:if>
                </div>
            </c:forEach>
            <input type="hidden" name="trip-type" id="trip-type" value="${bookingVO.journeyType}">
        </div>
        
        <section class="content">
            <c:forEach var="i" begin="1" end="${fn:length(journeyList)}" step="1">
                <input type="hidden" value="${journeyList[i-1].airportFrom}" id="journey-airportFrom-${i}">
                <input type="hidden" value="${journeyList[i-1].airportTo}" id="journey-airportTo-${i}">
                <input type="hidden" value="${journeyList[i-1].flightDate}" id="journey-flightDate-${i}">
                <div id="journey-${i}" class="journey-wrapper clearfix">
                    <div class="journey-name-fixed hidden" name="journey-${i}">
                        <div class="row">
                            <i class="fas fa-plane-departure font-blue4"></i>
                            <span class="font-blue4">${journey[i-1]} 여정</span>
                            <span id="airportFrom-name-sticky-mini-${i}">
                                ${journeyList[i-1].airportFromIATA} <span>${journeyList[i-1].airportFromCity}</span>
                            </span>
                            <span id="airportTo-name-sticky-mini-${i}">
                                ${journeyList[i-1].airportToIATA} <span>${journeyList[i-1].airportToCity}</span>
                            </span>
                        </div>
                    </div>
                    
                    <div class="journey-name">
                        <i class="fas fa-plane-departure font-blue4"></i>
                        <span class="font-blue4">${journey[i-1]} 여정</span>
                        <br>
                        <div>
                            <span id="airportFrom-name-${i}">
                                ${journeyList[i-1].airportFromIATA} <span>${journeyList[i-1].airportFromCity}</span>
                            </span>
                            <span id="airportTo-name-${i}">
                                ${journeyList[i-1].airportToIATA} <span>${journeyList[i-1].airportToCity}</span>
                            </span>
                        </div>
                    </div>
                    <c:set var="flightDate" value="${journeyList[i-1].flightDate}"/>
                    <%
                        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String flightDate = (String)pageContext.getAttribute("flightDate");
                        Calendar calendar = Calendar.getInstance();
                        String[] flightDates = new String[7];
                        for (int i = 0; i < flightDates.length; i++) {
                            calendar.set(Integer.parseInt(flightDate.substring(0,4)),
                                    Integer.parseInt(flightDate.substring(5,7))-1,
                                    Integer.parseInt(flightDate.substring(8,10))+i-3);
                            flightDates[i] = transFormat.format(calendar.getTime());
                        }
                    %>
                    <div class="price-compare clearfix">
                        <div class="buttons btn-price-last-week"></div>
                        <c:forEach var="day" begin="1" end="7" step="1">
                            <div class="price-of-day">
                                <input type="radio" name="price-of-day-${i}" id="journey-${i}-price-${day}" <c:if test="${day==4}">checked</c:if>>
                                <label for="journey-${i}-price-${day}">
                                    <div class="date">
                                        <c:set var="flightDates" value="<%=flightDates%>"/>
                                        <fmt:parseDate var="flightDate2" value="${flightDates[day-1]}" pattern="yyyy-MM-dd"/>
                                        <fmt:formatDate value="${flightDate2}" pattern="MM.dd (E)"/>
                                    </div>
                                    <div class="price">
                                        <span>KRW</span>
                                        <fmt:formatNumber value="${cheapestPriceList[i-1][day-1]}" type="number"/>
                                    </div>
                                </label>
                            </div>
                        </c:forEach>
                        <div class="buttons btn-price-next-week"></div>
                    </div>
    
                    <div class="row sort-div clearfix">
                        <ul>
                            <li>
                                <input type="radio" id="sort-by-departure-time-${i}" class="checked" name="sort-by-${i}" checked>
                                <label for="sort-by-departure-time-${i}">
                                    출발시간순
                                </label>
                            </li>
                            <li><input type="radio" id="sort-by-arrival-time-${i}" name="sort-by-${i}">
                                <label for="sort-by-arrival-time-${i}">
                                    도착시간순
                                </label>
                            </li>
                            <li>
                                <input type="radio" id="sort-by-flight-time-${i}" name="sort-by-${i}">
                                <label for="sort-by-flight-time-${i}">
                                    비행시간순
                                </label>
                            </li>
                            <li>
                                <input type="radio" id="sort-by-price-${i}" name="sort-by-${i}">
                                <label for="sort-by-price-${i}">
                                    요금순
                                </label>
                            </li>
                        </ul>
                    </div>
    
                    <div class="ticket-table-wrapper scrollable">
                        <div class="row flight-table-title clearfix">
                            <div class="col-two-fifth">
                                <div class="col-four-fifth">
                                    출도착시간 (비행시간)
                                </div>
                                <div class="col-fifth">
                                    편명/기종
                                </div>
                            </div>
                            <div class="col-fifth">특가운임</div>
                            <div class="col-fifth">할인운임</div>
                            <div class="col-fifth">정상운임</div>
                        </div>
                        <table class="flight-ticket-table" cellspacing="0" cellpadding="0">
                            <col-group>
                                <col style="width: 8%">
                                <col style="width: 16%;">
                                <col style="width: 8%;">
                                <col style="width: 8%;">
                                <col class="ticket-wrapper">
                                <col class="ticket-wrapper">
                                <col class="ticket-wrapper">
                            </col-group>
                            <tbody>
                                <c:forEach var="j" begin="1" end="${fn:length(flightList[i-1])}" step="1">
                                    <c:set var="flight" value="${flightList[i-1]}"/>
                                    <c:set var="seatLeft" value="${seatLeftList[i-1]}"/>
                                    <c:set var="price" value="${productList[i-1].price * productList[i-1].productSale * flight[j-1].flightSale}"/>
                                    
<%--                                    날짜계산--%>
                                    <c:set var="departTime" value="${flight[j-1].departTime}"/>
                                    <c:set var="departLength" value="${fn:length(departTime)}"/>
                                    <c:set var="departDate" value="${fn:substring(departTime, 0, departLength-5)}"/>
                                    <c:set var="departHour" value="${fn:substring(departTime, departLength-5, departLength-3)}"/>
                                    <c:set var="departMin" value="${fn:substring(departTime, departLength-2, departLength)}"/>
                                    <c:set var="arriveTime" value="${flight[j-1].arriveTime}"/>
                                    <c:set var="arriveLength" value="${fn:length(arriveTime)}"/>
                                    <c:set var="arriveDate" value="${fn:substring(arriveTime, 0, arriveLength-5)}"/>
                                    <c:set var="arriveHour" value="${fn:substring(arriveTime, arriveLength-5, arriveLength-3)}"/>
                                    <c:set var="arriveMin" value="${fn:substring(arriveTime, arriveLength-2, arriveLength)}"/>
                                    
                                    <c:set var="flightDuration" value="${(arriveHour*60+arriveMin) - (departHour*60+departMin)}"/>
                                    <c:if test="${flightDuration<0}">
                                        <c:set var="flightDuration" value="${1440 - (departHour*60+departMin) + (arriveHour*60+arriveMin)}"/>
                                    </c:if>
                                    <fmt:formatNumber var="durationHour" value="${flightDuration/60}" pattern="0"/>
                                    <fmt:formatNumber var="durationMin" value="${flightDuration%60}" pattern="0" minIntegerDigits="2"/>
                                    <tr>
                                        <td>
                                            ${departHour}:${departMin}
                                        </td>
                                        <td style="background: url(<%=img%>/icon/flight-table.svg);">
                                            <div><i class="far fa-clock"></i>${durationHour}시간 ${durationMin}분</div>
                                            <div>직항</div>
                                        </td>
                                        <td>
                                            <c:if test="${departDate != arriveDate}"><div class="font-red next-day">+1 DAY</div></c:if>
                                            ${arriveHour}:${arriveMin}
                                        </td>
                                        <td>${flight[j-1].airplaneName}</td>
                                        <td>
                                            <input type="radio" name="flight-ticket-${i}" class="radio3 special-price-ticket" id="journey-${i}-ticket-row-${j}-1">
                                            <label for="journey-${i}-ticket-row-${j}-1"></label>
                                            <div>
                                                <span class="currency">KRW</span>
                                                <span class="price">
                                                    <fmt:formatNumber value="${price / 250}" pattern="0" var="price40"/>
                                                    <fmt:formatNumber value="${price40 * 100}" type="number"/>
                                                </span>
                                            </div>
                                            <div class="empty-seats">${seatLeft[j-1]}석</div>
                                        </td>
                                        <td>
                                            <input type="radio" name="flight-ticket-${i}" class="radio3 special-price-ticket" id="journey-${i}-ticket-row-${j}-2">
                                            <label for="journey-${i}-ticket-row-${j}-2"></label>
                                            <div>
                                                <span class="currency">KRW</span>
                                                <span class="price">
                                                    <fmt:formatNumber value="${price / 200}" pattern="0" var="price50"/>
                                                    <fmt:formatNumber value="${price50 * 100}" type="number"/>
                                                </span>
                                            </div>
                                            <div class="empty-seats">${seatLeft[j-1]}석</div>
                                        </td>
                                        <td>
                                            <input type="radio" name="flight-ticket-${i}" class="radio3 special-price-ticket clearfix" id="journey-${i}-ticket-row-${j}-3">
                                            <label for="journey-${i}-ticket-row-${j}-3"></label>
                                            <div>
                                                <span class="currency">KRW</span>
                                                <span class="price">
                                                    <fmt:formatNumber value="${price / 100}" pattern="0" var="price100"/>
                                                    <fmt:formatNumber value="${price100 * 100}" type="number"/>
                                                </span>
                                            </div>
                                            <div class="empty-seats">${seatLeft[j-1]}석</div>
                                        </td>
                                        <input type="hidden" value="${journeyList[i-1].airportFrom}">
                                        <input type="hidden" value="${journeyList[i-1].airportTo}">
                                        <input type="hidden" value="${flight[j-1].flightNum}">
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
            
            <div class="flex">
                <a href="javascript:history.back();"><button class="whiteBtn left">&lt; 이전</button></a>
                <a href="<%=jsp%>/flight/booking/booking3" onclick="toBooking3();"><button class="right blueBtn">다음 &gt;</button></a>
            </div>
            
            <ul class="list-type2 bg-gray6 last-note">
                <li class="list-inside-title">유의사항</li>
                <li>2019-10-07 (한국시간) 기준, 유류할증료와 세금 및 제반요금 포함된 성인 1인 운임이며, 운임은 수시로 변경될 수 있습니다.</li>
                <li>고객님의 예약 시간은 정기 스케쥴 변경, 정기 정비 작업 등으로 인하여 전 노선에 시간 변동 및 운항/비운항이 예고 없이 발생할 수 있음을 양지하여 주시기 바랍니다.</li>
                <li>예약 가능석은 실시간으로 변동되며, 탑승자 정보 입력 단계를 완료해야 좌석이 확약됩니다.</li>
                <li>항공권 구매 전 공동 운항에 대한 안내 사항을 확인하시기 바랍니다.</li>
                <li>항공권 운임에 따라 운임 규정이 상이하므로 반드시 운임 규정을 확인하시고 구매하시기 바랍니다.</li>
                <li>각 운임의 표기된 할인율은 고시 편의상 소수점 이하 반올림한 값임을 알려드립니다.</li>
            </ul>
            
            <!--탑승객 팝업-->
            <div class="pop-up-window-type1" id="num-of-passengers-window">
                <div class="itinerary">
                    <div class="row">
                        <p class="window-title">
                            탑승객 선택
                            <i class="fas fa-times btn-close"></i>
                        </p>
                    </div>
                    <br>
                    <div class="row clearfix book-input-form2">
                        <div class="col-third passenger-select number-box">
                            <p>성인 <span>(만 13세 이상)</span></p>
                            <button class="minus">-</button>

                            <input type="number" value="1" id="numOfAdult">
                            <button class="plus">+</button>
                        </div>
                        <div class="col-third passenger-select number-box">
                            <p>소아 <span>(만 2세 ~ 13세 미만)</span></p>
                            <button class="minus">-</button>
                            <input type="number" value="0" id="numOfChild">
                            <button class="plus">+</button>
                        </div>
                        <div class="col-third passenger-select number-box">
                            <p>유아 <span>(만 2세 미만)</span></p>
                            <button class="minus">-</button>
                            <input type="number" value="0" id="numOfInfant">
                            <button class="plus">+</button>
                        </div>
                    </div>
                    <div class="clearfix" id="ageCalc-btn-box">
                        <button id="btn-ageCalc">
                            나이 계산기
                            <i class="far fa-window-restore"></i>
                        </button>
                    </div>
                    <div class="row clearfix">
                        <ul class="list-type2">
                            <br>
                            <li class="passengerInfo">예약인원은 성인,소아, 유아를 포함하여 총 9명까지 선택 가능합니다.</li>
                            <li>전 구간에 소아와 함께 여행하는 동반 성인이 있을 경우, 소아 단독 항공권 구매가 가능합니다.</li>
                            <li>유아는 탑승일 기준 만 2세 미만까지이며, 좌석을 점유하지 않습니다.</li>
                        </ul>
                    </div>
                </div>
                
                <div class="btn-area">
                    <button class="blueBtn" id="selectBtn">선택</button>
                </div>
            </div>
    
            <!--나이계산기 팝업-->
            <div class="pop-up-window-type1 centeredX" id="btn-ageCalc-window">
                <div>
                    <p class="window-title">
                        나이계산기
                        <i class="fas fa-times btn-close"></i>
                    </p>
                </div>
                <p>계산하고자 하는 어린이의 생년월일을 선택하시면, 유아/소아 유무를 확인하실 수
                    있습니다.</p>
                <div class="form-area1">
                    <input type="number" id="txtBirthDate" placeholder="생년월일 8자리 입력 (예시:19700131)" maxlength="8" oninput="maxLengthCheck(this)">
                    <button class="blueBtn" id="btn-ageCalc-calc">계산하기</button>
                </div>
                <div id="ageCalc-result" class="font-red"></div>
            </div>
        </section>
        
        <!--datepicker용-->
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
        <!-- Moment Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>

        <!-- Lightpick CSS -->
        <link rel="stylesheet" href="<%=vendor%>/javascript-datepicker-lightpick/css/lightpick.css">

        <!-- Lightpick JS -->
        <script src="<%=vendor%>/javascript-datepicker-lightpick/js/lightpick.js"></script>
        <script src="<%=vendor%>/waypoints/jquery.waypoints.min.js"></script>
        <%@ include file="/WEB-INF/views/JSP/common/footer.jspf" %>
        <script src="<%=js%>/airportpicker.js"></script>
        <script src="<%=js%>/booking.js"></script>
    </body>
</html>