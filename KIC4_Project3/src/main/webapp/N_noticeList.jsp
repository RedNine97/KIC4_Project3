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
    <title>공지사항 목록</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

	<!--공지사항 section start -->
  <section class="grid">
  
	<div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
    	<div >
       	공지사항
      </div>
    </div>
  


	
    <div class="place-self-center 2xl:w-11/12 border-b border-gray-300">
      <div class="grid mb-0 md:mb-2">
	  	<div class="text-gray-500 place-self-end">(전체 글:${pgList.count})</div>
	  </div>
      <div class=" text-center border-y-2 hidden border-gray-300 md:grid md:grid-cols-12 bg-gray-50">
        <div class=" md:col-span-1">번호</div>
        <div class="text-left md:col-span-8">제목</div>
        <div class=" md:col-span-1">작성자</div>
        <div class="md:col-span-1">작성일</div>
        <div class=" md:col-span-1">조회수</div>
      </div>

<!-- 게시판에 공지사항 글이 없을때 -->
<c:if test="${pgList.count==0}">	   
    <div class="relative p-6 bg-white border border-gray-100">
    	<h3 class="text-lg font-medium text-gray-900">공지사항이 없습니다.</h3>
    </div>
</c:if>

<!-- 공지사항 글이 1개라도 있으면 -->		
<c:if test="${pgList.count>0}">
	<c:set var="number" value="${pgList.number}" />
	<c:forEach var="article" items="${articleList}">
		<div class="border-b grid grid-cols-4 py-2 md:py-0 md:grid-cols-12 md:pointer-events-none
     			 cursor-pointer md:cursor-auto" onClick="location.href='./noticeRead.shop?num=${article.noticeno}&pageNum=${pgList.currentPage}'">
     			 
     		 <div class="hidden md:grid md:col-span-1 text-center">
     			<span>${article.noticeno}</span>		 
     		</div>
     		<div class="col-span-full md:col-span-8 pointer-events-auto md:cursor-pointer md:hover:underline underline-offset-auto font-semibold">
          		<span>${article.subject}</span>
        	</div>
        	<div class="col-span-2  md:text-center md:col-span-1">
          		<span>관리자</span>
        	</div>
        	<div class="text-right md:text-center md:col-span-1">
          		<span><fmt:formatDate value="${article.noticedate}" timeStyle="medium" pattern="yy.MM.dd (k:mm)"/></span>
        	</div>
        	<div class="text-center md:col-span-1">
          		<span span class="md:hidden">조회수 : </span>
         		<span>${article.count}</span>
        	</div>
     	</div>
	</c:forEach>
</c:if>

<!-- 관리자로 로그인했을때 보이는 글쓰기 버튼 -->
<c:if test="${checkManager==1}">
<div class="flex justify-center md:justify-end px-4 py-3 text-center sm:px-6">
      <button class="w-5/12 md:w-24 md:order-2 md:col-end-auto md:justify-self-end rounded-md border border-transparent bg-blue-700 py-2 px-6 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 -mb-6 mt-2 my-2" 
      			  onClick="location.href='./noticeWrite.shop'">글쓰기
      </button>        
</div>
</c:if>

<!-- 페이징 처리 및 검색 파트-->
	<c:if test="${pgList.count > 0}">
            <ol class="flex justify-center gap-1 mt-8 text-xs font-medium">            
	            <c:set var="pageCount" value="${pgList.count/pgList.pageSize+(pgList.count%pgList.pageSize==0?0:1)}" />
				<c:set var="startPage" value="${pgList.currentPage-((pgList.currentPage-1)%pgList.blockSize)}" />
				<c:set var="endPage" value="${pgList.startPage+pgList.blockSize-1}" />
				<c:if test="${pgList.endPage>pgList.pageCount}">
					<c:set var="endPage" value="${pgList.endPage=pgList.pageCount}" />
				</c:if>
				
			  <c:if test="${pgList.startPage>pgList.blockSize}">
              <li>
                <a
                  href="./noticeList.shop?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}"
                  class="inline-flex items-center justify-center w-8 h-8 border border-gray-100 rounded"
                >
                  <span class="sr-only">이전</span>
        
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="w-3 h-3"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </a>
              </li>
              </c:if>
        	  
      	  	  <c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">          
              <li>
              <c:choose>
              	<c:when test="${pgList.currentPage==i}">
              		<a href="./noticeList.shop?pageNum=${i}&search=${search}&searchtext=${searchtext}" class="block w-8 h-8 leading-8 text-center border border-gray-100 text-white bg-gray-900 rounded">
		                 ${i}
		             </a>
              	</c:when>
              	<c:otherwise>
		                <a
		                  href="./noticeList.shop?pageNum=${i}&search=${search}&searchtext=${searchtext}"
		                  class="block w-8 h-8 leading-8 text-center border border-gray-100 rounded">
		                 ${i}
		                </a>
		        </c:otherwise>
                </c:choose>
              </li>        
              </c:forEach>  
        		
        	    <c:if test="${pgList.endPage<pgList.pageCount}">
        	    <li>
                <a
                  href="./noticeList.shop?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}"
                  class="inline-flex items-center justify-center w-8 h-8 border border-gray-100 rounded"
                >
                  <span class="sr-only">Next Page</span>
        
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="w-3 h-3"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </a>
              </li>
              </c:if>
            </ol>
            </c:if>

    <div class="grid justify-items-stretch text-center my-6">
      
      <div class="">
        <form class="flex md:block" name="search" id="search" action="./noticeList.shop">
          <select name="search">
            <option value="subject">제목</option>
            <option value="subject_content">제목+본문</option>
          </select>
          <input class="w-2/3 md:w-64 border-x-transparent md:border-gray-500 " name="searchtext" id="search" type="search" placeholder="검색">
          <button class="w-24 h-auto md:h-10 md:rounded-md border border-transparent bg-blue-700 md:py-1 px-4 md:mx-2 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none md:focus:ring-2 focus:ring-blue-600 focus:ring-offset-2" 
      			  type="submit">검색</button>
        </form>
      </div>
      </div>
    </div>
    <!-- 페이징 처리 및 검색 파트-->

  </section>
<!--공지사항 section end -->


<jsp:include page="footer.jsp" flush="false" />
</body>
</html>