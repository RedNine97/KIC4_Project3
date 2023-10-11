<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비민번호 변경완료(U_SearchPwdUpdateProc.jsp)</title>
</head>
<body>
	  <c:choose>
	    <c:when test="${PwdUpCheck==true}">
	    	<script>
				alert("비밀번호 변경을 완료했습니다.");
			</script>
		    <meta http-equiv="Refresh" 
		             content="0;url=./U_LoginPage.shop">
		</c:when>
		<c:otherwise>
			<script>
				alert("비밀번호 변경을 실패했습니다.\n 관리자에게 문의하세요:)");
			</script>
			<meta http-equiv="Refresh" 
		             content="0;url=./U_LoginPage.shop">
		</c:otherwise>
	  </c:choose>
</body>
</html>
