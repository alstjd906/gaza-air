<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>자주 찾는 질문</title>
        <link rel="stylesheet" href="<%=path %>/Resources/CSS/information.css">
        <script src="https://kit.fontawesome.com/9c923ac74a.js" crossorigin="anonymous"></script>
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
        <%@ include file="../common/nav.jspf" %>
        <section class="content">
            <h3>자주 찾는 질문</h3>
            <div class="row clearfix">
                <div class="col-seven-tenth">
                    <p class="faq-title">자주 찾는 안내사항</p>
                    <div class="info-list">
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">탑승안내</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="<%=jsp%>/serviceinfo/reservation?abc=0&zyx=0">예약안내</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/checkIn?abc=0&zyx=1">체크인안내</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/fare?abc=0&zyx=2">운임안내</a></li>
                                    <li><a href="#" onclick="return false;">탑승수속 절차</a></li>
                                    <li><a href="#" onclick="return false;">출입국 신고서</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">탑승수속</a></li>
                                    <li><a href="#" onclick="return false;">연결 탑승수속</a></li>
                                    <li><a href="#" onclick="return false;">출입국 규정조회</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">수하물안내</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="<%=jsp%>/serviceinfo/baggage_guide?abc=1&zyx=0">수하물이용</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/baggage_free?abc=1&zyx=1">위탁수하물</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/baggage_compensation?abc=1&zyx=2">수하물보상</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">국제선 무료 위탁 수화물</a></li>
                                    <li><a href="#" onclick="return false;">국내선 무료 위탁 수화물</a></li>
                                    <li><a href="#" onclick="return false;">특수 수화물 위탁</a></li>
                                    <li><a href="#" onclick="return false;">휴대 가능 수하물</a></li>
                                    <li><a href="#" onclick="return false;">수하물 계산기</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">고객안내</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="<%=jsp%>/serviceinfo/infant?abc=2&zyx=0">유아여행안내</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/pregnant?abc=2&zyx=1">임신고객안내</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/disabled_passenger?abc=2&zyx=2">장애인고객안내</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/family_service?abc=2&zyx=3">패밀리서비스</a></li>
                                    <li class="no-compartment"><a href="<%=jsp%>/serviceinfo/with_pets?abc=2&zyx=4">반려동물동반</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/medical?abc=2&zyx=5">의료도움이 필요한 고객</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/cabin_health?abc=2&zyx=6">기내건강</a></li>
                                    <li><a href="#" onclick="return false;">혼자 여행하는 청소년</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">부가서비스</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="<%=jsp%>/serviceinfo/legroom?abc=3&zyx=0">레그룸좌석</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/businesszone?abc=3&zyx=1">비즈니스존</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/frontzone?abc=3&zyx=2">프론트존</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/duo?abc=3&zyx=3">듀오좌석</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/economysmartium?abc=3&zyx=4">이코노미</a></li>
                                    <li class="no-compartment"><a href="<%=jsp%>/serviceinfo/upgradestandby?abc=3&zyx=5">업그레이드</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/wifi?abc=3&zyx=6">기내와이파이</a></li>
                                    <li><a href="<%=jsp%>/serviceinfo/domestic?abc=3&zyx=7">기내통신판매</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">마일리지 적립</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="#" onclick="return false;">마일리지 적립몰</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 적립몰 이용안내</a></li>
                                    <li><a href="#" onclick="return false;">누락마일리지 적립</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">마일리지 제휴 항공사</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 양도</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 제휴 신용카드</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 제휴 호텔</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 제휴 렌터카</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">마일리지 사용</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="#" onclick="return false;">마일리지 사용몰</a></li>
                                    <li><a href="#" onclick="return false;">이용방법</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 항공권발급</a></li>
                                    <li><a href="#" onclick="return false;">부가서비스 이용</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">마일리지 항공권</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 항공권 공제표</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 항공권 사용</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 항공권 양도</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">항공권예약</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="#" onclick="return false;">PC결제 안내</a></li>
                                    <li><a href="#" onclick="return false;">모바일 결제 안내</a></li>
                                    <li><a href="#" onclick="return false;">신용카드 할부 결제</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">예약 부도 위약금</a></li>
                                    <li><a href="#" onclick="return false;">마일리지 항공권 유효기간</a></li>
                                    <li><a href="#" onclick="return false;">국내선 항공권 유효기간</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">온라인 할인쿠폰 사용 안내</a></li>
                                    <li><a href="#" onclick="return false;">유류할증료 안내</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">체크인/탑승수속</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="#" onclick="return false;">온라인 체크인하기</a></li>
                                    <li><a href="#" onclick="return false;">오토체크인</a></li>
                                    <li><a href="#" onclick="return false;">공항 키오스크 셀프 체크인</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">셀프 백드랍</a></li>
                                    <li><a href="#" onclick="return false;">공항 카운터 체크인</a></li>
                                    <li><a href="#" onclick="return false;">온라인 체크인 이용 가능시간</a></li>
                                    <li><a href="#" onclick="return false;">이용 가능 공항</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-section">
                            <div class="text-align-center bg-blue5 ">공항에서</div>
                            <div>
                                <ul class="clearfix">
                                    <li><a href="#" onclick="return false;">라운지조회</a></li>
                                    <li><a href="#" onclick="return false;">취항 공항 조회</a></li>
                                    <li><a href="#" onclick="return false;">출입국 신고서</a></li>
                                    <li><a href="#" onclick="return false;">기내 서비스 순서</a></li>
                                    <li class="no-compartment"><a href="#" onclick="return false;">특별 기내식</a></li>
                                    <li><a href="#" onclick="return false;">이달의 기내 특별 서비스</a></li>
                                    <li><a href="#" onclick="return false;">국제선 기내면세품</a></li>
                                    <li><a href="#" onclick="return false;">선호좌석 사전 예매</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-three-tenth">
                    <p class="faq-title">BEST 질문</p>
                    <div class="accordion">
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지 사용몰 이용시 마일리지 비밀번호 등록은 어떻게 해야 하나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    마일리지 사용몰 이용 시 고객님의 개인정보 보호를 위하여 마일리지 비밀번호를 사용하고 있습니다.<br>마일리지 비밀번호 등록을 아직 하지 않으신 고객님께서는 로그인 후 "홈>마이 가자에어>회원정보>마일리지 비밀번호 등록/변경"에서 본인 인증 후에 마일리지 비밀번호 등록을 하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지를 가족과 합산할수 있나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    마일리지 항공권 사용 시 부족한 마일리지 만큼 가족합산하여 이용하실 수 있습니다.<br/>등록 가능한 가족범위 내 총 8인까지 등록 가능하며, 마일리지 가족합산제도 신청서와 6개월이내 발급된 가족증빙서류를 아래의 방법으로 제출해주시기 바랍니다.<br/>
					※ 등록 범위 : 가족대표회원의 배우자, 자녀, 부모, 친/외조부모, 친/외손자녀, 형제, 자매, 사위, 며느리, 배우자의 부모<br/>
					※ 가족 마일리지 합산제도 신청서<br/>
					홈페이지 > 가자에어클럽 > 회원안내 > 가족합산 및 마일리지 양도 >신청서 다운로드<br/>
					※ 가족관계 증빙서류<br/>
					가족관계증명서 또는 주민등록등본 : 6개월이내 발급 서류<br/>
					※ 등록방법<br/>
					1) 홈페이지  로그인 후 마이 가자에어 > 가족회원관리에서 파일 업로드<br/>
					2) 팩스 접수 : 02-2669-4275/4276<br/>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>PC 메인 페이지에서 마우스 스크롤을 통한 탭 이동이 매끄럽지 않습니다.</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                    PC홈페이지는 화면 해상도 1600 X 900 에 최적화 되어 있습니다.(최소 해상도 1280 X 900 이상 지원)<br/>탭 이동이 매끄럽지 않을경우 브라우저창을 전체창으로 확대해서 이용하시기 바랍니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>항공권 또는 예약의 탑승자 이름 스펠링이 틀렸는데 고칠 수 있습니까?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    개인예약(Individual Booking)의 경우 이름 변경(Name Change) 기준은 다음과 같습니다.<br/> - 성(Last Name, Family Name)이 틀렸거나 성과 이름(Last Name, First Name)이 다른 경우 성함 변경은 불가합니다.<br/>
                                    기존 예약을 취소하고 다시 예약 하여야합니다.<br/> - 성함이 다른 경우(예: mihyun → eunju)에도 수정이 불가합니다.<br/>이름의 철자(Spelling)일부가 잘못되었으나 발음상의 이름이 동일한 경우만 수정 가능합니다.
                                    예:  ① youngsu → youngsoo   : 수정 가능<br/>② youngsu → youngju : 수정 불가<br/> - 단, 명절연휴기간 및 여행성수기간 그리고 이미 좌석이 만석인 경우에는 불가합니다.<br/>
                                    상기 기준은 예약의 오,남용을 방지하기 위해 모든 항공사가 기본적으로 적용하는 원칙입니다. 예약후 불편을 줄이기 위해서는 예약시점에 기록(성명,여정)을 꼼꼼하게 확인하셔야 합니다. 그리고 국제선의 경우 예약기록 및 항공권의 성명은 반드시 여권상에 기재되어 있는 영문성명과 일치하여야 합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지 항공권은 어떻게 발급 받나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    가자에어항공 홈페이지(http://flyasiana.com) 또는 예약영업센터를 통해 예약하실 수 있습니다.<br/>예약영업센터에서 예약 하시는 경우 반드시 마일리지 여행임을 말씀해 주시기 바라며, 안내 받으신 마일리지 항공권 발권 시한(Ticket Time Limit)까지 가자에어항공 홈페이지 및 모바일을 통해 발급 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>저 대신 다른 사람이 제 예약으로 갈 수는 없나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    예약된 승객(탑승자)의 이름은 변경할 수 없습니다.<br/>항공권은 탑승자 실명 예약으로, 탑승자의 이름 변경 시 기존의 예약을 취소하신 후 실제 탑승 승객의 이름으로 다시 예약 하셔야 합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지는 어떻게 적립하나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    회원님께서는 가자에어항공, 스타얼라이언스 항공사 탑승 및 가자에어항공과 제휴된 신용카드, 호텔, 렌터카, 인터넷 쇼핑몰 등을 이용하여 마일리지를 적립하실 수 있습니다.<br/>회원가입일 이전 실적에 대하여는 소급하여 적립되지 않습니다.<br/>적립 제휴사는 '가자에어항공 홈페이지(flyasiana.com) →가자에어클럽→ 마일리지 적립' 메뉴에서 확인하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>이메일로 아이디 받기/임시 비밀번호 받기를 신청했는데 메일이 오지 않습니다.</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    아이디/임시 비밀번호 이메일이 이미 발송 되었으나 수신여부는 회원님의 이메일 계정의 상황에 따라 다릅니다. 이메일 수신이 안되시는 경우는 회사의 스팸 정책으로 이메일 수신이 차단되거나 스팸 편지함으로 이메일을 받게 되실 수 있습니다.<br/>이메일 수신함의 스팸 편지함도 확인해 보시기 바랍니다. 등록된 이메일로 받기가 어려우신 경우 이메일 주소 변경 요청을 하시거나, 인증기관을 통해 본인 인증 후 확인 또는 비밀번호를 재설정 하시기 바랍니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>가족의 마일리지를 합산하여 온라인에서 마일리지 항공권을 발급 받으려면 어떻게 해야 하나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    우선 가족 마일리지 합산 제도에 가족이 등록되어야 합니다.<br/>등록 후 온라인(홈페이지/모바일)에서 마일리지 항공권을 발급 받으시려면 탑승하실 회원의 ID로 로그인 → 예약 → 항공권 예약 → 우측 상단에서 마일리지로 적용 버튼 선택 → 여정/항공편 선택 → 탑승자 선택 → 가족 합산 공제 → 구매 완료 순서로 발급이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>홈페이지에서 구매 후 운임영수증을 출력할 수 있나요</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    홈페이지에서 로그인 후  구매하신 항공권 운임 영수증은 로그인 하신 후 예약>예약조회>항공권 구매내역에서 영수증 출력이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>여행사에서 구입한 e-티켓도 인터넷 체크인이 가능한가요 ?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    여행사에서 구입한 항공권이라도 체크인이 가능합니다. 하지만 타사 항공기로 운항하는 공동운항편을 이용하시는 경우에는 이용이 제한됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>가족 회원으로 등록 되어 있지 않은 경우 양도 위임장을 제출하면 양도 가능하다고 하는데 홈페이지에서도 가능한가요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    가족 회원으로 등록되어 있지 않으면 홈페이지를 통한 양도 신청이 불가능합니다.<br/>먼저 가족 회원으로 등록하신 후, 등록된 가족의 마일리지 항공권을 발권 하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지에 유효기간이 있나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    2008년 10월 1일 부 마일리지 유효기간 제도를 도입하였습니다. 유효기간 제도 도입이전 적립된 마일리지는 유효기간이 없으며 도입일 이후 적립된 마일리지는 유효기간이 적용됩니다. 가자에어항공 및 제휴 항공사를 탑승하신 마일리지는 탑승일 기준으로, 기타 제휴사를 이용하신 마일리지는 적립일 기준으로 유효기간이 적용 됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지 항공권을 발급받기에는 마일리지가 조금 부족합니다. 부족한 마일리지를 현금으로 구입할 수 있나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    마일리지는 회원의 탑승에 대한 감사의 의미로 제공하고 있습니다. 마일리지를 금전적으로 환산할 수 없으므로 현금으로 구매할 수 없습니다.<br/>마일리지 항공권 이용 시  마일리지가 부족할 경우, 가족회원의 마일리지를 합산하여 사용할수 있는 가족 마일리지 합산 제도를 활용하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>이메일로 임시 비밀번호를 받았는데, 로그인이 되지 않습니다.</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    임시 비밀번호는 숫자와 영문자(소문자로) 발송해 드리므로, 대/소문자를 구분하여 입력하시기 바랍니다.<br/>임시 비밀번호를 2회 이상 발송 받으신 경우, 최근 수신한 임시 비밀번호로 로그인 하셔야 합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>예약확인을 하려면 예약번호를 반드시 알아야 하나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    온라인 예약조회는 로그인 예약조회와 비로그인 예약조회로 운영되고 있습니다. 로그인 예약조회는 예약기록에 회원정보가 입력되어 있는 경우 이용 가능하며 예약번호를 모르시더라도 로그인하신 후 일정 재확인을 하실 수 있습니다. 비로그인 예약조회는 예약기록에 회원정보가 없는 경우 이용하실 수 있으며  예약번호, 탑승일, 탑승구간, 이름을 입력하신 후 예약 조회를 하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>마일리지 사용시 유효기간 적용 마일리지부터 사용할 수 있나요?</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    마일리지 유효기간이 짧은 순서로 공제되며, 유효기간이 없는 마일리지는 가장 마지막에 공제됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="accordion-title">
                                <p>회원 가입 시 등록한 이메일 주소가 기억나지 않아요. 이메일 주소를 변경하고 싶습니다.</p>
                            </div>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    이메일 주소 변경을 원하실 경우 회원님의 신분증(사진이 부착된 주민등록증, 운전면허증, 여권 등)을 회원번호, 연락처, 수신 가능한 이메일, 요청사항을 기재(이메일 주소 변경과 임시 비밀번호 발송)하여 [가자에어클럽 서비스센터]로 FAX를 보내주시기 바랍니다.<br/>※ 주민등록번호의 경우 뒷자리가 보이지 않도록 마스킹(가려서) 처리 후 전송
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="customer-center">
                        <p>찾는 질문이 없다면?</p>
                        <p>문의사항을 남겨주세요.</p>
                        <input type="button" class="whiteBtn" value="문의사항 바로가기" onclick="location.href = '<%=jsp%>/board/reviewBoard/reviewBoard_list?pageNum=1&reviewType=1'">
                    </div>
                </div>
            </div>
        </section>
        
        <%@ include file="../common/footer.jspf" %>
        <script src="<%=path %>/Resources/JS/information.js"></script>
    </body>
</html>
