<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
 <HEAD>
	<TITLE> 회원가입 체크 </TITLE>
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
	<script language="JavaScript" src="U_script.js?ver=4.0"></script>
</HEAD>
 <BODY class="bg-[#F4F7FF]">
 	<section class="py-20 lg:py-[117px]">
	  <div class="container mx-auto">
	    <div class="-mx-4 flex flex-wrap">
	      <div class="w-full px-4">
	         <div class="relative mx-auto max-w-[525px] overflow-hidden rounded-lg bg-white py-16 px-10 text-center sm:px-12 md:px-[60px]">
	        	<div class="mb-10 text-center md:mb-16">
		            <a href="./M_mainpage.shop"
		            class="mx-auto inline-block max-w-[160px]">
			           <img src="./img/logo.png"/>
			         </a>
          		</div>
				  <c:set var="flag" value="${requestScope.flag}"/>
				  <c:choose>
				    <c:when test="${flag==true}">
				    	회원가입을 진심으로 축하드립니다.
				    	<button type="button" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6
			              ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" 
			              onclick="document.location='U_LoginPage.shop'">
			              로그인하러 가기</button>
					</c:when>
					
					<c:otherwise>
						회원가입에 실패하셨습니다. 다시 진행해주세요.
						<br><br>
						<button type="button" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6
			              ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" 
			              onclick="document.location='U_Register.shop'">
			              다시가입</button>
					</c:otherwise>
				  </c:choose>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
 </BODY>
 <jsp:include page="footer.jsp" flush="false"/>
</HTML>