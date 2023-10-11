<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginCheck" value="${requestScope.loginCheck}"/>
  <c:choose>
    <c:when test="${loginCheck==true}">
	    <c:set var="memid" value="${requestScope.memid}" scope="session"/>
	    <c:set var="thumbnail_image" value="${requestScope.thumbnail_image}" scope="session"/>
	    <c:set var="access_Token" value="${requestScope.access_Token}" scope="session"/>
	    <meta http-equiv="Refresh" 
	             content="0;url=./M_mainpage.shop">
	</c:when>
	<c:otherwise>
		<meta http-equiv="Refresh" 
	             content="0;url=./U_LogError.shop">
	</c:otherwise>
  </c:choose>