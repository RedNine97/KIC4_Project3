<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*,member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 변경하기(U_SearchPwdUpdate)</title>
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
          <div class="relative mx-auto py-auto max-w-2xl overflow-hidden rounded-lg bg-white text-center align-middle  flex justify-center">

	        <form name="SearchPwdUpdate" method="post" action="U_SearchPwdUpdateProc.shop">
		         <div class="text-center md:mb-4">
		            <a href="./M_mainpage.shop"
		            	 class="mx-auto inline-block max-w-[160px] mr-44">
		            	<img src="./img/logo2.png" class="h-auto max-w-xs"/>
		            </a>
		        </div>
	            <div class="relative inline-flex mb-2">
	            	<p class="relative block font-semibold text-lg mb-10 text-gray-900">술주랑 아이디 : </p>
	            	<p class="relative block font-semibold text-lg mb-10 ml-3 text-green-900"> ${memid}</p>
	            </div>
	            <br>
	            <!-- memid 저장 -->
	            <input type="hidden" name="memid" id="memid" value="${memid}">
	            
	            <!-- 새 비밀번호 -->
				<div class="relative inline-flex mb-2 text-center">
				  <span class="inline-flex items-center px-4 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md">
						<svg class="w-6 h-6 dark:text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
				  </span>
				  <input type="password" id="mem_passwd" name="pwd" maxlength="20" class="w-80 px-5 p-2.5 mr-3 block rounded-none rounded-r-lg bg-gray-50 border text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 text-sm border-gray-300" 
				  		placeholder="새 비밀번호">
				</div>
                  <p class="hidden inline-flex  text-justify text-sm mt-1 -mb-3 text-red-500" id="con_passwd">비밀번호는 4자 이상 20자 이하로 적어야 합니다.</p>
				
	            <!-- 새 비밀번호 재확인 -->
				<div class="relative inline-flex mb-2 mt-3 text-center">
				  <span class="inline-flex items-center px-4 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md">
						<svg class="w-6 h-6 dark:text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path></svg>
				  </span>
				  <input type="password" id="mem_repasswd" name="repwd" maxlength="20" class="w-80 px-5 p-2.5 mr-3 block rounded-none rounded-r-lg bg-gray-50 border text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 text-sm border-gray-300" 
				  		placeholder="새 비밀번호 확인">
				</div><br>
                  <p class="hidden inline-flex text-center text-justify text-sm mt-1 -mb-3 text-red-500" id="ps_x">비밀번호가 일치하지 않습니다.</p>
                  <p class="hidden inline-flex text-center text-justify text-sm mt-1 -mb-3 text-green-600" id="ps_o">비밀번호가 일치합니다.</p>
	            
                <div class="max-w-lg mx-auto p-8 mt-10">
				  <details class="open:bg-white dark:open:bg-slate-900 open:ring-1 open:ring-black/5 dark:open:ring-white/10 open:shadow-lg p-6 rounded-lg" open>
				    <summary class="text-sm leading-6 text-slate-900 dark:text-white font-semibold select-none">
				      암호 요구 사항
				    </summary>
				    <div class="mt-3 text-sm leading-6 text-slate-600 dark:text-slate-400">
				    	<div class="flex p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
						  <svg aria-hidden="true" class="flex-shrink-0 inline w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
						  <span class="sr-only">Info</span>
						  <div>
						    <span class="font-medium">다른 사이트와 다른 술주랑 아이디만의 비밀번호를 만들어 주세요.</span>
						      <ul class="mt-1.5 ml-4 list-disc list-inside">
						        <li>영문, 숫자, 특수문자를 함께 사용하면(4자 이상 20자 이하)보다 안전합니다.</li>
						        <li>하나 이상의 특수 문자(예: !) @ # ?</li>
						    </ul>
						  </div>
						</div>
				    </div>
				  </details>
				</div>
				
	            <div class="px-4 py-3 text-center sm:px-6">
		             <button 
		              	type="button" 
					    class="py-2 px-6 mt-16 inline-flex justify-center rounded-md border border-transparent bg-blue-700 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2"
					    onclick="searchUpdateCheck()">확인</button>
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