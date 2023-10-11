<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<c:choose>
	    <c:when test="${check==true}">
	    	<jsp:forward page="/U_kakaoSignIn.shop">
			    <jsp:param value="${memid}" name="memid"/>
			    <jsp:param value="${thumbnail_image}" name="thumbnail_image"/>
			    <jsp:param value="${access_Token}" name="access_Token"/>
		    </jsp:forward>
		</c:when>
		<c:otherwise>
			<jsp:forward page="/U_kakaoSignUp.shop">
				<jsp:param value="${memid}" name="memid"/>
				<jsp:param value="${email}" name="email"/>
				<jsp:param value="${nickname}" name="nickname"/>
				<jsp:param value="${thumbnail_image}" name="thumbnail_image"/>
			</jsp:forward>
		</c:otherwise>
  </c:choose>
</body>
