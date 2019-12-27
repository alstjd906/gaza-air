<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 상세 페이지</title>
    <link rel="stylesheet" href="<%=css %>/my_page.css"type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
    <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    <script>
    	$(function(){
    		//버튼 클릭하면 닫기.
    		$('.closeBtn').on("click", function(){
    			$(".pop-up-window-type1").css("display", "none");
    			$(".overlay").css("display", "none");
    		});
    	});
    </script>
</head>
<body>
<%@ include file="../common/nav.jspf" %>
<!-- Todo 기내식,좌석,클래스 -->
	<div class="overlay"></div>
	<section class="content">
        <h3>예약 현황 상세 페이지</h3>
        <div></div>
        <p class="reservation-section-title">여정</p>
        <div class="trip-table table-form3">
            <div class="row clearfix table-row-title">
                <div class="col-eighth">여정</div>
                <div class="col-three-eighth">출도착시간</div>
                <div class="col-eighth">편명/기종</div>
                <div class="col-eighth">운임할인</div>
                <div class="col-eighth">상태</div>
                <div class="col-eighth">환불</div>
            </div>
            <div class="row clearfix">
                <div class="col-eighth trip-num">
                    <div class="font-brown">01</div>
                    <div>2019.09.14(토)</div>
                </div>
                <div class="col-three-eighth trip-detail">
                    <div class="col-fourth">
                        <div>서울 / 김포</div>
                        <div>06:05</div>
                    </div>
                    <div class="col-two-fourth flight-detail">
                        <span><i class="far fa-clock"></i> 1시간 10분</span>
                        <img src = "<%=img %>/icon/flight-table.svg" alt = "">
                        <span>직항</span>
                    </div>
                    <div class="col-fourth">
                        <div>제주</div>
                        <div>07:15</div>
                    </div>
                </div>
                <div class="col-eighth trip-airline"><div>OZ8901</div></div>
                <div class="col-eighth trip-type"><div>정상운임</div></div>
                <div class="col-eighth trip-refund">
                    <div class="O"></div>
                    수수료없음
                </div>
                <div class="col-eighth">
                    <input type="button" value="환불" class="blueBtn closeBtn" id="refundBtn" />
                </div>
            </div>
        </div>
        
        <p class="reservation-section-title">가격</p>
        <div class="flight-confirm-section">
            <div class="table-form3">
                <div class="row clearfix table-row-title">
                    <div class="col-two-fourth">여정</div>
                    <div class="col-fourth">구분</div>
                    <div class="col-fourth">금액 <span class="currency">(KRW)</span></div>
                </div>
                <div class="row clearfix" style="border: none">
                    <div class="col-two-fourth trip">
                        <div class="col-tenth">
                            <i class="fas fa-plane-departure"></i>
                        </div>
                        <div class="col-fourth">
                            <div class="airport-name">서울/김포</div>
                            <div class="flight-date">2019.09.14(토)</div>
                            <div class="flight-time">06:05</div>
                        </div>
                        <div class="col-two-fifth">
                            <div class="flight-image">
                                <img src = "<%=img %>/icon/flight-table.svg" alt = "">
                            </div>
                        </div>
                        <div class="col-fourth">
                            <div class="airport-name">제주</div>
                            <div class="flight-date">2019.09.14(토)</div>
                            <div class="flight-time">07:15</div>
                        </div>
                    </div>
                    <div class="col-fourth detailed-price">
                        <div>항공권 운임</div>
                        <div>세금 및 제반요금</div>
                        <div>유류할증료</div>
                        <div>승객</div>
                        <div>합계</div>
                    </div>
                    <div class="col-fourth detailed-price">
                        <div>120,000</div>
                        <div>4,000</div>
                        <div>5,500</div>
                        <div>성인 1</div>
                        <div>129,500</div>
                    </div>
                </div>
            </div>
            <br>
            <ul class="list-type2">
                <li>무료 수하물 허용량을 초과하는 경우 추가 수하물 요금이 부과될 수 있습니다.<a href="service_baggage.html" class="font-brown"> 수하물 안내</a></li>
                <li class="font-brown">타항공사 연결 시나 공동운항의 경우 운항항공사 자체 수하물 규정이 적용 될 수 있으므로 사전에 확인하여 주시기 바랍니다.</li>
            </ul>
        </div>
        
        <div class="edit-form-wrapper">
            <form action="">
                <div class="form-group">
                    <div class="col-xs-12">
                        <input type="checkbox" class="hidden" id="edit">
                        <label for="edit" class="whiteBtn btn">탑승객정보 수정</label>
                        <a href="javascript:" onclick="edit()"><button type="submit" class="btn blueBtn" id="editBtn">수정</button></a>
                        <a href="javascript:"><label for = "edit" class = "whiteBtn btn">취소</label></a>
                        <script>
                            document.getElementById('edit').addEventListener('change', () => {
                                const inputs = document.querySelectorAll('.table-form input');
                                inputs.forEach(input => input.removeAttribute('disabled'));
                            });
                            document.getElementById('editBtn').addEventListener('click', () => {
                                const inputs = document.querySelectorAll('.table-form input');
                                inputs.forEach(input => input.setAttribute('disabled', 'disabled'));
                            });
                        </script>
                    </div>
                </div>
                <p class="reservation-section-title">
                    탑승자 정보
                </p>
                <div class="table-form">
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 성 입력 (예:홍)" value="김" disabled>
                        </div>
                        <div class="table-row-title">
                            이름
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 이름 입력 (예:길동)" value="구용" disabled>
                        </div>
                    </div>
        
                    <div class="row clearfix">
                        <div class="table-row-title">
                            생년월일
                        </div>
                        <div>
                            <select title="생년월일&nbsp;연도" style="width: 200px" disabled>
                                <option value="">년</option>
                                <option value="2019">2019년</option>
                                <option value="2018">2018년</option>
                                <option value="2017">2017년</option>
                                <option value="2016">2016년</option>
                                <option value="2015">2015년</option>
                                <option value="2014">2014년</option>
                                <option value="2013">2013년</option>
                                <option value="2012">2012년</option>
                                <option value="2011">2011년</option>
                                <option value="2010">2010년</option>
                                <option value="2009">2009년</option>
                                <option value="2008">2008년</option>
                                <option value="2007">2007년</option>
                                <option value="2006">2006년</option>
                                <option value="2005">2005년</option>
                                <option value="2004">2004년</option>
                                <option value="2003">2003년</option>
                                <option value="2002">2002년</option>
                                <option value="2001">2001년</option>
                                <option value="2000" selected>2000년</option>
                                <option value="1999">1999년</option>
                                <option value="1998">1998년</option>
                                <option value="1997">1997년</option>
                                <option value="1996">1996년</option>
                                <option value="1995">1995년</option>
                                <option value="1994">1994년</option>
                                <option value="1993">1993년</option>
                                <option value="1992">1992년</option>
                                <option value="1991">1991년</option>
                                <option value="1990">1990년</option>
                                <option value="1989">1989년</option>
                                <option value="1988">1988년</option>
                                <option value="1987">1987년</option>
                                <option value="1986">1986년</option>
                                <option value="1985">1985년</option>
                                <option value="1984">1984년</option>
                                <option value="1983">1983년</option>
                                <option value="1982">1982년</option>
                                <option value="1981">1981년</option>
                                <option value="1980">1980년</option>
                                <option value="1979">1979년</option>
                                <option value="1978">1978년</option>
                                <option value="1977">1977년</option>
                                <option value="1976">1976년</option>
                                <option value="1975">1975년</option>
                                <option value="1974">1974년</option>
                                <option value="1973">1973년</option>
                                <option value="1972">1972년</option>
                                <option value="1971">1971년</option>
                                <option value="1970">1970년</option>
                                <option value="1969">1969년</option>
                                <option value="1968">1968년</option>
                                <option value="1967">1967년</option>
                                <option value="1966">1966년</option>
                                <option value="1965">1965년</option>
                                <option value="1964">1964년</option>
                                <option value="1963">1963년</option>
                                <option value="1962">1962년</option>
                                <option value="1961">1961년</option>
                                <option value="1960">1960년</option>
                                <option value="1959">1959년</option>
                                <option value="1958">1958년</option>
                                <option value="1957">1957년</option>
                                <option value="1956">1956년</option>
                                <option value="1955">1955년</option>
                                <option value="1954">1954년</option>
                                <option value="1953">1953년</option>
                                <option value="1952">1952년</option>
                                <option value="1951">1951년</option>
                                <option value="1950">1950년</option>
                                <option value="1949">1949년</option>
                                <option value="1948">1948년</option>
                                <option value="1947">1947년</option>
                                <option value="1946">1946년</option>
                                <option value="1945">1945년</option>
                                <option value="1944">1944년</option>
                                <option value="1943">1943년</option>
                                <option value="1942">1942년</option>
                                <option value="1941">1941년</option>
                                <option value="1940">1940년</option>
                            </select>
        
                            <select title="생년월일월" style="width: 200px" disabled>
                                <option value="">월</option>
                                <option value="01" selected>1월</option>
                                <option value="02">2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
        
                            <select title="생년월일일" style="width: 200px" disabled>
                                <option value="">일</option>
                                <option value="01" selected>1일</option>
                                <option value="02">2일</option>
                                <option value="03">3일</option>
                                <option value="04">4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성별
                        </div>
                        <div class="gender-wrapper">
                            <input type="radio" class="radio3" name="gender-1" id="male-1" checked>
                            <label for="male-1">남성</label>
                            <input type="radio" class="radio3" name="gender-1" id="female-1">
                            <label for="female-1">여성</label>
                        </div>
                    </div>
                </div>
                <div class="table-form">
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 성 입력 (예:홍)" value="김" disabled>
                        </div>
                        <div class="table-row-title">
                            이름
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 이름 입력 (예:길동)" value="동한" disabled>
                        </div>
                    </div>
        
                    <div class="row clearfix">
                        <div class="table-row-title">
                            생년월일
                        </div>
                        <div>
                            <select title="생년월일&nbsp;연도" style="width: 200px" disabled>
                                <option value="">년</option>
                                <option value="2019">2019년</option>
                                <option value="2018">2018년</option>
                                <option value="2017">2017년</option>
                                <option value="2016">2016년</option>
                                <option value="2015">2015년</option>
                                <option value="2014">2014년</option>
                                <option value="2013">2013년</option>
                                <option value="2012">2012년</option>
                                <option value="2011">2011년</option>
                                <option value="2010">2010년</option>
                                <option value="2009">2009년</option>
                                <option value="2008">2008년</option>
                                <option value="2007">2007년</option>
                                <option value="2006">2006년</option>
                                <option value="2005">2005년</option>
                                <option value="2004">2004년</option>
                                <option value="2003">2003년</option>
                                <option value="2002">2002년</option>
                                <option value="2001">2001년</option>
                                <option value="2000">2000년</option>
                                <option value="1999">1999년</option>
                                <option value="1998">1998년</option>
                                <option value="1997">1997년</option>
                                <option value="1996">1996년</option>
                                <option value="1995">1995년</option>
                                <option value="1994">1994년</option>
                                <option value="1993">1993년</option>
                                <option value="1992">1992년</option>
                                <option value="1991">1991년</option>
                                <option value="1990">1990년</option>
                                <option value="1989">1989년</option>
                                <option value="1988">1988년</option>
                                <option value="1987">1987년</option>
                                <option value="1986">1986년</option>
                                <option value="1985">1985년</option>
                                <option value="1984">1984년</option>
                                <option value="1983">1983년</option>
                                <option value="1982">1982년</option>
                                <option value="1981">1981년</option>
                                <option value="1980" selected>1980년</option>
                                <option value="1979">1979년</option>
                                <option value="1978">1978년</option>
                                <option value="1977">1977년</option>
                                <option value="1976">1976년</option>
                                <option value="1975">1975년</option>
                                <option value="1974">1974년</option>
                                <option value="1973">1973년</option>
                                <option value="1972">1972년</option>
                                <option value="1971">1971년</option>
                                <option value="1970">1970년</option>
                                <option value="1969">1969년</option>
                                <option value="1968">1968년</option>
                                <option value="1967">1967년</option>
                                <option value="1966">1966년</option>
                                <option value="1965">1965년</option>
                                <option value="1964">1964년</option>
                                <option value="1963">1963년</option>
                                <option value="1962">1962년</option>
                                <option value="1961">1961년</option>
                                <option value="1960">1960년</option>
                                <option value="1959">1959년</option>
                                <option value="1958">1958년</option>
                                <option value="1957">1957년</option>
                                <option value="1956">1956년</option>
                                <option value="1955">1955년</option>
                                <option value="1954">1954년</option>
                                <option value="1953">1953년</option>
                                <option value="1952">1952년</option>
                                <option value="1951">1951년</option>
                                <option value="1950">1950년</option>
                                <option value="1949">1949년</option>
                                <option value="1948">1948년</option>
                                <option value="1947">1947년</option>
                                <option value="1946">1946년</option>
                                <option value="1945">1945년</option>
                                <option value="1944">1944년</option>
                                <option value="1943">1943년</option>
                                <option value="1942">1942년</option>
                                <option value="1941">1941년</option>
                                <option value="1940">1940년</option>
                            </select>
        
                            <select title="생년월일월" style="width: 200px" disabled>
                                <option value="">월</option>
                                <option value="01">1월</option>
                                <option value="02" selected>2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
        
                            <select title="생년월일일" style="width: 200px" disabled>
                                <option value="">일</option>
                                <option value="01">1일</option>
                                <option value="02" selected>2일</option>
                                <option value="03">3일</option>
                                <option value="04">4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성별
                        </div>
                        <div class="gender-wrapper">
                            <input type="radio" class="radio3" name="gender-2" id="male-2" checked>
                            <label for="male-2">남성</label>
                            <input type="radio" class="radio3" name="gender-2" id="female-2">
                            <label for="female-2">여성</label>
                        </div>
                    </div>
                </div>
                <div class="table-form">
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 성 입력 (예:홍)" value="최" disabled>
                        </div>
                        <div class="table-row-title">
                            이름
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 이름 입력 (예:길동)" value="민지" disabled>
                        </div>
                    </div>
        
                    <div class="row clearfix">
                        <div class="table-row-title">
                            생년월일
                        </div>
                        <div>
                            <select title="생년월일&nbsp;연도" style="width: 200px" disabled>
                                <option value="">년</option>
                                <option value="2019">2019년</option>
                                <option value="2018">2018년</option>
                                <option value="2017">2017년</option>
                                <option value="2016">2016년</option>
                                <option value="2015">2015년</option>
                                <option value="2014">2014년</option>
                                <option value="2013">2013년</option>
                                <option value="2012">2012년</option>
                                <option value="2011">2011년</option>
                                <option value="2010" selected>2010년</option>
                                <option value="2009">2009년</option>
                                <option value="2008">2008년</option>
                                <option value="2007">2007년</option>
                                <option value="2006">2006년</option>
                                <option value="2005">2005년</option>
                                <option value="2004">2004년</option>
                                <option value="2003">2003년</option>
                                <option value="2002">2002년</option>
                                <option value="2001">2001년</option>
                                <option value="2000">2000년</option>
                                <option value="1999">1999년</option>
                                <option value="1998">1998년</option>
                                <option value="1997">1997년</option>
                                <option value="1996">1996년</option>
                                <option value="1995">1995년</option>
                                <option value="1994">1994년</option>
                                <option value="1993">1993년</option>
                                <option value="1992">1992년</option>
                                <option value="1991">1991년</option>
                                <option value="1990">1990년</option>
                                <option value="1989">1989년</option>
                                <option value="1988">1988년</option>
                                <option value="1987">1987년</option>
                                <option value="1986">1986년</option>
                                <option value="1985">1985년</option>
                                <option value="1984">1984년</option>
                                <option value="1983">1983년</option>
                                <option value="1982">1982년</option>
                                <option value="1981">1981년</option>
                                <option value="1980">1980년</option>
                                <option value="1979">1979년</option>
                                <option value="1978">1978년</option>
                                <option value="1977">1977년</option>
                                <option value="1976">1976년</option>
                                <option value="1975">1975년</option>
                                <option value="1974">1974년</option>
                                <option value="1973">1973년</option>
                                <option value="1972">1972년</option>
                                <option value="1971">1971년</option>
                                <option value="1970">1970년</option>
                                <option value="1969">1969년</option>
                                <option value="1968">1968년</option>
                                <option value="1967">1967년</option>
                                <option value="1966">1966년</option>
                                <option value="1965">1965년</option>
                                <option value="1964">1964년</option>
                                <option value="1963">1963년</option>
                                <option value="1962">1962년</option>
                                <option value="1961">1961년</option>
                                <option value="1960">1960년</option>
                                <option value="1959">1959년</option>
                                <option value="1958">1958년</option>
                                <option value="1957">1957년</option>
                                <option value="1956">1956년</option>
                                <option value="1955">1955년</option>
                                <option value="1954">1954년</option>
                                <option value="1953">1953년</option>
                                <option value="1952">1952년</option>
                                <option value="1951">1951년</option>
                                <option value="1950">1950년</option>
                                <option value="1949">1949년</option>
                                <option value="1948">1948년</option>
                                <option value="1947">1947년</option>
                                <option value="1946">1946년</option>
                                <option value="1945">1945년</option>
                                <option value="1944">1944년</option>
                                <option value="1943">1943년</option>
                                <option value="1942">1942년</option>
                                <option value="1941">1941년</option>
                                <option value="1940">1940년</option>
                            </select>
        
                            <select title="생년월일월" style="width: 200px" disabled>
                                <option value="">월</option>
                                <option value="01">1월</option>
                                <option value="02">2월</option>
                                <option value="03" selected>3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
        
                            <select title="생년월일일" style="width: 200px" disabled>
                                <option value="">일</option>
                                <option value="01">1일</option>
                                <option value="02">2일</option>
                                <option value="03" selected>3일</option>
                                <option value="04">4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성별
                        </div>
                        <div class="gender-wrapper">
                            <input type="radio" class="radio3" name="gender-3" id="male-3">
                            <label for="male-3">남성</label>
                            <input type="radio" class="radio3" name="gender-3" id="female-3" checked>
                            <label for="female-3">여성</label>
                        </div>
                    </div>
                </div>
                <div class="table-form">
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 성 입력 (예:홍)" value="정" disabled>
                        </div>
                        <div class="table-row-title">
                            이름
                        </div>
                        <div class="two-in-row">
                            <input type="text" placeholder="한글 이름 입력 (예:길동)" value="운하" disabled>
                        </div>
                    </div>
        
                    <div class="row clearfix">
                        <div class="table-row-title">
                            생년월일
                        </div>
                        <div>
                            <select title="생년월일&nbsp;연도" style="width: 200px" disabled>
                                <option value="">년</option>
                                <option value="2019" selected>2019년</option>
                                <option value="2018">2018년</option>
                                <option value="2017">2017년</option>
                                <option value="2016">2016년</option>
                                <option value="2015">2015년</option>
                                <option value="2014">2014년</option>
                                <option value="2013">2013년</option>
                                <option value="2012">2012년</option>
                                <option value="2011">2011년</option>
                                <option value="2010">2010년</option>
                                <option value="2009">2009년</option>
                                <option value="2008">2008년</option>
                                <option value="2007">2007년</option>
                                <option value="2006">2006년</option>
                                <option value="2005">2005년</option>
                                <option value="2004">2004년</option>
                                <option value="2003">2003년</option>
                                <option value="2002">2002년</option>
                                <option value="2001">2001년</option>
                                <option value="2000">2000년</option>
                                <option value="1999">1999년</option>
                                <option value="1998">1998년</option>
                                <option value="1997">1997년</option>
                                <option value="1996">1996년</option>
                                <option value="1995">1995년</option>
                                <option value="1994">1994년</option>
                                <option value="1993">1993년</option>
                                <option value="1992">1992년</option>
                                <option value="1991">1991년</option>
                                <option value="1990">1990년</option>
                                <option value="1989">1989년</option>
                                <option value="1988">1988년</option>
                                <option value="1987">1987년</option>
                                <option value="1986">1986년</option>
                                <option value="1985">1985년</option>
                                <option value="1984">1984년</option>
                                <option value="1983">1983년</option>
                                <option value="1982">1982년</option>
                                <option value="1981">1981년</option>
                                <option value="1980">1980년</option>
                                <option value="1979">1979년</option>
                                <option value="1978">1978년</option>
                                <option value="1977">1977년</option>
                                <option value="1976">1976년</option>
                                <option value="1975">1975년</option>
                                <option value="1974">1974년</option>
                                <option value="1973">1973년</option>
                                <option value="1972">1972년</option>
                                <option value="1971">1971년</option>
                                <option value="1970">1970년</option>
                                <option value="1969">1969년</option>
                                <option value="1968">1968년</option>
                                <option value="1967">1967년</option>
                                <option value="1966">1966년</option>
                                <option value="1965">1965년</option>
                                <option value="1964">1964년</option>
                                <option value="1963">1963년</option>
                                <option value="1962">1962년</option>
                                <option value="1961">1961년</option>
                                <option value="1960">1960년</option>
                                <option value="1959">1959년</option>
                                <option value="1958">1958년</option>
                                <option value="1957">1957년</option>
                                <option value="1956">1956년</option>
                                <option value="1955">1955년</option>
                                <option value="1954">1954년</option>
                                <option value="1953">1953년</option>
                                <option value="1952">1952년</option>
                                <option value="1951">1951년</option>
                                <option value="1950">1950년</option>
                                <option value="1949">1949년</option>
                                <option value="1948">1948년</option>
                                <option value="1947">1947년</option>
                                <option value="1946">1946년</option>
                                <option value="1945">1945년</option>
                                <option value="1944">1944년</option>
                                <option value="1943">1943년</option>
                                <option value="1942">1942년</option>
                                <option value="1941">1941년</option>
                                <option value="1940">1940년</option>
                            </select>
        
                            <select title="생년월일월" style="width: 200px" disabled>
                                <option value="">월</option>
                                <option value="01">1월</option>
                                <option value="02">2월</option>
                                <option value="03">3월</option>
                                <option value="04" selected>4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
        
                            <select title="생년월일일" style="width: 200px" disabled>
                                <option value="">일</option>
                                <option value="01">1일</option>
                                <option value="02">2일</option>
                                <option value="03">3일</option>
                                <option value="04" selected>4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row clearfix">
                        <div class="table-row-title">
                            성별
                        </div>
                        <div class="gender-wrapper">
                            <input type="radio" class="radio3" name="gender-4" id="male-4" checked>
                            <label for="male-4">남성</label>
                            <input type="radio" class="radio3" name="gender-4" id="female-4">
                            <label for="female-4">여성</label>
                        </div>
                    </div>
                </div>
                
            </form>
        </div>
        
        <p class="reservation-section-title">기타 예약 정보</p>
        <div id="reservation-etc">
            <div class="etc-section clearfix">
                <div class="etc-section-title">좌석 선택</div>
                <div class="imgDiv" id="seatImg"></div>
                <div class="border-bt">
                    <div class="etc-section-info">클릭하시면 좌석 선택 하실 수 있습니다.<br/>
                                        회색으로 표시된 자석은 이미 예약된 자석이며 클릭하여 나오는 빨간색 좌석이<br/>
                                        좌석으로 선택 됩니다.
                    </div>
                    <input type="button" value="변경" id="selectSeat" class="etc-section-button"/>
                </div>
            </div>
            <div class="etc-section clearfix">
                <div class="etc-section-title">기내식 선택</div>
                <div class="imgDiv" id="foodImg"></div>
                <div class="border-bt">
                    <div class="etc-section-info">클릭 하시면 기내식 선택 하실 수 있습니다.<br/>
                                        기내식은 특선 요리, 일품 요리, 샐러드, 간단식으로 구성되어있습니다.<br/>
                                        음식 하나만 선택 가능합니다.
                    </div>
                    <input type="button" value="변경" id="selectFood" class="etc-section-button"/>
                </div>
            </div>
            <div class="etc-section clearfix">
                <div class="etc-section-title">기내식 선택</div>
                <div class="imgDiv" id="classImg"></div>
                <div class="border-bt">
                    <div class="etc-section-info">클래스 변경 하실 수 있습니다.<br/>
                                        클래스 변경은 퍼스트, 비즈니스, 이코노미 중 선택 하실 수 있습니다.
                    </div>
                    <input type="button" value="변경" id="selectClass" class="etc-section-button"/>
                </div>
            </div>
        </div>
        
        <p class="reservation-section-title">운임 조건 및 규정</p>
        <div id="regulation-1">
            <p><span class="font-blue4">01</span>서울/김포<span>→</span>제주</p>
            <input type="checkbox" class="hidden" id="fold-1" checked>
            <label for="fold-1"><img src = "<%=img %>/icon/underArrow.png" alt = ""></label>
            <div>
                <h4>· 운임종류</h4>
                <div>정상운임 (Y)</div>
                
                <h4>· 개인할인</h4>
                <div>가능</div>
                
                <h4>· 소아할인</h4>
                <div>가능</div>
                
                <h4>· 마일리지 적립</h4>
                <div>적립가능(단,장애인소아 등 50%이상 개인할인적용 시 적립 불가)</div>
                
                <h4>· 구매 조건</h4>
                <div>가자에항공 홈페이지(모바일)에서 구매 가능 (예약센터,지점,공항 카운터 불가) <br>
                왕복여정의 경우 최초 발권 시의 여정 순서대로 사용 원칙 <br>
                ※ 첫번째 여정 미사용시 두번째 여정 사용불가</div>
                
                <h4>· 항공권 유효기간</h4>
                <div>발행일로 부터 1년 </div>
                
                <h4>· 여정 변경</h4>
                <div>가능왕복여정 중 사용후 남은 여정 변경 불가 </div>
                
                <h4>· 탑승 후 남은 여정 환불</h4>
                <div>왕복 여정 중 사용하고 남은 여정 환불 가능 </div>
                
                <h4>· 부분 변경</h4>
                <div>홈페이지/모바일에서 2명 이상 동일한 예약 번호로 구매하신 경우 일부 <br>
                 인원만 변경 및 환불 불가(일부 인원 예약 변경 및 환불 원할 경우 예약센터 1588-8000번문의)</div>
                
                <h4>· 부분 환불</h4>
                <div>특가운임이 포함된 왕복 항공권 부분 환불 불가 <br>
                특가운임 포함안된 미사용 항공권 왕복여정의 부분환불 수수료 미징수 (단, 부분환불 후 추가 환불시 미징수 된 환불수수료 소급적용)</div>
                
                <h4>· 환불 수수료</h4>
                <div>편도당 2,000원<br>
                유효기간 만료일 이내 환불가능 <br>
                최초 발행된 항공권 및 각 재발행된 항공권 중 하위클래스 기준의 환불수수료 징수 (계좌이체 결제시 환불 수수료 부과)</div>
                
                <h4>· 예약부도위약금</h4>
                <div>편도당 8,000원</div>
                
                <h4 class="rules_content">· 기타</h4>
                <div>기상이나 항공사 사정으로 결항 시 미 탑승 항공권 자동 환불 불가 <br>
                (홈페이지에서 환불 시 환불 수수료/예약부도위약금 부과,예약센터나 지점,공항 카운터에서 환불 시 환불 수수료/예약부도위약금 면제) </div>
            </div>
        </div>
        
        
        <div class='pop-up-window-type1 centeredX' id='selectSeat-window'>
            <div class="row">
                <p class="window-title">
                    좌석 선택
                    <i class="fas fa-times btn-close"></i>
                </p>
            </div>
            <div class="scrollable">
                <div id="seatsBackImg">
					<div id="frontBusi-seat" class="seatDiv"></div>
					<div id="frontEco-seat" class="seatDiv"></div>
					<div id="back-seat" class="seatDiv"></div>
				</div>
                <input type="button" class="blueBtn closeBtn closeBtn" aria-hidden="true" value="선택하기" id="changeSeat">
            </div>
        </div>
        
        <!-- Todo 탭메뉴 2,3,4추가 -->
        <div class='pop-up-window-type1 centeredX' id='selectFood-window'>
            <div class="row">
                <p class="window-title">
                    기내식 선택
                    <i class="fas fa-times btn-close"></i>
                </p>
            </div>
            <div class="tab-menu1">
                <ul class="clearfix">
                    <li class="col-fourth on" id="tab-1"><a href="#none" onclick="return false;">특선요리</a></li>
                    <li class="col-fourth" id="tab-2"><a href="#none" onclick="return false;">일품요리</a></li>
                    <li class="col-fourth" id="tab-3"><a href="#none" onclick="return false;">샐러드</a></li>
                    <li class="col-fourth" id="tab-4"><a href="#none" onclick="return false;">간단식</a></li>
                </ul>
            </div>
            <div class="scrollable">
                <div id="tab-1-container" class="tab-content-container">
					<div id="tab-1-product-1" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/BRML.png">
						</div>
						<div class="col-half food-content">
							<div class="row food-title">
                                시그니처불고기라이스
                                <button class="blueBtn closeBtn foodSelect">선택하기</button>
                            </div>
							<div class="row food-word">한국을 대표하는 맛있는 불고기 요리를 따뜻한 밥과 함께 드립니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦15,000</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">쌀,불고기(쇠고기),표고,피망,브로콜리2종,계란지단(계란,돼지고기,대두,밀),잣,앙금,찹쌀,땅콩,호두(약간의성분함유),대두,밀,배추,새우(젓갈)</div>
							</div>
						</div>
					</div>
					<div id="tab-1-product-2" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/QMML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">
                                bbq 치킨강정 (순한맛)
                                <button class="blueBtn closeBtn foodSelect">선택하기</button>
                            </div>
							<div class="row clearfix food-word">부드러운 살코기와 BBQ만의 특제 강정소스가 곁들여져 남녀노소 누구나 맛있게 드실 수 있습니다. *치킨무 제공</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포 출발 국제선 (2시간 이상 비행편)</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">닭고기,계란,대두,밀,토마토,쇠고기,아몬드,무우</div>
							</div>
						</div>
					</div>
					<div id="tab-1-product-3" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/QSML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">
                                bbq 치킨강정 (매운맛)
                                <button class="blueBtn closeBtn foodSelect">선택하기</button>
                            </div>
							<div class="row clearfix food-word">하늘 위에서 더 맛있는, BBQ만의 매콤달콤한 특제강정소스로 버무러진 치킨강정 간편식 또는 맥주 안주로도 인기만점 입니다. *치킨무 제공</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포 출발 국제선 (2시간 이상 비행편)</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">닭고기,계란,대두,밀,토마토,쇠고기,아몬드,무우</div>
							</div>
						</div>
					</div>
				</div>
				<div id="tab-2-container" class="tab-content-container hidden">
					<div id="tab-2-product-1" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/FTML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">
								유부초밥 & 스프링롤
								<button class="blueBtn closeBtn foodSelect">선택하기</button>	
							</div>
								
							<div class="row clearfix food-word">새콤달콤 유부초밥에 베트남 스타일인
								스프링롤을 곁들여서 드립니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">쌀,유부(대두,밀),계란,맛살,단무지,햄,로메인상추,라이스페이퍼,돼지고기,토마토,대두,밀,닭고기,쇠고기,무우,닭고기</div>
							</div>
						</div>
					</div>
					<div id="tab-2-product-2" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/CDML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">콜드델리카시
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">이스타항공의 대표적인 일품요리로 많은
								사랑을 받고 있는 메뉴입니다. 샐러드를 곁들인 절인연어, 양배추 쌈요리, 오렌지 아몬드치킨, 과일샐러드, 삼색피망과
								단호박구이, 계란말이로 구성되어 있습니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦12,000 / ￥1,200 / ＄12 / 元75</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">계란,닭고기,돼지고기,우유,대두,토마토,포도,맛살(게),쌀,양배추,아몬드,연어(생선),캐이퍼,블랙올리브,양파,단호박,피망,훈제닭가슴살(닭고기),양상추,라디치오,로메인상추,오렌지,방울토마토,호두</div>
							</div>
						</div>
					</div>
					<div id="tab-2-product-3" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/KRML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">김치볶음밥
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">한국인이 사랑하는 대표 음식 김치볶음밥을
								기내에서 드실수 있습니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦14,000 / ￥1,400 / ＄14 / 元85</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 부산 출발 국제선 (2시간 이상
									비행편)</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">볶음밥(쌀,김치,계란,우유,대두,밀),토마토,돼지고기,닭고기,쇠고기,조개류,계란,우유,대두,밀,무우</div>
							</div>
						</div>
					</div>
				</div>
                <!-- salad -->
				<div id="tab-3-container" class="tab-content-container hidden">
					<div id="tab-3-product-1" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/WSML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">웰빙 샐러드
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">신선한 야채 모듬에 닭가슴살과 구운
								단호박으로 토핑하여 상큼한 키위소스와 함께 건강과 맛을 한꺼번에 챙길수 있는 실속만점 샐러드입니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 부산, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">훈제닭가슴살(닭고기),양상추,라디치오,로메인상추,토마토,오렌지,단호박,방울토마토,호두,대두</div>
							</div>
						</div>
					</div>
					<div id="tab-3-product-2" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/BTML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">소고기타다끼 샐러드
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">신선한 야채에 구운 소고기타다끼를
								토핑하여, 발사믹 소스로 풍미를 더한 샐러드입니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦12,000 / ￥1,200 / ＄12 / 元75</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">쇠고기,피망,양상추,토마토,라디치오,로메인상추,대두</div>
							</div>
						</div>
					</div>
					<div id="tab-3-product-3" class="row clearfix food-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/CSML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">스모크치킨 샐러드
							<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">신선한 야채에 훈제 닭가슴살로 토핑하여
								맛과 향이 뛰어난 발사믹 소스를 넣어 모닝롤과 함께 드시면 최고의 브런치 메뉴입니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦12,000 / ￥1,200 / ＄12 / 元75</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">닭고기,양상추,페타치즈,단호박,피망,라디치오,로메인상추,빵(소프트롤),버터,대두</div>
							</div>
						</div>
					</div>
				</div>
                <!-- refreshment -->
				<div id="tab-4-container" class="tab-content-container hidden">
					<div id="tab-4-product-1" class="row product-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/PSML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">단호박 샌드위치
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">곡물식빵에 블루베리쨈과 햄을 넣고 부드럽고
								달콤한 단호박샐러드를 듬뿍 발라 넣은 샌드위치 입니다. 특히, 어린이와 여성고객들이 선호하는 메뉴입니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 부산, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">호밀식빵,치즈스프레드(버터치즈,마요네즈),단호박,돼지고기,블루베리,오이피클,로메인상추,아몬드,닭고기,쇠고기</div>
							</div>
						</div>
					</div>
					<div id="tab-4-product-2" class="row product-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/VTML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">야채볶음 샌드위치
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">곡물식빵에 신선한 상추와 토마토에 구운
								야채로 속을 꽉 채운 샌드위치로 고객님의 건강을 생각하여 이스타에서 야심차게 준비하였습니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 부산, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">곡물식빵,치즈스프레드(버터치즈,마요네즈),양상추,로메인상추,토마토,단호박,피망,가지,양파,파마산치즈,닭고기</div>
							</div>
						</div>
					</div>
					<div id="tab-4-product-3" class="row product-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/SCML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">새우샐러드치아바타
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">치아바타 브레드 속내를 마요네즈로 버무린
								통새우살에 삶은계란, 야채로 듬뿍 채운 샌드위치입니다. 고소함과 부드러운 맛을 함께 느끼실 수 있습니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">치아바타빵,치즈스프레드(버터치즈,마요네즈),양상추,로메인상추,새우,파마산치즈</div>
							</div>
						</div>
					</div>
					<div id="tab-4-product-4" class="row product-wrapper">
						<div class="col-half img-wrapper">
							<img src="<%=img %>/food/HCML.png">
						</div>
						<div class="col-half food-content">
							<div class="row clearfix food-title">햄치즈 베이글
								<button class="blueBtn closeBtn foodSelect">선택하기</button>
							</div>
							<div class="row clearfix food-word">햄과 치즈를 올려 따뜻하게 구운 베이글에
								고객님의 기호에 맞게 버터나 딸기잼을 발라서 드시면 맛있습니다.</div>
							<div class="row clearfix food-detail">
								<div class="col-fourth">가격</div>
								<div class="col-three-fourth">￦10,000 / ￥1,000 / ＄10 / 元60</div>
								<div class="col-fourth">제공 노선</div>
								<div class="col-three-fourth">인천, 김포, 부산, 제주 출발 국제선</div>
								<div class="col-fourth">주재료</div>
								<div class="col-three-fourth">빵,블루베리,닭고기,돼지고기,쇠고기,치즈,계란,오이,우유,버터</div>
							</div>
						</div>
					</div>
				</div>

            </div>
        </div>
        
        <div class='pop-up-window-type1 centeredX' id='selectClass-window'>
            <div class="row">
                <p class="window-title">
                    좌석등급 변경
                    <i class="fas fa-times btn-close"></i>
                </p>
            </div>
            
            <div class="row itinerary clearfix">
                <div class="col-third class-select">
                    <input type="radio" class="radio2" name="class-type" value="economy" id="economy" checked="checked">
                    <label for="economy" class="firstRadio">이코노미</label>
                </div>
                <div class="col-third class-select">
                    <input type="radio" class="radio2" name="class-type" value="business" id="business">
                    <label for="business">비즈니스</label>
                </div>
                <div class="col-third class-select">
                    <input type="radio" class="radio2" name="class-type" value="first" id="first">
                    <label for="first" class="lastRadio">퍼스트</label>
                </div>
            </div>
            <input type="button" value="변경하기" class="blueBtn closeBtn" id="changeClass">
            <ul class="list-type2 last-note">
                <li class="list-inside-title">좌석등급 변경 시 유의사항</li>
                <li>탑승 항공편에 따라 좌석 타입 및 편의 시설, 이용 가능한 서비스에 차이가 있을 수 있습니다.</li>
                <li>국내선의 경우 별도 좌석등급 선택을 하지 않습니다.</li>
                <li>좌석등급은 항공편 기종별 좌석배치가 다릅니다.<a href="#" target="_blank">좌석배치도보기</a></li>
                <li>마일리지 적립은 구입하신 항공권상의 예약클래스 기준으로 적립됩니다.<a href="#" target="_blank">적립 기준표 보기</a></li>
            </ul>
        </div>
        
        
		<input type="hidden" value="Y">
		<div class="button-wrapper">
			<input type="button" value="뒤로" class="whiteBtn reserveCancel" onclick="javascript:history.back()">
		</div>
	</section>
 	<%@ include file="../common/footer.jspf" %>
	
	<c:set var="x" value="<%=request.getContextPath() %>"/>
	<script>
		var x = "<%=request.getContextPath() %>";
	</script>
	<script src="<%=js %>/mypage.js"></script>
	<script>
		tabEvent('.tab-menu1');
	</script>
</body>
</html>