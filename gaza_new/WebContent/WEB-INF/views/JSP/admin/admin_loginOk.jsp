<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${adminId!=null }">
	<script>
		location.href= "<%=request.getContextPath() %>/JSP/admin/admin_dash";
	</script>
</c:if>
<c:if test="${adminId==null }">
	<script>
		alert("아이디와 비밀번호를 다시 확인하세요.");
		history.back();
	</script>
</c:if>