<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="<%=css %>/board.css" type="text/css"/>
<link rel="stylesheet" href="<%=css %>/notice.css" type="text/css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
<link rel="stylesheet" href="<%=resources %>/Admin/css/dataTables/jquery.dataTables.min.css" type="text/css"/>
<script src="<%=resources %>/Admin/js/dataTables/jquery.dataTables.min.js"></script>

<script>
	$(function(){
		//테이블 생성. DataTables////////////////////////////////////////////////////////////////////////
		var table = $("#boardTable").DataTable({
			"stateSave" : false,
			"ordering" : true,
			"order"          : [0, "desc"],
			"pagingType"     : "full_numbers",
			"row-border"     : true,
			"dom"            : '<"search"fB><"#tabBtn"><t>l<p>',
			"language"       : {
				"loadingRecords" : "로딩중...",
				"processing"     : "잠시만 기다려 주세요...",
				"infoEmpty"      : "검색된 결과가 없습니다.",
				"zeroRecords"    : "검색된 결과가 없습니다. 검색어를 다시 한 번 확인해주세요.",
				"lengthMenu"     : "_MENU_개씩 보기",
				"search" : "",
				"paginate" : {
					"previous" : "이전",
					"next" : "다음",
					"first" : "처음",
					"last" : "마지막"
				}
			},
			"drawCallback" : function(settings){
				$("#boardTable thead").remove();
			}
		});
		
		//탭메뉴 생성.
		var paneIdList = ['noticeAll','noticeGAZA','noticePartner','noticeOthers'];
		var btnIdList = ['btnAll', 'btnGAZA', 'btnPartner', 'btnOthers'];
		var btnList = ['전체','가자항공소식','제휴사소식','기타'];
		var tabBtnHTML = "";
		var tabPanelHTML = "";
		var tabType = ${tabType};
		for(i=0; i<paneIdList.length; i++){
			tabBtnHTML += "<button class='tabBtn";
			if(tabType===i){
				tabBtnHTML += " active";
			}
			tabBtnHTML += "'id='"+btnIdList[i]+"' onclick=\"location.replace('noticeBoard_list?pageNum=1&tabType="+[i]+"')\">";
			tabBtnHTML += "<img src='<%=img%>/icon/check.png'/>"+btnList[i]+"</button>";
		}
		document.getElementById("tabBtn").innerHTML = tabBtnHTML;
		
		//컨텐츠 열 숨기기
		table.column(4).visible(false,false);
		
		//검색조건 추가
		$(".dataTables_filter").prepend(`
				<select name="searchOption" id="searchOption" class="searchOption" title="검색 분류 선택">
				<option value="5">제목 + 내용</option>
				<option value="1">제목</option>
				<option value="4">내용</option>
				<option value="3">날짜</option>
				</select>
				`);
		//검색박스 추가
		$(".dataTables_filter").append("<input type='text' id='searchBox' placeholder='검색어를 입력해주세요...'>");
		
		var selected = 5;
		//조건변경 이벤트
		$("#searchOption").change(function(){
			selected = $("#searchOption option:selected").val();
		});
		
		//조건 변경된 상태에서 검색 시 조건검색 실행.
			$("#searchBox").keyup(function(){
				if(selected==5){
					table.search(this.value).draw();
				}else if(selected==1){
					table.columns(1).search(this.value).draw();
				}else if(selected==4){
					table.columns(4).search(this.value).draw();
				}else if(selected==3){
					table.columns(3).search(this.value).draw();
				}
			});
		
		//글 타입 태그 추가
		$(".boardTbl tr:nth-child(1) h4").prepend("<span class='subjectTag'>new</span>");
		$(".boardTbl tr:nth-child(2) h4").prepend("<span class='subjectTag'>new</span>");
	});
</script>
</head>
<body>
	<%@ include file="../../common/nav.jspf" %>
	<section class="content">
	<div id="warp">
		<div id="contents">
			<h3>
			<c:if test="${vo.tabType==0 }">공지사항</c:if>
			<c:if test="${vo.tabType==1 }">가자항공소식</c:if>
			<c:if test="${vo.tabType==2 }">제휴사소식</c:if>
			<c:if test="${vo.tabType==3 }">기타 공지사항</c:if>
			</h3>
			<section id="board">
			
				<div id="tabPanel">
					<div id="noticeAll" class='tabcontent'>
						<div class='boardList'>
							<!-- table-------------------------------------------------------------------------- -->
							<table id="boardTable" class="boardTbl row-border">
								<colgroup>
									<col width="10%">
									<col width="70%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>조회수</th>
										<th>게시일</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="v" items="${lst}">
									<tr>
										<td>${v.noticeNum }</td>
										<td>
											<h4><span class="subjectTag">
												<c:if test="${v.noticeType == 1}">
													공지
												</c:if>
												<c:if test="${v.noticeType == 2}">
													제휴
												</c:if>
												<c:if test="${v.noticeType == 3}">
													기타
												</c:if>
												</span>
												<a href="<%=jsp %>/board/noticeBoard/noticeBoard_view?
														noticeNum=${v.noticeNum}&pageNum=${vo.pageNum}
														&tabType=${vo.tabType}">${v.subject }</a>
												<br>
											</h4>
											<div class="contentOver">${v.subject }</div>
										</td>
										<td>${v.hit}</td>
										<td>${v.regdate}</td>
										<td>${v.content }</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div><!-- noticeAll end -->
				</div><!-- tabPanel end -->
			</section>
		</div>
	</div>
	</section>
	<%@ include file="../../common/footer.jspf" %>
</body>
</html>