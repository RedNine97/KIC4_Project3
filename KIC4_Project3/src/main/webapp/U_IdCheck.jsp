<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
 <HEAD>
  <title>로그인페이지</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script language="JavaScript" src="U_script.js?ver=1.0"></script>
 </HEAD>
 <BODY class="bg-blue-100">
    <div class="py-12 px-5">
          <div class="bg-white text-center py-3.5 rounded">
			  <c:if test="${check}">
			  		<b class="inline-flex text-red-500">${memid}</b>는 이미 존재하는 ID입니다<p>
			  </c:if>
			  <c:if test="${check eq false}">
			  	<b class="inline-flex text-blue-600">${memid}</b>는 사용 가능합니다<p>
			  </c:if>
			  <br>
			    <a href="#" onClick="self.close()">
			    <button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-1 border border-blue-500 hover:border-transparen rounded-full">
 					 닫기
				</button></a>
        </div>
      </div>
 </BODY>
</HTML>