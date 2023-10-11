<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="script.js?ver=2.4"></script>
    
	<title>회원수정결과</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />
	<!-- Section Start -->
	<section>
		<center>
			<c:choose>
		    <c:when test="${check==true}">
		  		<script>
				alert("성공적으로 수정되었습니다!");
				</script>
			    <meta http-equiv="Refresh" content="0;url=./Y_myPage.shop">
			</c:when>
			<c:otherwise>
				<script>
				alert("수정도중 에러가 발생되었습니다!");
				</script>
				<meta http-equiv="Refresh" content="0;url=./Y_myInfo.shop">
			</c:otherwise>
		  	</c:choose>	
		</center>
	</section>
	<!-- Section End -->
    
    <jsp:include page="footer.jsp" flush="false" />
</body>
</html>