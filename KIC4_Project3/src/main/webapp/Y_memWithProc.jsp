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
    <script src="./script.js"></script>
    
    <title>회원수정</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" />

	<!-- Section Start -->
  <section>
    <div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
      <div >
        회원 탈퇴가 완료되었습니다.
      </div>
    </div>

    <div class="grid grid-flow-row place-content-center w-full text-center h-screen">
      <div class="pb-12 text-xl md:text-lg">
        <span class="block">지금까지 술주랑의 서비스를 <span class="inline-block">이용해주셔서 감사합니다.</span></span>
        <span class="block">다음에 또 만나길 기다리겠습니다.</span>
      </div>
      <div class="pb-12">
        <a href="./M_mainpage.shop" class="text-primary text-blue-600 hover:text-blue-400 hover:underline">
          메인페이지로 이동
        </a>
      </div>
    </div>
  </section>
	<!-- Section End -->
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>