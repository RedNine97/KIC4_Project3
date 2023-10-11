<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
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
    <script src="./script.js"></script>
    
    <title>회원탈퇴</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" />

  <!-- 회원 탈퇴 section -->
  <section>
    <div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
      <div >
        회원 탈퇴
      </div>
    </div>

    <div class="grid grid-flow-row w-full text-center">
      <div class="my-8">
        <span class="block">정말로 술주랑을 탈퇴하시겠습니까? </span>
        <span class="inline-block">탈퇴를 하시게 되신다면,</span>
        <span class="inline-block">재가입시까지 술주랑의 서비스를 이용하실 수 없습니다.</span>
      </div>
      <form name="mwForm" id="mwForm" action="./Y_memWithProc.shop" method="get">
        <!-- 페이지 흐름을 보여주기 위해 method="get"으로 설정중 -->
        <div class="grid justify-items-center mb-6">
          <div class="block text-sm font-medium text-gray-700 font-semibold">비밀번호 입력</div>
          <input type="password" name="passwd" id="mem_passwd"  maxlength="20" 
          class="mt-1 block w-80 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">
			<input type="hidden" id="pwd" value="${article.getPwd()}" >
			
          <p class="hidden  text-justify text-sm mt-1 -mb-3 text-red-500" 
          id="incorrect_passwd">비밀번호가 일치하지 않습니다.</p>
          <!-- 비밀번호 불일치시 메세지(예시, 백엔드에서 필요시 변경) -->
          <p class="hidden text-center text-sm mt-1 -mb-3 text-red-500" 
          id="empty_passwd">비밀번호를 입력해주세요.</p>
          <!-- 비밀번호 불입력시 메세지 - 프론트엔드에서 자바스크립트 이용, 빈칸이면 에러메세지 + submit금지할 예정-->
        </div>
          <div class="px-4 py-3 text-center sm:px-6 w-full flex justify-center gap-2">
            <button type="button" class="justify-center rounded-md border border-transparent w-1/2 sm:w-auto bg-blue-700 py-2 px-6 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" id="pwcheck">
            회원탈퇴</button>
            <!-- 탈퇴 확인 알림창+메인페이지 이동 혹은 탈퇴 완료 페이지 이동(더 하기 편한걸 선택),현재 Y_memWithCom.html 로 이동 설정중 -->
            <button type="button" class="justify-center rounded-md border border-transparent w-1/2 sm:w-auto bg-blue-700 py-2 px-6
            ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" onClick="location.href='./Y_myPage.shop'">
            <!-- 마이페이지 이동 -->
            탈퇴 취소</button>
        </div>
      </form>
    </div>
  </section>
  <!-- 회원 탈퇴 section -->
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>