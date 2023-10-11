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
    
    <title>회원등급</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" />

	<!-- Section Start -->
	<section>
		<div class="-mx-4 flex flex-wrap mt-4">
	      <div class="w-full px-4">
	        <div class="mx-auto mb-12 max-w-[510px] text-center lg:mb-20">
	          <span class="text-dark mb-4 text-3xl font-bold sm:text-4xl md:text-[40px]">
	            등급별 혜택
	        </span>
	          <p class="text-body-color text-base mt-3">
	            <span class="text-blue-600 font-bold">${article.nickname}</span>님의 현재등급은 <span class="text-sky-400 font-bold">${article.grade}</span>입니다.            
	          </p>
	          <!-- 
	          <p>3번 더 주문 시 VIP 등급입니다.</p>
	           -->
	        </div>
	      </div>
	    </div>

    <div class="h-80 max-6xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-4 grid justify-items-center	">
      <div class="table border border-gray-300">
        <div class="table-header-group bg-blue-300">
          <div class="px-2 py-2 table-cell w-12">등급</div>
          <div class="px-2 py-2 border-x table-cell">승급조건</div>
          <div class="px-2 py-2 table-cell">혜택</div>
        </div>
        <div class="table-row">
          <div class="px-2 py-2 border-y table-cell w-12">실버</div>
          <div class=" px-2 py-2 border-y border-x table-cell">술주랑의 기본 등급입니다.</div>
          <div class=" px-2 py-2 border-y table-cell">승급 조건을 만족할 경우 다음 등급 승급이 가능합니다. </div>
        </div>
        <div class="table-row">
          <div class="px-2 py-2 table-cell w-12">골드</div>
          <div class="px-2 py-2 border-x table-cell">실버등급에서 3번 더 주문시 골드 등급으로 승급이 가능합니다.</div>
          <div class="px-2 py-2 table-cell">주문시 술주랑의 추천안주 중 하나를 보내드립니다.</div>
        </div>
      </div>
    </div>
    
    <div class="text-center">
      <button type="button" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6
      ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-4" 
      onClick="location.href='./Y_myPage.shop'">
      마이페이지로
      </button>
    </div>
	</section>
	<!-- Section End -->
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>