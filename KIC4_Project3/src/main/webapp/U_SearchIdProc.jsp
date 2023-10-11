<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*,member.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>아이디 찾기 아이디 확인(U_SearchId)</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script language="JavaScript" src="U_script.js?ver=3.2"></script>
</head>
<body>
  <section class="bg-[#F4F7FF] py-20">
    <div class="container mx-auto">
      <div class="-mx-4 flex flex-wrap">
        <div class="w-full px-4">
		  <div class="relative mx-auto py-auto max-w-2xl overflow-hidden rounded-lg bg-white text-center align-middle flex justify-center">

	      
	        <!-- 찾은 데이터를 보여주는 코딩(검색시작) -->
			<div>
                <div class="text-center md:mb-4">
                    <a href="javascript:void(0)"
                         class="mx-auto inline-block max-w-[160px] mr-44">
                        <img src="./img/logo2-1.png" class="h-auto max-w-xs"/>
                    </a>
                </div>
					<c:if test="${searchId.isEmpty()}">
						<p class="text-center text-lg mt-1 -mb-2 pb-1 text-red-500">
								${memname}님의 ${email} 이메일로 검색된 ID가 없습니다.</p>
						<br>
				        <button type="button" class="mt-2 inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" 
				              onclick="history.back()">
				              다시쓰기</button>
					</c:if>
				    
				    <div>
				    <c:if test="${!empty searchId}">
				         <p class="relative block text-lg mb-10 text-gray-900">${memname} 회원 님의 ${email} 이메일<br>주소로 검색된 ID입니다.</p>
						 <br>
						  <jsp:useBean id="regDTO" class="member.U_RegisterDTO" />
						  <c:forEach var="regDTO" items="${searchId}">
							  <c:set var="sid" value="${regDTO.getMemid().trim()}"/>
						  
							  <p class="ml-12 font-mono hover:bg-blue-200 border-gray-300 shadow">${sid} &nbsp; &nbsp; &nbsp; 가입일 : 
							  <fmt:formatDate value="${regDTO.getEnrolldate()}"
                                 timeStyle="medium"
                                 pattern="yyyy.MM.dd" />
							  </p><br>
						   </c:forEach>
				         <div>
				           <button 
				            type="button" 
							 class="py-2 px-6 mt-16 mb-6 inline-flex justify-center rounded-md border border-transparent bg-blue-700 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2"
							 onClick="location.href='./U_LoginPage.shop'">로그인 하러가기</button>
				         </div>
				      </c:if>
					</div>
			</div>
			
		  </div>
        </div>
      </div>
    </div>
  </section>
</body>
<jsp:include page="footer.jsp" flush="false"/>
</html>