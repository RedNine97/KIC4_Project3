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
    <title>공지사항 보기</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />
	
	  <!-- 공지사항 확인하기 section -->
  <section>
    <div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
      <div >
        공지사항
      </div>
    </div>

  
    <div class="grid mt-8">
      
      <!--공지사항 grid 부분 -->
      <div class="justify-self-center w-11/12 md:w-10/12 md:border-t  bg-gray-200 md:bg-white border grid grid-cols-4 py-1  md:py-0 md:grid-cols-10">
        <!-- table head 부분 start -->
        <div class="col-span-2 grid grid-cols-10 md:col-span-full md:order-1">
          <div class="pl-2 md:bg-gray-50 md:border-r hidden md:grid md:col-span-1">제목</div>
          <div class="px-2 col-span-full md:col-span-9 ">
            <span>${article.subject}</span>
          </div>
        </div>
			<!-- 시간까지 나타낼 경우  -->
        <div class="md:border-t col-span-2 md:col-span-8 grid md:grid-cols-8 md:order-3">
          <div class="pl-2 md:bg-gray-50 md:border-r hidden md:grid md:col-start-1 md:col-span-1">작성일</div>
          <div class="text-right px-2 md:pr-0 md:text-left md:col-span-2">
            <span><fmt:formatDate value="${article.noticedate}" timeStyle="medium" pattern="yy.MM.dd (hh:mm)"/></span>
          </div>
        </div>

        <div class="md:border-t col-span-2 md:col-span-full grid grid-cols-10 md:order-2">
          <div class="pl-2 md:bg-gray-50 md:border-r hidden md:grid md:col-span-1">작성자</div>
          <div class="px-2 col-span-full md:col-span-9 ">
            <span>관리자</span>
          </div>
        </div>

        <div class="md:border-t col-span-2 grid text-right md:text-center md:grid-cols-2 md:col-start-9 md:col-span-2 md:order-4">
          <div class="lg:px-2 md:bg-gray-50 md:border-x hidden md:grid col-span-1">조회수</div>
          <div class="px-2 md:col-span-1">
            <span class="md:hidden">조회수 : </span>
            <span class="px-2">${article.count}</span>
          </div>
        </div>
        <!-- table head 부분 end -->

        <!-- 본문 -->
        <div class="px-2 py-3 h-96 md bg-white border col-span-full md:order-5">
          <span>${article.content}</span>
        </div>
        
      </div>
      <!--공지사항 grid 부분 -->

      <div class="grid grid-cols-2 md:grid-cols-3 bg-gray-50 px-4 py-3 text-center sm:px-6">

        <div class="flex justify-center col-span-full justify-items-stretch md:w-96 md:order-1 md:justify-self-center md:col-start-2 md:col-span-1">
        <c:if test="${checkManager==1}">
          <button type="button" class="col-span-1 w-1/2 md:w-28 rounded-md border border-transparent bg-blue-700 py-2 px-6 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 mx-1 my-2"
          onClick="location.href='./noticeUpdate.shop?num=${article.noticeno}&pageNum=${pageNum}'">
            글 수정
          </button>    
          <button type="button" class="col-span-1 w-1/2 md:w-28 rounded-md border border-transparent bg-blue-700 py-2 px-6 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 mx-1 my-2"
          onClick="location.href='./noticeDelete.shop?num=${article.noticeno}&pageNum=${pageNum}'">
            글 삭제
          </button>   
          </c:if>        
        </div>
 
        <button type="button" class="col-span-full md:col-span-1 w-full md:w-28 md:order-2 md:col-end-auto md:justify-self-end rounded-md border border-blue-700 bg-white py-2 px-6 text-lg md:text-sm font-medium text-blue-700 shadow-sm hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-0 mr-4 my-2" 
        onClick="location.href='./noticeList.shop'">
          목록으로
        </button>
      </div>
    </div>
  </section>
  <!-- 공지사항 확인하기 section -->

<!-- 아랫부분에 리스트 나오게 할까 했는데 생략해도 될거같아서 생략 -->

<jsp:include page="footer.jsp" flush="false" />
</body>
</html>