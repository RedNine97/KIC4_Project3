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
    
    <title>글 삭제하기 폼</title>
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
	            정말로 글을 삭제하시겠습니까?
	          </p>
	          <div class="flex relative inline-block max-w-md mx-4 mt-4 text-gray-500 float-right">글 번호: ${article.eventno}    조회수: ${article.readcount}</div>
	          <br>
	        </header>
	        <div class="max-w-screen-xl px-4 py-8 mx-auto sm:py-5 ">
		        <div class="max-w-screen-xl mx-auto  sm:pb-5 ">
		          <hr>
		        </div>
		        <form method="POST" name="delForm"  action="./E_deleteProc.shop?num=${num}&pageNum=${pageNum}" onsubmit="return deleteSave()">
	        		<div>
					    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
					    <input type="password" name="passwd" placeholder="비밀번호를 입력하세요." id="small-input" class="block w-60 p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
					</div>
					<div class="max-w-screen-xl mx-auto my-4 sm:pb-5 ">
		            	<hr>
		        	</div>
					<button type="button" onclick="location.href='./E_event.shop?pageNum=${pageNum}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-left">
		        		글목록으로</button>
		        	<button type="submit"  class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		삭제하기</button>&nbsp;
       			</form>
	        </div>
    	</div>
    </section>
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>