<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>수하물</title>
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/information.css">
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <%@ include file="../common/nav.jspf" %>
        <%@ include file="info_nav.jspf" %>
        <section class="content info-reservation">
            <h3>수하물</h3>
            
            <div class="tab-menu1">
                <ul class="clearfix">
                    <li class="col-third on" id='tab-1'><a href="#none">무료 수하물 - 국제선</a></li>
                    <li class="col-third" id='tab-2'><a href="#none">무료 수하물 - 국내선</a></li>
                    <li class="col-third" id='tab-3'><a href="#none">회원등급별 허용량</a></li>
                </ul>
            </div>

            <div id="tab-1-container">
                <div class="info-banner">
                    <div class="banner-baggagefree-1">
                        <div>
                            <p>고객님의 편안한 여행을 위해 꼭 필요한 수하물 관련 정보를 안내해드립니다.아래에서 무료수하물 허용량을 확인할 수 있습니다.</p>
                        </div>
                    </div>
                </div>
                
                <p class="section-title">국제선 이용 시 무료수하물 허용기준</p>
				  타 항공사로 연결 시 해당 항공사의 무료수하물 허용량 기준이 당사와 상이할 수 있습니다.<br/>
				수하물 위탁은 출국장 입장 전 체크인(수속) 카운터 또는 자동 수하물 위탁 기기에서만 가능합니다.
				
				<p class="section-title">무료수하물 허용량</p>
				<table class="table-list">
                <col-group>
                    <col style="width: 33.33%; height: 280px; padding: 20px; border: 1px solid #eee !important">
                    <col style="width: 33.33%; height: 280px; padding: 20px; border: 1px solid #eee !important">
                    <col style="height: 280px; padding: 20px; border: 1px solid #eee !important">
                </col-group>
                <tbody>
                    <tr>
                        <td class="text-align-center">
                            
                            <div style="height: 97px; width: 65px; padding:25px 0; margin:0; background: url(<%=path%>/Resources/IMG/information/icoset_baggage.png) no-repeat 0 0; clear: both; display:inline-block;"></div>
                            <div style="height: 97px; width: 65px; padding:25px 0; margin:0; background: url(<%=path%>/Resources/IMG/information/icoset_baggage.png) no-repeat 0 0; clear: both; display: inline-block;"></div>
                            <div style="font-size: 110%">무게 : 32kg(70lbs) 이내<br/>허용 개수 : 2개</div>
                            
                            
                        </td>
                        <td class="text-align-center">
                            <div style="height: 97px; width: 60px;padding:25px 0; margin:0; background: url(<%=img%>/information/icoset_baggage.png) no-repeat -72px 0; clear: both; display: inline-block;"></div>
                            <div style="height: 97px; width: 60px;padding:25px 0; margin:0; background: url(<%=img%>//information/icoset_baggage.png) no-repeat -72px 0; clear: both; display: inline-block;"></div>
                            <div style="font-size: 110%">무게 : 23kg(50lbs) 이내<br/>허용 개수 : 2개</div>
                             
                        </td>
                        <td class="text-align-center">
                            <div style="height: 97px; width: 60px; padding:25px 0; margin:0;  background: url(<%=img%>/information/icoset_baggage.png) no-repeat -72px 0; clear: both; display: inline-block;"></div>
                            <div style="height: 97px; width: 77px; padding:25px 0; margin:0;  background: url(<%=img%>/information/icoset_baggage.png) no-repeat -347px 0; clear: both; display: inline-block;"></div>
                            <div style="font-size: 110%">무게 : 23kg(50lbs) 이내<br/>허용 개수 : 1개 + 접을 수 있는 유모차,<br/>유아 운반용 요람,<br/>유아용 카시트 중 1개 추가 가능</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>

            <div id="tab-2-container"  class="hidden">
                <div class="info-banner">
                    <div class="banner-baggagefree-2">
                        <div>
                            <p>고객님의 편안한 여행을 위해 꼭 필요한 수하물 관련 정보를 안내해드립니다.아래에서 무료수하물 허용량을 확인할 수 있습니다.</p>
                        </div>
                    </div>
                </div>
                <br>
                <p class="section-title">국내선 이용 시</p>
                <ul class="list-type2">
	                <li>국내선 무료수하물은 무게를 기준으로 하고 있습니다.</li>
	                <li>수하물 1개당 삼면의 합이 158cm를 초과할 시 운송이 거절될 수 있습니다.<br/>(삼면의 합 159~203cm의 수하물은 항공사와 사전 협의 부탁 드립니다.)</li>
	                <li>당사 국제선과 연결된 국내선 구간에는 국제선 구간의 무료수하물 허용 규정을 적용합니다.</li>
	                <li>에어부산 공동운항 노선의 국내선 무료수하물 규정은 에어부산의 무료수하물 허용 규정을 적용합니다.</li>
	                <li>파손 및 수하물 작업자의 상해 방지를 위하여 모든 짐은 개 당 32kg 미만으로 준비해 주십시오. 32kg 초과 시 운송이 거절될 수 있습니다.</li>
	            </ul>
            </div>
            
             <div id="tab-3-container"  class="hidden">
                <div class="info-banner">
                    <div class="banner-baggagefree-2">
                        <div>
                            <p>탑승 클래스 및 아시아나클럽 회원등급에 따라 무료수하물 혜택을 제공하고 있습니다.<br/>혜택은 탑승 구간이나 노선별로 상이합니다.</p>
                        </div>
                    </div>
                </div>
                <br>
                <ul class="list-type2 last-note bg-gray6">
                    <li class="list-inside-title">유의사항</li>
                    <li>타 항공사로 연결 시 해당 항공사의 무료 수하물 허용량 기준이 당사와 상이할 수 있습니다.</li>
                    <li>다이아몬드, 다이아몬드플러스, 플래티늄 회원께서 스타얼라이언스 항공편 탑승 시 스타얼라이언스 골드 회원 혜택이 적용되며 1개 무료 추가 수하물의 최대 중량은 회원사의<br/> 규정에 따라 다를 수 있습니다.</li>
                </ul>
            </div>
        </section>
        <%@ include file="../common/footer.jspf" %>
        <script src="<%=path %>/Resources/JS/information.js"></script>
    </body>
</html>