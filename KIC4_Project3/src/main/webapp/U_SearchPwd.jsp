<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기(U_SearchPwd)</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script language="JavaScript" src="U_script.js?ver=3.1"></script>
</head>
<body>
  <section class="bg-[#F4F7FF] py-20 lg:py-[117px]">
    <div class="container mx-auto">
      <div class="-mx-4 flex flex-wrap">
        <div class="w-full px-4">
          <div class=" relative mx-auto py-auto max-w-2xl overflow-hidden rounded-lg bg-white text-center align-middle  flex justify-center">
			
	        <form name="SearchPwd" id="SearchPwd" method="post" action="U_SearchPwdProc.shop">
		        <div class="text-center md:mb-4">
		            <a href="javascript:void(0)"
		            	 class="mx-auto inline-block max-w-[160px] mr-44">
		            	<img src="./img/logo2-2.png" class="h-auto max-w-xs"/>
		            </a>
		        </div>
	            <p class="block text-lg font-bold mb-4">비밀번호를 찾고자 하는 아이디를 입력해주세요.</p>
	           
	            <label for="memid" class="after:content-['*'] after:ml-0.5 after:text-red-500 block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
				<div class="relative inline-flex mb-6">
				  <span class="inline-flex items-center px-4 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md">
				  	<svg class="w-5 h-5 dark:text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
				  </span>
				  <input type="text" name="memid" id="pwd_mem_id" class="w-80 py-3 p-2.5 rounded-none rounded-r-lg bg-gray-50 border text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 text-sm border-gray-300"
				  			placeholder="아이디를 입력하세요."  maxlength="15">
				</div>
				
	            <div>
	              <button 
	              	type="button" 
				    class="w-96 mb-10 py-4 inline-flex justify-center rounded-md border border-transparent bg-blue-700 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2"
				    onclick="searchpwdCheck()">
				    다음
				  </button>
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