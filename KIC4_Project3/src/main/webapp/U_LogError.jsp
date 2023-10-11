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
		     <p class="block text-lg font-bold mb-4">
		     <b>아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.<p><br><br>
					입력하신 내용을 다시 확인해주세요.<p></b></p>
		      <br>
		      <br>
            <div>
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
			  아이디 찾기
			</button>
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
			  비밀번호 찾기
			</button>
			&nbsp;&nbsp;
            <button type="button" onclick="document.location='./U_LoginPage.shop'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
              다시쓰기
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