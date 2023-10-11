<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    
    <title>이벤트글 수정</title>
    <script language="JavaScript" src="E_script.js"></script>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" />
    
    <section>
    <div class="relative p-6 bg-white border border-gray-100">
    
        <h2 class="mt-4 text-lg font-large text-gray-900">이벤트글 수정</h3>
        <br>
	    <form method="post" name="writeform" action="./E_updateProc.shop" onsubmit="return writeSave()">
		    <!-- 입력하지 않고 매개변수로 전달해서 테이블에 저장(hidden) 페이징처리를 위함 -->
			<input type="hidden" name="num" value="${article.eventno}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="file_main" value="${article.img_main}">
			<input type="hidden" name="file_pc" value="${article.imgpath}">
			<input type="hidden" name="file_mobile" value="${article.imgpath2}">

			
			<div class="mb-6">
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">제목</label>
				    <input type="text" name="subject" value="${article.subject}" placeholder="이벤트 제목을 입력하세요." id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
			    <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">내용</label>
			    <input type="text" name="content" value="${article.content}" placeholder="내용입력은 선택사항입니다." id="large-input" class="block w-full  p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
			</div>
	</div>   	
             <div class="relative p-6 bg-white border border-gray-100">
             	<h3 class="mt-4 text-lg font-medium text-gray-900">이벤트 기간설정</h3>
           	 	<br>
             	<p class="mt-1.5  text-sm text-gray-700">
	             	<div class="flex space-x-5">
						<div>
						    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이벤트 시작일</label>
						    <input type="text" name="eventstart" value="${article.eventstart}" placeholder="0000. 00. 00" id="small-input" class="block w-60 p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
						</div>
						<div>
		 				- 
						</div>
						<div>
						    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이벤트 종료일</label>
						    <input type="text" name="eventend" value="${article.eventend}" placeholder="0000. 00. 00" id="small-input" class="block w-60 p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
						</div>
	                </div>
		            <br>
		            <hr>   
		            <h3 class="mt-4 text-lg font-medium text-gray-900">이벤트 이미지 업로드</h3>
		            <br>
		            <!-- 
		            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">목록용 사진 업로드</label>
				    <a href="img/img_event/${article.img_main}">
				    <input type="file" name="file_main" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" id="user_avatar" >
				    </a>
				    
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">목록보기에 보여질 이미지를 업로드하세요.</div>
				    <br>
				    
				    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">PC용 사진업로드</label>
				    <input type="file" name="file_pc" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" id="user_avatar" >
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">PC size에 맞는 이미지를 업로드하세요.(width: 768px 부터)</div>
				    <br>
				    
				    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">Mobile용 사진업로드</label>
				    <input type="file" name="file_mobile" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" id="user_avatar" >
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">Mobile size에 맞는 이미지를 업로드하세요.(width: 768px 까지)</div>
				    <br>
		             -->
		             
		            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">목록용 사진 업로드</label>
				    <a href="img/img_event/${article.img_main}">${article.img_main}</a>
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">목록보기에 보여질 이미지를 확인하세요.</div>
				    <br>
				    
				    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">PC용 사진업로드</label>
				    <a href="img/img_event/${article.imgpath}">${article.imgpath}</a>
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">PC 이미지를 확인하세요.</div>
				    <br>
				    
				    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">Mobile용 사진업로드</label>
				    <a href="img/img_event/${article.imgpath2}">${article.imgpath2}</a>
				    <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">Mobile 이미지를 확인하세요.</div>
				    <br>
				    
			
		        	<button type="button" onclick="location.href='./E_event.shop'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-left">
		        		글목록으로</button>
		        	<button type="reset"  class="mx-5 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		원래대로</button>
		        	<button type="submit"  class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		수정하기</button>&nbsp;
		        	<!-- 
		        	<input type="submit" value="수정하기" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right" />
		        		&nbsp;
		        	 -->
				</p>
				
			</div>
		
	    </form>
	 
	    
    </section>
    
    <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>