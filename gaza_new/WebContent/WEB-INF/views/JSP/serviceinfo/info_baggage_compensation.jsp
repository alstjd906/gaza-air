<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>수하물 보상</title>
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/information.css">
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <%@ include file="../common/nav.jspf" %>
        <%@ include file="info_nav.jspf" %>
        <section class="content info-reservation">
            <h3>수하물 보상</h3>
            
            <div class="tab-menu1">
                <ul class="clearfix">
                    <li class="col-half on" id='tab-1'><a href="#none" >수하물 보상 책임</a></li>
                    <li class="col-half" id='tab-2'><a href="#none">수하물 보상</a></li>
                </ul>
            </div>

            <div id="tab-1-container">
                <div class="info-banner">
                    <div class="banner-compensation-1">
                        <div>
                            <p>아시아나항공은 수하물을 운송, 보관 및 관리하는 과정에서 회사의 고의 또는 과실로<br/>수하물에 손해가 발생한 경우에 한하여 보상 책임을 집니다.</p>
                            
                        </div>
                    </div>
                </div>
            
                <p class="section-title">수하물 보상 책임에 대한 안내</p>
                <ul class="list-type2">
	                <li>위탁수하물에 대한 아시아나항공의 책임한도는 바르샤바 협약이 적용되는 운송인 경우 킬로그램당 250 프랑스 골드프랑 또는 그 상당액 (미화 약 20.00불)이며, 몬트리올 협약이<br/>
	                	적용되는 운송인 경우 1인당 1,131SDR(특별인출권)로 합니다.</li>
	                <li>예외적으로 사전에 보다 높은 가격을 신고하고 종가 요금을 지불한 경우에 아시아나항공의 책임 한도는 신고 가격을 근거로 합니다.</li>
	                <li>수하물에 손상이 있거나 내용품이 분실된 경우에는 수하물을 인도받으신 날로부터 7일 내에, 수하물이 지연 또는 분실된 경우에는 항공사에 수하물을 위탁하신 날로부터 21일<br/> 내에 해당 항공사에 서면으로 신고하셔야 합니다.</li>
            	</ul>
            	<p class="section-title">‘보상에서 제외, 약관에 의한 제한된 보상’</p>
            	다음의 경우에는 이용 구간에 따라 보상에서 제외 되거나, 운송약관 또는 몬트리올협약에 의한 제한된 보상이 실시됩니다.<br/>
            	<ul class="list-type2">
	                <li>회사가 손해 방지를 위하여 필요한 제반 조치를 취하였거나 또는 불가항력적인 사유로 인하여 조치를 취할 수 없었음이 입증될 경우</li>
	                <li>고객에 의한 사고 또는 과실로 손해가 발생한 경우</li>
	                <li>너무 무겁거나 가방 용량에 비해 무리하게 내용품을 넣은 경우의 수하물 파손 (수하물 파손에 동반한 내용품 파손 및 분실 포함)</li>
	                <li>보안검색 과정에서 발생한 잠금 장치 파손이나 X-ray 통과로 인한 필름 손상</li>
	                <li>정상적으로 수하물을 취급하는 과정에서 발생한 경미한 긁힘, 마모, 눌림, 흠집, 얼룩 등</li>
	                <li>아래와 같이 위탁수하물로의 운송이 금지되는 물품으로 반드시 기내 반입 휴대수하물로 운송되어야 할 물품</li>
	                <li>- 파손되기 쉬운 물품이거나 부패하기 쉬운 물품, 악기류 등</li>
	                <li>- 건강과 관련된 의약품</li>
	                <li>- 노트북 컴퓨터, 휴대폰, 카메라, 캠코더, MP3플레이어 등 고가의 개인 전자제품 또는 데이터</li>
	                <li>- 현금, 보석이나 귀금속, 유가증권, 계약서, 논문과 같은 서류, 여권, 신분증, 열쇠, 견본(샘플), 골동품 등 가치를 따지기 어려운 물건</li>
           	 </ul>
            	
            	<p class="section-title">아시아나항공 수하물 문의</p>
            	<table class="table-list">
                    <colgroup><col style="width: 30%">
                        <col style="width: 70%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="bg-gray5">인천공항</td>
                            <td>인도지연/분실 : 032-744-2205~06<br>파손 : 032-744-2204<br>이메일 : bag@flyasiana.com</td>
                            
                        </tr>
                        <tr>
                            <td class="bg-gray5">김포공항(국내선)</td>
                            <td>02-2669-1346</td>
                           
                        </tr>
                        <tr>
                            <td class="bg-gray5">김포공항(국제선)</td>
                            <td>02-2669-1155</td>
                            
                        </tr>
                        <tr>
                            <td class="bg-gray5">부산공항</td>
                            <td>051-972-2626</td>
                            
                        </tr>
                        
                        <tr>
                            <td class="bg-gray5">제주공항</td>
                            <td>064-743-2626</td>
                           
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            	
            <div id="tab-2-container"  class="hidden">
                <div class="info-banner">
                    <div class="banner-compensation-2">
                        <div>
                            <p>아시아나항공은 수하물을 운송, 보관 및 관리하는 과정에서 회사의 고의 또는 과실로<br/> 수하물에 손해가 발생한 경우에 한하여 보상 책임을 집니다. </p>
                        </div>
                    </div>
                    <p class="section-title">수하물 보상 기준</p>
                <ul class="list-type2">
	                <li>항공사에 위탁한 수하물의 분실, 파손 및 도난의 보상한도는 탑승하신 노선의 적용 협약에 따라 kg당 USD 20 또는 손님당 1,131 SDR입니다.</li>
	                <li>단, 사전에 고가품임을 신고하고 종가요금을 지불한 경우 신고가격으로 보상하고 초과 수하물 요금을 지불하였을 경우에는 지불한 중량을 기준으로 보상하는 것을 원칙으로 하고<br/> 있습니다.</li>
	                <li>"SDR(SPECIAL DRAWING RIGHT)"이란 국제통화기금이 정한 특별 인출권을 말합니다. SDR로 표시된 금액을 각국 통화로 환산하는 경우, 소송의 경우에는 법원의 최종 판결<br/>
	                	 일에 유효한 해당 통화와의 환율을 적용하고 소송 이외의 경우에는 지불해야 할 보상금액이 합의된 날에 유효한 해당 통화와의 환율을 적용합니다.</li>
            	</ul>
            	<p class="section-title">유형별 보상 기준</p>
            	<table class="table-list">
                    <colgroup><col style="width: 20%">
                        <col style="width: 80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="bg-gray5">분실 및 도난</td>
                            <td>
                            	<ul class="list-type2">
					                <li>위탁수하물의 사고에 있어서 당사의 책임은 탑승하신 노선의 적용 협약에 따라 kg당 USD 20 또는 손님당 1,131 SDR로 합니다.<br/>
										단, 사전에 고가품임을 신고하고 종가요금을 지불한 경우 신고가격으로 배상하고 초과 수하물 요금을 지불하였을 경우에는 지불한 중량을<br/>
										 기준으로 보상하는 것을 원칙으로 합니다.</li>
					                <li>중량에 의한 배상 가능액(USD 20/kg)과 손님의 실제 손해액 중 낮은 액수를 보상합니다.</li>
					                <li>중량은 손님의 항공권 Bag Check난에 기재된 중량이나, Auto Bag Tag일 경우 Bag Tag상에 기록된 중량을 근거로 합니다.</li>
					                <li>항공권에 중량이 기재되지 아니한 경우나 분실 수하물의 중량 산정 불가시 손님이 직접 작성한 분실 수하물 물품 명세서를 바탕으로<br/>
					                	 IATA가 제정한 Table of Weight를 참고하여 무게를 산정합니다.</li>
					                <li>일부 분실의 경우에는 손님의 항공권이나 Bag Tag상에 기재된 중량에서 실제 인도된 수하물의 중량을 공제하여 실제 도난 중량에 의한<br/>
					                	 배상 가능액과 손님 청구액 중 낮은 쪽으로 보상됩니다.</li>
            					</ul>
            				</td>
                            
                        </tr>
                        <tr>
                        	<td class="bg-gray5">파손 및 손상</td>
                            <td>
                            	<ul class="list-type2">
					                <li>수선(Repair) : 수리비 영수증을 근거로 수리비를 보상합니다. Wet Damage의 경우도 세탁비 영수증을 근거로 보상합니다.</li>
					                <li>현금배상 또는 현품구입 보상 : 수리 불가시 파손된 수하물의 원 구입가액에 연간 10%씩 감가상각액을 공제한 금액 내에서 신품을<br/> 
					                	구입하여 주거나, 현금으로 지급합니다. 단, 파손된 수하물은 회수를 원칙으로 합니다.</li>
					                <li>파손 및 손상에 관한 배상도 탑승하신 노선의 적용 협약의 보상 한도가 적용됩니다.</li>
            					</ul>
            				</td>
                           
                        </tr>
                        <tr>
                        	<td class="bg-gray5">인도지연</td>
                            <td>
                            	<ul class="list-type2">
					                <li>수하물 지연 도착 시 손님의 요구에 의거 1인당 1회에 한하여 일용품 구입비(Daily Necessity Fee)를 지급할 수 있습니다.<br/>
										단, 다른 손님에 의해 짐을 수령하지 못한 경우에는 제외됩니다.</li>
					                <li>지급된 일용품 구입비는 수하물이 분실, 도난으로 판명되어 보상 처리하여야 할 경우 총 보상금에서 공제됩니다.</li>
					                <li>일용품 구입비 지급 시 도착지가 거주지인 손님의 경우는 제외될 수 있습니다.</li>
            					</ul>
            				</td>
                            
                        </tr>
                    </tbody>
                </table>
                </div>
                
            </div>
        </section>
        <%@ include file="../common/footer.jspf" %>
        <script src="<%=path %>/Resources/JS/information.js"></script>
    </body>
</html>