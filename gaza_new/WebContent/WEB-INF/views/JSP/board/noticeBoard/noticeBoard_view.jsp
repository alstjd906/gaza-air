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
			<c:if test="${tabType==0 }">공지사항</c:if>
			<c:if test="${tabType==1 }">가자항공소식</c:if>
			<c:if test="${tabType==2 }">제휴사소식</c:if>
			<c:if test="${tabType==3 }">기타 공지사항</c:if>
		</h3>
		<hr/>
		<div id="brd_title" class="col-three-fourth">
			${vo.subject }
		</div>
		<div id="hitNdate">조회수 ${vo.hit } │ 날짜 ${vo.regdate }</div>
		<hr style="border:1px solid #eee"/>
			<div id="brd_content">
				${vo.content }
			</div>
		<hr/>
			<div class="brd_bottom">
			∧ 다음글
				<a href="<%=jsp%>/board/noticeBoard/noticeBoard_view?&pageNum=${vo.pageNum}&tabType=${tabType}
						<c:if test="${nextNum != 0}">
							&noticeNum=${nextNum}
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
				<a href="<%=jsp %>/board/noticeBoard/noticeBoard_view?pageNum=${vo.pageNum}&tabType=${tabType}
						<c:if test="${prevNum != 0}">
							&noticeNum=${prevNum}
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
			<a href="<%=jsp%>/board/noticeBoard/noticeBoard_list?pageNum=${vo.pageNum}&tabType=${tabType}">
				<button class="whiteBtn">목록보기</button>
			</a>
		</div>
	</section>
	<%@ include file="../../common/footer.jspf" %>
</body>
</html>