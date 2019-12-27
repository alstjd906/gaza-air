<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0 }">
	<script>
		alert("비밀번호가 정상적으로 변경되었습니다.")
		location.href= "<%=jsp%>/account/change/account_info";
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("비밀번호 변경 실패하였습니다. 입력하신 정보를 다시 확인해보세요.");
		history.back();
	</script>
</c:if>
