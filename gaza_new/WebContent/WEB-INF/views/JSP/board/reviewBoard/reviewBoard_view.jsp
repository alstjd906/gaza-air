<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.subject }</title>
<link rel="stylesheet" href="<%=css %>/board.css" type="text/css"/>
</head>
<body>
	<%@ include file="../../common/nav.jspf" %>
	<section class="content">
		<h3>
			<c:if test="${vo.reviewType==0 }">이용후기</c:if>
			<c:if test="${vo.reviewType==1 }">문의사항</c:if>
		</h3>
		<hr/>
		<div id="brd_title" class="col-three-fifth reviewSubject">
			${vo.subject }
		</div>
		<div id="hitNdate">작성자 ${vo.writer} │ 조회수 ${vo.hit } │ 날짜 ${vo.regdate }</div>
		<hr style="border:1px solid #eee"/>
			<div id="brd_content">
				${vo.content }
			</div>
		<hr/>
			<div class="brd_bottom">
			∧ 다음글
				<a href="<%=jsp%>/board/reviewBoard/reviewBoard_view?&pageNum=${vo.pageNum}&reviewType=${reviewType}
						<c:if test="${nextNum != 0}">
							&reviewNum=${nextNum}
						</c:if>
						" 
						<c:if test="${nextNum == 0}">
							onclick="return false"
						</c:if>
						>
						${nextSubject}
				</a>
			</div>
		<hr style="border:1px solid #eee"/>
			<div class="brd_bottom">
			∨ 이전글
				<a href="<%=jsp %>/board/reviewBoard/reviewBoard_view?pageNum=${vo.pageNum}&reviewType=${reviewType}
						<c:if test="${prevNum != 0}">
							&reviewNum=${prevNum}
						</c:if>
						" 
						<c:if test="${prevNum == 0}">
							onclick="return false"
						</c:if>
						>
						${prevSubject}
				</a>
			</div>
		<hr style="border:1px solid #eee"/>
		<div id="list_btn">
			<a href="<%=jsp%>/board/reviewBoard/reviewBoard_list?pageNum=${vo.pageNum}&reviewType=${reviewType}">
				<button class="whiteBtn">목록보기</button>
			</a>
			<c:if test="${vo.writer==memberId }">
			<a href="<%=jsp%>/board/reviewBoard/guest_review_edit?pageNum=${vo.pageNum}&reviewType=${reviewType}&reviewNum=${vo.reviewNum}">
				<button class="whiteBtn">글 수정</button>
			</a>
			<a onclick="delChk()">
				<button class="whiteBtn">글 삭제</button>
			</a>
			</c:if>
		</div>
	</section>
	<%@ include file="../../common/footer.jspf" %>
	<script>
		function delChk(){
			var isDel = confirm("정말 삭제하시겠습니까?");
			if(isDel){
				location.href = "<%=jsp%>/board/reviewBoard/reviewBoard_del?pageNum=${vo.pageNum}&reviewType=${reviewType}&reviewNum=${vo.reviewNum}";
			}
		}
		var isCnt = ${cnt!=null};
		if(isCnt){
			alert("글 삭제를 실패하였습니다.");
		}
	</script>
</body>
</html>