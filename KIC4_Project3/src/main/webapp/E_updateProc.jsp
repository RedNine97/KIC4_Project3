<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=./E_event.shop?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	<script>
		alert("관리자권한이 없습니다! \n 관리자로 로그인해주세요!");
		history.back();
	</script>
</c:if>