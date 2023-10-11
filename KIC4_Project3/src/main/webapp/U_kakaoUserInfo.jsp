<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
  <c:choose>
    <c:when test="${!memid.isEmpty()}">
	    <jsp:forward page="/U_kakaoLoginCheck.shop">
			<jsp:param value="${memid}" name="memid"/>
			<jsp:param value="${email}" name="email"/>
			<jsp:param value="${nickname}" name="nickname"/>
			<jsp:param value="${age_range}" name="age_range"/>
			<jsp:param value="${thumbnail_image}" name="thumbnail_image"/>
			<jsp:param value="${access_Token}" name="access_Token"/>
		</jsp:forward>
	</c:when>
	<c:otherwise>
		<meta http-equiv="Refresh" 
	             content="0;url=./U_LogError.shop">
	</c:otherwise>
  </c:choose>
</body>
