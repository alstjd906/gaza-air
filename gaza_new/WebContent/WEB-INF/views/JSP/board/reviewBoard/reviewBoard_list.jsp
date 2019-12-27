<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기</title>
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
			"dom"            : '<"search"fB><"#tabBtn"><"#writeBtnWrap"><t>l<p>',
			"language"       : {
				"loadingRecords" : "로딩중...",
				"processing"     : "잠시만 기다려 주세요...",
				"infoEmpty"      : "검색된 결과가 없습니다.",
				"zeroRecords"    : "작성된 문의 글이 없습니다. 문의할 사항이 있다면 문의 글 작성하기를 클릭하세요.",
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
		var paneIdList = ['review','question'];
		var btnIdList = ['btnReview', 'btnQue'];
		var btnList = ['이용후기','문의사항'];
		var tabBtnHTML = "";
		var tabPanelHTML = "";
		var reviewType = ${vo.reviewType};
		for(i=0; i<paneIdList.length; i++){
			tabBtnHTML += "<button class='reviewTabBtn tabBtn";
			if(reviewType===i){
				tabBtnHTML += " active";
			}
			tabBtnHTML += "'id=\""+btnIdList[i]+"\">";
			tabBtnHTML += "<img src='<%=img%>/icon/check.png'/>"+btnList[i]+"</button>";
		}
		document.getElementById("tabBtn").innerHTML = tabBtnHTML;
		
		//로그인 안되어 있을 때 문의사항 못가게 막기
		$("#btnReview").on("click", function(){
			location.replace('reviewBoard_list?pageNum=1&reviewType=0');
		});
		
		$("#btnQue").on("click", function(){
			if("${vo.writer}"=="0"){
				alert("문의사항은 로그인 후 이용해주세요.");
				return false;
			}else{
				location.replace('reviewBoard_list?pageNum=1&reviewType=1');
			}
		});
		
		//컨텐츠 열 숨기기
		table.column(5).visible(false,false);
		
		//검색조건 추가
		$(".dataTables_filter").prepend(`
				<select name="searchOption" id="searchOption" class="searchOption" title="검색 분류 선택">
				<option value="6">제목 + 내용</option>
				<option value="1">제목</option>
				<option value="5">내용</option>
				<option value="4">날짜</option>
				<option value="2">아이디</option>
				</select>
		`);
		
		//검색박스 추가
		$(".dataTables_filter").append("<input type='text' id='searchBox' placeholder='검색어를 입력해주세요...'>");
		
		var selected = 6;
		//조건변경 이벤트
		$("#searchOption").change(function(){
			selected = $("#searchOption option:selected").val();
		});
		
		//조건 변경된 상태에서 검색 시 조건검색 실행.
			$("#searchBox").keyup(function(){
				if(selected==6){
					table.search(this.value).draw();
				}else if(selected==1){
					table.columns(1).search(this.value).draw();
				}else if(selected==2){
					table.columns(2).search(this.value).draw();
				}else if(selected==4){
					table.columns(4).search(this.value).draw();
				}else if(selected==5){
					table.columns(5).search(this.value).draw();	
				}
			});
		
		//글 타입 태그 추가
		if("${vo.reviewType}"=="0"){
			$(".boardTbl tr:nth-child(1) h4").prepend("<span class='subjectTag'>new</span>");
			$(".boardTbl tr:nth-child(2) h4").prepend("<span class='subjectTag'>new</span>");
		}
		//글쓰기 버튼 추가
		var writeTxt = "<a href='<%=jsp%>/board/reviewBoard/guest_review_write?reviewType=${vo.reviewType}'><button id='writeBtn' title='글 작성 페이지로 이동.'>";
		if("${vo.reviewType}"=="0"){
			writeTxt += "이용후기";
		}else{
			writeTxt += "문의사항";
		}
		writeTxt += " 글쓰기</button></a>";
		$("#writeBtnWrap").append(writeTxt);
	});
</script>
</head>
<body>
	<%@ include file="../../common/nav.jspf" %>
	<section class="content">
	<div id="warp">
		<div id="contents">
			<h3>
			<c:if test="${vo.reviewType==0 }">이용후기</c:if>
			<c:if test="${vo.reviewType==1 }">문의사항</c:if>
			</h3>
			<section id="board">
				<div id="tabPanel">
					<div id="boardAll" class='tabcontent'>
						<div class='boardList'>
							<!-- table-------------------------------------------------------------------------- -->
							<table id="boardTable" class="boardTbl row-border">
								<colgroup>
									<col width="10%">
									<col width="60%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>아이디</th>
										<th>조회수</th>
										<th>게시일</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="v" items="${lst}">
									<tr>
										<td>${v.reviewNum }</td>
										<td>
											<h4><span class="subjectTag">
												<c:if test="${v.reviewType == 0}">
													후기
												</c:if>
												<c:if test="${v.reviewType == 1}">
													문의
												</c:if>
												</span>
												<a href="<%=jsp %>/board/reviewBoard/reviewBoard_view?
														reviewNum=${v.reviewNum}&pageNum=${vo.pageNum}
														&reviewType=${vo.reviewType}">${v.subject }</a>
												<br>
											</h4>
											<div class="contentOver">${v.subject }</div>
										</td>
										<td>${v.writer }</td>
										<td>${v.hit}</td>
										<td>${v.regdate}</td>
										<td>${v.content }</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div><!-- boardAll end -->
				</div><!-- tabPanel end -->
			</section>
		</div>
	</div>
	</section>
	<%@ include file="../../common/footer.jspf" %>
</body>
</html>