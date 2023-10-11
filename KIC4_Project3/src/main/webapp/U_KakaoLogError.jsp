<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
 <HEAD>
  <title>로그인 에러</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</head>
<body class="bg-[#F4F7FF]">
  <section class="py-20" >
    <div class="container mx-auto">
      <div class="-mx-4 flex flex-wrap">
        <div class="w-full px-4">
          <div class="relative mx-auto max-w-[525px] overflow-hidden rounded-lg bg-white py-16 px-10 text-center sm:px-12 md:px-[60px]">
			<div class="mb-10 text-center md:mb-16">
            <a
            href="./M_mainpage.shop"
            class="mx-auto inline-block max-w-[160px]"
          	>
            <img src="./img/logo.png"/>
          </a>
          </div>
          <c:choose>
	          <c:when test="${!empty age_range}">
	          		<p class="block text-lg font-bold mb-4">
		            <b>${age_range}의 연령대는 가입할 수 없습니다.<p><br><br>
		            <br>
		            <br>
	          </c:when>
	          <c:otherwise>
		            <p class="block text-lg font-bold mb-4">
		            <b>카카오 소셜로그인을 하기 위해서는 [선택]연령대를 꼭 체크하셔야합니다. 다시 회원가입이 안될 시에는<p><br><br>
						  '카카오톡 접속 > 설정 > 카카오계정 > (계정연결)연결된서비스 관리 > 외부서비스에서 > 서비스 연결끊기'를 진행해주세요.<p></b></p>
						  또는 관리자에게 문의해주시기 바랍니다.<p></b></p>
		            <br>
		            <br>
            	</c:otherwise>
            </c:choose>
            <div>
			&nbsp;&nbsp;
            <button type="button" onclick="document.location='./U_LoginPage.shop'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
              확인
            </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
<jsp:include page="footer.jsp" flush="false"/>
</html>