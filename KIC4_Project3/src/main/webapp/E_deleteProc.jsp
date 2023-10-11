<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=./E_event.shop?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	<script>
		alert("관리자정보 불일치! \n 로그인 정보를 확인해주세요!");
		history.back();
	</script>
</c:if>