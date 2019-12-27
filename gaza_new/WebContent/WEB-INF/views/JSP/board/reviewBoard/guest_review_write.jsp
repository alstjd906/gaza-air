<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${memberId==null || memberId=='' }">
	<script>
		alert("로그인 후 이용해주세요.");
		history.back();
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=css %>/layout.css" type="text/css"/>
<link rel="stylesheet" href="<%=css %>/write.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.13.0/full/ckeditor.js"></script>
</head>
<body>
	<%@ include file="../../common/nav.jspf" %>
	<h3>
		<c:if test="${reviewType==0 }">이용후기</c:if>
		<c:if test="${reviewType==1 }">문의사항</c:if>
	</h3>
	<hr/>
	
	<div id="wrt_all">
	<form id="wrt_frm" method="post" action="<%=jsp %>/board/reviewBoard/writeOk">
		<input type="hidden" name="reviewType" value="${reviewType }">
		<div class="row clearfix">
			<div class="col-tenth row-title">분류</div>
			<div class="col-nine-tenth">
				<select id="sel" name="txtType">
					<option value="">-선택하세요-</option>
					<c:if test="${reviewType==0 }">
						<option value="[이용후기]">이용후기</option>
						<option value="[칭찬합니다]">칭찬합니다</option>
					</c:if>
					<c:if test="${reviewType==1 }">
						<option value="[일반 문의사항]">일반 문의사항</option>
						<option value="[개선해주세요]">개선해주세요</option>
					</c:if>
				</select>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-tenth row-title">제목</div>
			<div class="col-nine-tenth">
				<input type="text" name="subject" id="wrt_subject" size="100"/>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-tenth row-title">글쓴이</div>
			<div class="col-nine-tenth">
				${memberId }
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-tenth row-title">내용</div>
		</div>
	 	<div class="board-cont">
	 		<textarea id="wrt_content" name="content"></textarea>
	 	</div>
	 		<script>
	 			CKEDITOR.replace("wrt_content", {height:'400px', filebrowserImageUploadUrl:'/upload/ckeditor_upload.asp'});
	 		</script>
	</form>
	</div>
	<hr/>
	
	<div id="list_btn">
		<button class="whiteBtn" id="back">이전으로</button>
		<button class="blueBtn" onclick="document.getElementById('wrt_frm').submit()">등록하기</button>
	</div> 
	
	<%@ include file="../../common/footer.jspf" %>
	<script>
		document.getElementById("back").addEventListener("click", function(){
			history.back();
		});
		var isCnt = ${cnt!=null};
		if(isCnt){
			alert("글 등록을 실패하였습니다. 입력한 데이터를 다시 확인해주세요.");
		}
	</script>
</body>

</html>