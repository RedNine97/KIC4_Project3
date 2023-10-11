<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="./script.js"></script>
    
    <title>공지사항 게시물 삭제</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

	  <!-- 게시물 삭제 section -->
	    <section>
    <div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
      <div >
        공지사항 삭제
      </div>
    </div>
	  

   

    
    <form action="./noticeDeletePro.shop?num=${num}&pageNum=${pageNum}" method="get">
	    <input type="hidden" name="num" value="${article.noticeno}">
		<input type="hidden" name="pageNum" value="${pageNum}">

      <!-- ====비밀번호로 삭제시 사용 part, 이부분 사용시 제이쿼리 수정 필요==== -->
    <div class="grid grid-flow-row w-full text-center">
      <div class="my-8">
        <span class="block">게시물을 정말 삭제하시겠습니까? </span>
        <span>글 삭제를 원하시면 비밀번호를 입력해주세요.</span>
      </div>
        
        <div class="block text-sm font-medium text-gray-700 font-semibold">비밀번호 입력</div>
          <input type="password" name="passwd" id="mem_passwd"  maxlength="20" 
          class="place-self-center mt-1 block w-80 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">

		<p class="hidden text-center text-sm mt-1 mb-3 text-red-500" 
          id="empty_passwd">비밀번호를 입력해주세요.</p>

        <div class="grid grid-cols-2 mt-6 justify-items-stretch md:grid-cols-3 px-4 py-3 text-center sm:px-6">
          <button type="button" class="col-span-1 md:w-40 md:order-2 md:col-end-auto md:justify-self-end rounded-md border border-blue-700 bg-white py-2 px-6 text-lg md:text-sm font-medium text-blue-700 shadow-sm hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-0 mx-2 my-2" 
          		 	  onClick="location.href='./noticeList.shop?pageNum=${pageNum}'">
            <!-- 리스트 이동 -->
            목록으로
          </button>
          <button type="submit" class="col-span-1 md:w-40 md:order-1 md:col-start-2 md:justify-self-center rounded-md border border-transparent bg-blue-700 py-2 px-6 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 mx-2 my-2"  id="pwcheck">
          삭제하기</button>
          <!-- ./N_noticeList.html 로 이동 설정중 -->          
        </div>
      </div>
      <!--  ====비밀번호로 삭제시 사용 part==== -->

    </form>
  </section>
  <!-- 게시물 삭제 section -->
  
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>