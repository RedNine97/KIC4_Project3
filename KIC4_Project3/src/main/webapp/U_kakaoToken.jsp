<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
  <c:choose>
    <c:when test="${!access_Token.isEmpty()}">
	    <jsp:forward page="/U_kakaoUserInfo.shop">
			<jsp:param value="${access_Token}" name="access_Token"/>
			<jsp:param value="${refresh_Token}" name="refresh_Token"/>
		</jsp:forward>
	</c:when>
	<c:otherwise>
		<meta http-equiv="Refresh" 
	             content="0;url=./U_LogError.shop">
	</c:otherwise>
  </c:choose>
</body>
