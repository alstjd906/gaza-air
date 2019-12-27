<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt<=0 }">
	<script>
		alert("비밀번호를 잘못 입력하셨습니다. 다시 확인해주세요.");
	</script>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 재확인</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/Resources/CSS/my_page.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/Resources/CSS/navNfooter.css" type="text/css"/>
        <script>window.onbeforeunload = () => window.scrollTo(0, 0)</script>
    </head>
    <body>
    
    <%@ include file="../../common/nav.jspf" %>
        <section class="content">
            <h3>비밀번호 확인</h3>
            <ul class="list-type2 list-border">
                <li>회원님의 개인 정보를 안전하게 보호하기 위해 비밀번호를 다시 입력하여 주십시오.</li>
            </ul>
          	<form method="post" action="<%=jsp %>/account/change/password_change">
            <div class="table-form">
                <div class="row clearfix">
                    <div class="table-row-title">
                        회원 아이디
                    </div>
                    <div>
                        <input type="text" value="${memberId }" name="memberId" style="width: 296px;" readonly>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="table-row-title">
                        비밀번호 확인
                    </div>
                    <div>
                        <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요" style="width: 296px;">
                    </div>
                </div>
            </div>
            <ul class="list-type2">
                <li>회원님의 개인 정보를 보호하기 위해, 회원정보 변경 시 비밀번호를 재확인합니다.</li>
                <li>비밀번호는 대/소문자를 구별하여 입력해 주십시오.</li>
            </ul>
            <div class="button-wrapper">
                <input type="submit" class="blueBtn confirm" value="확인">
            </div>
      		</form>
        </section>
        <%@ include file="../../common/footer.jspf" %>
    </body>
</html>