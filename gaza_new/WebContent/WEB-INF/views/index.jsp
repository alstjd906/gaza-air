<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>가자에어</title>
        <!-- css -->
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/index.css" type="text/css"/>
        <!-- Lightpick CSS -->
        <link rel="stylesheet" href="<%=path %>/Vendor/javascript-datepicker-lightpick/css/lightpick.css">
        <!-- jqery js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- image Slide Js -->
        <script src="<%=path %>/Resources/JS/index.js"></script>
        <script src="<%=path %>/Vendor/backstretch/jquery.backstretch.min.js"></script>
        <script src="<%=path %>/Vendor/bxSlider/jquery.bxslider.min.js"></script>
        <link href="<%=path %>/Vendor/bxSlider/jquery.bxslider.css" rel="stylesheet" />
        <!-- fontawesome Js -->
        <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
        <!-- Moment Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <!-- Lightpick JS -->
        <script src="<%=path %>/Vendor/javascript-datepicker-lightpick/js/lightpick.js"></script>
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <div class="overlay"></div>
        <%@ include file="JSP/common/nav.jspf" %>
        <section id="main" style="width: 100%; min-width:1240px; overflow: hidden">
            <!-- 슬라이더 컨트롤러 -->
            <div class="slideControler">
                <div class="dotsWrap"><div class="playState"></div></div>
            </div>
            <!-- 심플예약폼 -->
            <form method="get" action="<%=jsp%>/simpleBooking">
                <div class="reserve_wrap">
                    <div class="reserveBox">
                        <div>
                            <div id="fromText" class="locText">
                                <i></i>
                                <div></div>
                            </div>
                            <input type="text" id="airportFrom-1" name="airportFrom-1" class="open-airport-picker tripLoc" readonly placeholder="출발지">
                        </div>
                        <div class="tripDate">
                            <input type="text" id="fromDate" name="fromDate" placeholder="출발일" readonly>
                        </div>
                    </div>
                    <div class="reserveBox">
                        <div>
                            <div id="toText" class="locText">
                                <i></i>
                                <div></div>
                            </div>
                            <input type = "text" id="airportTo-1" name="airportTo-1" class="open-airport-picker tripLoc" readonly placeholder="도착지">
                        </div>
                        <div class="tripDate">
                            <input type="text" id="toDate" name="toDate" placeholder="귀국일" readonly>
                        </div>
                    </div>
                    <div class="reserveBox">
                        <div id="classSelect">
                            <div class="col-third">
                                <input type="radio" class="radio1" name="class-type" value="economy" id="economy" checked>
                                <label for="economy" class="firstRadio radioLabel">이코노미</label>
                            </div>
                            <div class="col-third">
                                <input type="radio" class="radio1" name="class-type" value="business" id="business">
                                <label for="business" class="radioLabel">비지니스</label>
                            </div>
                            <div class="col-third">
                                <input type="radio" class="radio1" name="class-type" value="first" id="first">
                                <label for="first"  class="radioLabel lastRadio">퍼스트</label>
                            </div>
                        </div>
                        <div id="passengerWrap">
                            <input type="text" id="num-of-passengers" name="num-of-passengers" readonly>
                        </div>
                    </div>
                    <div class="reserveBox">
                         <div id="waySelect">
                            <div class="col-third">
                                <input type="radio" class="radio1" name="trip-type" value="round-way" id="round-way" checked>
                                <label for="round-way" class="firstRadio radioLabel">왕복</label>
                            </div>
                            <div class="col-third">
                                <input type="radio" class="radio1" name="trip-type" value="single-way" id="single-way">
                                <label for="single-way" class="radioLabel">편도</label>
                            </div>
                            <div class="col-third">
                                <input type="radio" class="radio1" name="trip-type" value="multi-way" id="multi-way">
                                <label for="multi-way"  class="radioLabel lastRadio" onclick="location.href='<%=jsp%>/flight/booking/booking1?trip_type=multi-way'">다구간</label>
                            </div>
                        </div>
                        <img src="<%=path %>/Resources/IMG/icon/both_arrow2.png" title="출발지, 도착지 반대로 변경.">
                        <input type="submit" class="simple_reservation_submit" value="조회"/>
                    </div>
                </div>
            </form>
        </section>
    
        <section id="best">
            <div>
                <div class="sectionTitle"><p>추천 상품</p><a href="<%=jsp%>/eventNpackage/best_package">&nbsp;전체보기 +&nbsp;</a></div>
                <div id="bestBannerWrap">
                    <ul id="bestBanner">
                    	<c:forEach var="i" begin="0" end="19" step="5">
	                        <li>
	                        <fmt:formatNumber var="tabType" value="${i/5+1}" pattern="0"/>
		                        <a href="<%=jsp%>/eventNpackage/recommend_package?tabType=${tabType}">
	                                <div class="imgFrame">
	                                    <img src='<%=img%>${recommandList[i].cityImg }'/>
	                                </div>
	                                <div class="textBox">
	                                    <div>
	                                        <h5>${recommandList[i].city } GAZA~! </h5>
	                                        <div>${recommandList[i].rContent }</div>
	                                        <h6>더 보기<img src="<%=path %>/Resources/IMG/icon/ico_arrow_gray.png"/></h6>
	                                    </div>
	                                </div>
	                                <div class="imgTag">
	                                <c:choose>
	                                	<c:when test="${i==0 }">국내</c:when>
	                                	<c:when test="${i==5 }">아시아</c:when>
	                                	<c:when test="${i==10 }">유럽</c:when>
	                                	<c:when test="${i==15 }">미주</c:when>
	                                </c:choose>
	                                </div>
	                            </a>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
        <section id="event">
            <div>
                <div class="sectionTitle"><p>이벤트</p><a href="<%=jsp%>/eventNpackage/event_list">&nbsp;전체보기 +&nbsp;</a></div>
                <div class="eventBannerWrap">
                    <ul class="eventBanner">
	                    <c:forEach var="lst" items="${eventList }">
	                        <li><a href="<%=jsp %>/eventNpackage/event_detail?eventNum=${lst.eventNum}">
	                            <div class="eventDetail">
	                            	<br/><br/>
	                                <p>${lst.eventName }</p>
	                                <div>더 보기</div>
	                                <p>${lst.startDate }~${lst.endDate }</p>
	                            </div>
	                            <img src='<%=img %>/main${lst.eventThumbnail}' title="${lst.eventName }"/>
	                            </a>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
        <section id="info">
            <div id="infoWrap">
                <div id="notice">
                    <table>
                        <thead>
                            <tr>
                                <td>공지사항</td>
                                <td>
                                	<a href="<%=jsp %>/board/noticeBoard/noticeBoard_list?pageNum=1&tabType=0">
                                	<img title="더 보기" src="<%=img %>/icon/plus_box_ccc.png"/></a>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="lst" items="${noticeList }" end="6">
                            <tr>
                                <td>
                                	<a href="<%=jsp %>/board/noticeBoard/noticeBoard_view?
											noticeNum=${lst.noticeNum}&pageNum=1
											&tabType=${lst.noticeType}">${lst.subject }
									</a>
								</td>
                                <td>${lst.regdate}</td>
                            </tr>
						</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="review">
                    <table>
                        <thead>
                            <tr>
                                <td>이용후기</td>
                                <td>
	                                <a href="<%=jsp %>/board/reviewBoard/reviewBoard_list?pageNum=1&reviewType=0">
	                                <img title="더 보기" src="<%=path %>/Resources/IMG/icon/plus_box_ccc.png"/>
	                                </a>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="lst" items="${reviewList }" end="6">
	                            <tr>
	                                <td>
	                                	<a href="<%=jsp %>/board/reviewBoard/reviewBoard_view?
											reviewNum=${lst.reviewNum}&pageNum=1
											&reviewType=${lst.reviewType}">
											${lst.subject }
										</a>
									</td>
	                                <td>${lst.regdate}</td>
	                            </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <section class="content">
        </section>
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

                <div class="row clearfix">
                    <ul class="list-type2">
                        <br>
                        <li class="passengerInfo">예약인원은 성인,소아, 유아를 포함하여 총 9명까지 선택 가능합니다.</li>

                    </ul>
                </div>
            </div>

            <div class="btn-area">
                <button class="blueBtn" id="selectBtn">선택</button>
            </div>
        </div>

        <%@ include file="JSP/common/footer.jspf" %>
        <script src="<%=request.getContextPath() %>/Resources/JS/airportpicker.js"></script>
    </body>
</html>