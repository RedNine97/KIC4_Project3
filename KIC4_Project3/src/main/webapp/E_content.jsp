<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*,java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="checkManager" value="${checkManager}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    
    <title>전통주 사이트</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

    <section>
    	<div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
	        <header class="text-center">
	          <h2 class="text-xl font-bold text-gray-900 sm:text-3xl">
	            ${article.subject}
	          </h2>
	    
	          <p class="max-w-md mx-auto mt-4 text-gray-500">
	            술주랑만의 특별한 이벤트를 확인해보세요!
	          </p>
	          <div class="flex relative inline-block max-w-md mx-4 mt-4 text-gray-500 float-right">글 번호: ${article.eventno}    조회수: ${article.readcount}</div>
	          <br>
	        </header>
	        <div class="max-w-screen-xl px-4 py-8 mx-auto sm:py-5 ">
		        <div class="max-w-screen-xl mx-auto  sm:pb-5 ">
		          <hr>
		        </div>
		        <div class="flex relative inline-block max-w-md mx-4 mt-4 text-gray-500">${article.content}</div>
			    <img src="img//img_event/${article.imgpath}" class="hidden md:flex" alt="이미지">
				<img src="img/img_event/${article.imgpath2}" class="flex md:hidden" alt="이미지">
	        </div>
    	</div>


      <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
        <br>
			<button type="button" onclick="location.href='./E_event.shop?pageNum=${pageNum}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-left">
        		글목록으로</button>
		<c:if test="${checkManager==1}">
        	<button type="button" onclick="location.href='./E_deleteForm.shop?num=${article.eventno}&pageNum=${pageNum}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right mx-4">
        		글삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
        	<button type="button" onclick="location.href='./E_updateForm.shop?num=${article.eventno}&pageNum=${pageNum}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
        		글수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
        </c:if>
        <br>
	 </div>
    </section>
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>