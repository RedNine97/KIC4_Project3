<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=./noticeList.shop?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	<script>
		alert("비밀번호가 일치하지 않습니다. \n다시 확인해주세요.");
		history.back();
	</script>
</c:if>