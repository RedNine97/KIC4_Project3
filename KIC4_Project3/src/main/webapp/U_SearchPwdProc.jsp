<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*,member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기(U_SearchPwdProc)</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script language="JavaScript" src="U_script.js?ver=2.9"></script>
</head>
<body>
  <section class="bg-[#F4F7FF] py-20">
    <div class="container mx-auto">
      <div class="-mx-4 flex flex-wrap">
        <div class="w-full px-4">
          <div class="relative mx-auto py-auto max-w-2xl overflow-hidden rounded-lg bg-white text-center align-middle flex justify-center">
	        
	        <form name="SearchPwdProc" method="post" action="U_SearchPwdUpdate.shop">
			<div class="text-center md:mb-4">
	            <a href="javascript:void(0)"
	            	 class="mx-auto inline-block max-w-[160px] mr-44">
	            	<img src="./img/logo2-2.png" class="h-auto max-w-xs"/>
	            </a>
	        </div>
	            <p class="relative block text-lg mb-10 text-gray-900">회원 이메일 주소와 입력한 이메일 주소가 같아야,<br> 비밀번호를 변경하실 수 있습니다.</p>
	           
	            <!-- DB의 memid, email 값 저장 -->
	            <input type="hidden" name="memidDb" id="memidDb" value="${searchPwd.memid}">
	            <input type="hidden" name="memnameDb" id="memnameDb" value="${searchPwd.memname}">
	            <input type="hidden" name="emailDb" id="emailDb" value="${searchPwd.email}">
	            
	            <label for="memname" class="after:content-['*'] after:ml-0.5 after:text-red-500 block mb-2 text-sm font-medium text-gray-900 dark:text-white">이름</label>
				<div class="relative inline-flex mb-2">
				  <span class="inline-flex items-center px-4 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md">
				     <svg class="w-5 h-5 dark:text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path></svg>
				  </span>
				  <input type="text" id="memname_search" name="memname" maxlength="20" class="w-64 px-5 p-2.5 mr-3 rounded-none rounded-r-lg bg-gray-50 border text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 text-sm border-gray-300" placeholder="Name">
				</div><p>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchname_error">이름을 입력해야 합니다.</span>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchname_error2">${searchPwd.memid}로 검색된 이름이 아닙니다.</span>
				
				<label for="email" class="after:content-['*'] after:ml-0.5 after:text-red-500 block mb-2 mt-3 text-sm font-medium text-gray-900">이메일 주소</label>
				<div class="relative inline-flex">
				  <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
				    <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path></svg>
				  </div>
				  <input type="text" id="email_search" name="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block 
				  w-80 px-5 pl-10 p-2.5" placeholder="abc@E-mail.com">
				</div><p>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchemail_error">이메일을 입력해야 합니다.</span>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchemail_error2">이메일 양식을 정확히 입력해주세요.</span>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchemail_error3">${searchPwd.memid}로 검색된 이메일이 아닙니다.</span>
				
				<div class="relative inline-flex mt-3">
				     <input type="text" id="userkey" name="userkey" maxlength="8" class="block w-80 px-5 py-2 mt-2 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500"
				     			placeholder="인증번호 8자리 숫자 입력">
				     <button type="button" onclick="SearchCheck();" id="scPwdBotton" class="px-1 py-1 text-white absolute right-0.5 bottom-1 bg-blue-700 hover:bg-blue-800 
				     	focus:ring-4 focus:outline-none focus:ring-blue-300 font-light rounded-lg text-sm">
				     	인증번호 받기</button>
				</div><br>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="searchemail">인증번호를 발송중입니다.</span>
				<span class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="key">인증번호를 확인해주세요.</span>
				<input type="hidden" name="randomKey" id="randomKey" value="n">
				
	            <div class="px-4 py-3 text-center sm:px-6">
	            	<button type="button" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6
	             	 ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" onClick="location.href='./U_LoginPage.shop'">
	              	취소</button>
		             <button 
		              	type="button" 
					    class="py-2 px-6 mt-16 inline-flex justify-center rounded-md border border-transparent bg-blue-700 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2"
					    onclick="searchpwd2Check()">다음</button>
	            </div>
			</form>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
<jsp:include page="footer.jsp" flush="false"/>
</html>