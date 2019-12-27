<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>마이 홈</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/Resources/CSS/my_page.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/Resources/CSS/navNfooter.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body id="mypage-main">
    <%@ include file="../common/nav.jspf" %>
       <section class="content">
            <div class="maintop">
                <div class="row clearfix">
                    <div id="nameDiv">
                        <div id="name-ko"><a href="#" class="font-white">${vo.memberNameKor}</a></div>
                        <div id="name-eng" class="font-gray3">${vo.memberNameEng}</div>
                    </div>
                    <div>
                        <div><a href="" class="font-gray3">총 탑승횟수</a></div>
                        <div id="tripNo">${vo.memberFlightCnt }</div>
                    </div>
                </div>

                <div class="row clearfix">
                    <div>
                        <div id="grade"><a href="#" class="font-white">${vo3.memberGrade }</a></div>
                        <div id="memberNo">777 888 9999</div>
                    </div>
                    <div>
                        <div><a href="" class="font-gray3">소멸 예정 마일리지</a></div>
                        <div id="mileage">0</div>
                    </div>
                </div>
                <div id="boarding">
                    <div>가자에어 탑승 <span>${vo.memberFlightCnt }</span></div>
                    <div>가자에어외 탑승 <span>0</span></div>
                    <div>일반 제휴 및 기타 <span>0</span></div>
                </div>
                <div class="circle">
                    <div><a href="" class="font-white">나의 마일리지</a></div><br>
                    <strong>${vo.myMileage }</strong>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-two-fifth">
                    <div class="section my-grade">
                        <div class="section-title bottom-border">
                            등급
                        </div>
                        <div><span id="username" class="font-brown">${vo.memberNameKor}</span> 님의</div>
                        <div>회원등급은 <span id="usergrade" class="font-blue4">${vo3.memberGrade }등급</span>입니다.</div>
                        <div><a href="<%=jsp%>/mypage/mypage_GradeInfo">
                    	<input type="button" class="blueBtn" value="등급혜택보기" id="grade-benefit"></a></div>
                    </div>
                </div>
                <div class="col-two-fifth">
                    <div class="section my-mileage">
                        <div class="section-title bottom-border">
                            마일리지
                        </div>
                        <br>
                        <div id="mileagebar">
                            <div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <span class="font-blue4">
                                    +
                                    <span id="usergradeup">${myNeedMiles}</span>
                                    마일
                                </span>
                                <span style="font-size: 80%">적립시 등급상승</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-fifth" onclick="location.href='interested_route'">
                    <div class="section interest-list">
                        <div class="section-title bottom-border">
                            관심노선
                        </div>
                        <div class="font-blue4">
                            3
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-line">
                    <div class="section reserve-table">
                        <div class="section-title">
                            최근 예약
                            <a href="#"><input type="button" value="전체내역보기" class="blueBtn"></a>
                        </div>
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
                           
                                <c:forEach var="i" begin="1" end="3" step="1">
                                <fmt:parseDate value="${flightI[i-1].departTime}" pattern="yyyy-MM-dd HH:mm" var="depart"/>
                                <fmt:formatDate var="date1" pattern="yyyy-MM-dd HH:mm" value="${depart }"/>
                                <fmt:parseDate value="${flightI[i-1].arriveTime}" pattern="yyyy-MM-dd HH:mm" var="arrive"/>
                                 <fmt:formatDate var="arriveTime" pattern="yyyy-MM-dd HH:mm" value="${arrive }"/>  
                                    <tr>
                                        <td>
                                            <div>${i }</div>
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
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-half">
                    <div class="section my-write">
                        <div class="section-title bottom-border">
                            나의 이용후기
                            <a href="<%=jsp %>/board/reviewBoard/reviewBoard_list?pageNum=1&reviewType=0">
                            	<input type="button" value="전체보기" class="blueBtn">
                            </a>
                        </div>
                        <div>
                            <ul class="list-type2">
                            <c:forEach var="lst" items="${reviewList0 }" end="4">
                                <li>
                                	<a href="<%=jsp %>/board/reviewBoard/reviewBoard_view?
											reviewNum=${lst.reviewNum}&pageNum=1
											&reviewType=${lst.reviewType}">${lst.subject }
									</a>
								</li>
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-half">
                    <div class="section my-question">
                        <div class="section-title bottom-border">
                            나의 문의사항
                            <a href="<%=jsp %>/board/reviewBoard/reviewBoard_list?pageNum=1&reviewType=1">
                            	<input type="button" value="전체보기" class="blueBtn">
                            </a>
                        </div>
                        <div>
                            <ul class="list-type2">
                                <c:forEach var="lst" items="${reviewList1 }" end="4">
                                <li>
                                	<a href="<%=jsp %>/board/reviewBoard/reviewBoard_view?
											reviewNum=${lst.reviewNum}&pageNum=1
											&reviewType=${lst.reviewType}">${lst.subject }
									</a>
								</li>
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
         <%@ include file="../common/footer.jspf" %>
        <script src="https://rawgit.com/kottenator/jquery-circle-progress/1.2.1/dist/circle-progress.js"></script>
        <script type="text/javascript">
        	let my_mileage = ${vo2.myMileage };
        	let need_mileage = ${myNeedMiles};
        </script>
        <script src="<%=request.getContextPath() %>/Resources/JS/mypage.js"></script>
       
    </body>
</html>