<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="U_script.js?ver=2.4"></script>
</head>
<body>
  <div class="mt-10 sm:mt-0">
    <div class="md:grid md:grid-cols-3 md:gap-5">
      <div class="md:col-span-1 bg-blue-100">
        <div class="px-4 sm:px-0 py-5">
          <h3 class="indent-3 text-lg font-bold leading-6 text-gray-700 mt-3">회원정보 입력</h3>
          <p class="px-1 mt-1 text-sm text-gray-600">필수 정보를 빠짐없이 입력해주세요.</p>
        </div>
      </div>

      <div class="mt-5 md:col-span-2 md:mt-0">
        <!--회원가입 폼-->
        <form name="regForm" id="regForm" action="U_RegisterProc.shop" method="POST">
          <div class="overflow-hidden shadow sm:rounded-md">
            <div class="bg-white px-4 py-5 sm:p-6">
              <div class="grid grid-cols-6 gap-6">
                <!-- 아이디 -->
                <div class="col-span-6 sm:col-span-6">
                  <label for="mem_id" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">아이디</label>
                  <input type="text" name="memid" id="mem_id" autocomplete="mem_id" maxlength="15"
                  class="w-60 mt-1 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm mr-3">      
                  <button type="button"class="max-h-0.5 max-w-xs mt-7 sm:mt-6 bg-blue-600 inline-flex items-center justify-center rounded-full py-4 px-10 text-center text-sm font-normal text-white hover:bg-opacity-90 px-8" 
                  onclick="idCheck(regForm.memid.value)">ID중복확인</button>

                  <p class="hidden block col-span-6 text-justify text-sm mt-1 -mb-2 pb-1 text-red-500" id="mem_id_empty">아이디는 4자 이상 영문 및 대소문자를 포함해야 합니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_id">필수 정보입니다.</p>
                </div>

                <!-- 비밀번호 -->
                <div class="col-span-6 sm:col-span-6">
                  <label for="mem_passwd" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">비밀번호</label>
                  <input type="password" name="pwd" id="mem_passwd" autocomplete="mem_passwd" maxlength="20" 
                  class="mt-1 block w-80 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_passwd">필수 정보입니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="con_passwd">비밀번호는 4자 이상 20자 이하로 적어야 합니다.</p>
                  <!-- 일반 회원가입이라면 패스워드 조건이 더 있으나 편의상 4글자 이상으로 작성 -->
                </div>

                <!-- 비밀번호 재확인 -->
                <div class="col-span-6 sm:col-span-6">
                  <label for="mem_repasswd" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">비밀번호 확인</label>
                  <input type="password" name="repwd" id="mem_repasswd" autocomplete="mem_repasswd" maxlength="20"
                  class="mt-1 block w-80 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">
                  
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_repasswd">필수 정보입니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="ps_x">비밀번호가 일치하지 않습니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-green-600" id="ps_o">비밀번호가 일치합니다.</p>
                </div>

                <!-- 닉네임 -->
                <div class="col-span-6 sm:col-span-6">
                  <label for="mem_nick" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">닉네임</label>
                  <input type="text" name="nickname" id="mem_nick" autocomplete="mem_nick" maxlength="20" 
                  class="mt-1 block w-60 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm"> 

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_nick">필수 정보입니다.</p>
                </div>

                <!-- 이름 -->
                <div class="col-span-3 sm:col-span-3">
                  <label for="mem_name" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">이름</label>
                  <input type="text" name="memname" id="mem_name" autocomplete="mem_name" maxlength="20"
                  class="mt-1 block w-60 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_name">필수 정보입니다.</p>
                </div>

                <!-- 생년월일 -->
                <div class="col-span-6 sm:col-span-4">
                  <label for="mem_birthday" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">생년월일</label>
                  <input type="date" name="birthday" id="mem_birthday" value="연도-월-일" max="2001-01-31"
                  class="mt-1 block w-60 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm"
                  >

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_birthday">필수 정보입니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="birthday_length">생년월일을 다시 확인해주세요.</p>
                </div>

                <!-- 이메일 -->
                <div class="col-span-6 sm:col-span-4">
                  <label for="mem_email" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">이메일</label>
                  <input type="text" name="email" id="mem_email" 
                  autocomplete="mem_email" maxlength="30"
                  class="mt-1 block w-80 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_email">필수 정보입니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="em_x">이메일 양식을 정확히 입력해주세요.</p>
                </div>                

                <!-- 휴대전화 -->
                <div class="col-span-6 sm:colspan-4">
                  <label for="mem_phone" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold"> 휴대전화 (-없이 숫자를 입력해주세요)</label>
                  <select name="number" 
                  	class="mt-1 inline-block w-20 rounded border-gray-400 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">
                  	<option vlaue="none">===선택===</option>
                  	<option vlaue="n1" selected>010</option>
                  	<option vlaue="n2">011</option>
                  	<option vlaue="n3">016</option>
                  	<option vlaue="n4">017</option>
                  	<option vlaue="n5">018</option>
                  	<option vlaue="n6">019</option>
                  </select>
                  <input type="text" name="mphone" id="mem_phone" autocomplete="mem_phone" maxlength="8" 
                  class="mt-1 inline-block w-60 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm"
                  oninput="isNum.call(this);">

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_phone">필수 정보입니다.</p>
                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="phone_length">휴대전화 번호를 다시 확인해주세요.</p>
                </div>

                <!-- 우편번호 -->
                <div class="col-span-6 sm:col-span-6">
                  <label for="mem_zipcode" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">우편번호</label>
                  <input type="text" name="zipcode" id="mem_zipcode" autocomplete="mem_zipcode" maxlength="10"
                  class="mt-1 w-60 rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm mr-3">      
                  <button type="button" onClick="zipCheck()" class="max-h-0.5 max-w-xs col-span-6 sm:col-span-2 bg-blue-600 inline-flex items-center justify-center rounded-full py-4 px-10 text-center text-sm font-normal text-white hover:bg-opacity-90 px-5">우편번호검색</button>   

                  <p class="hidden col-span-6 text-justify text-sm mt-1 text-red-500" id="required_zipcode">필수 정보입니다.</p>       
                </div>

                <!-- 주소 -->
                <div class="col-span-6 sm:col-span-5">
                  <label for="mem_address" class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-gray-700 font-semibold">주소</label>
                  <input type="text" name="addr" id="mem_address" autocomplete="mem_address" 
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-600 focus:ring-blue-600 sm:text-sm">

                  <p class="hidden col-span-6 text-justify text-sm mt-1 -mb-3 text-red-500" id="required_address">필수 정보입니다.</p>
                </div>
              </div>
            </div>

            <!-- 회원가입/가입취소 버튼 -->
            <div class="px-4 py-3 text-center sm:px-6">
              <button type="button" id="inputCheck" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2" 
              >
              회원가입</button>
              <button type="button" onclick="document.location='./M_mainpage.shop'" class="inline-flex justify-center rounded-md border border-transparent bg-blue-700 py-2 px-6 
              ml-1 mr-1 text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 my-2">
              가입취소</button>
              <!-- 버튼 사용시 주의 - 리셋버튼이 아니라 새로고침 기능이 있는 버튼(에러메세지도 한꺼번에 지우기 위해서)-->
              <button type="button" class="inline-flex justify-center rounded-md border border-blue-700 bg-white py-2 px-6 text-sm font-medium text-blue-700 shadow-sm hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-0 my-2"
              onclick="location.replace(location.href)">
              다시입력</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="hidden sm:block" aria-hidden="true">
    <div class="py-5">
      <div class="border-t border-gray-200"></div>
    </div>
  </div>
</body>
<jsp:include page="footer.jsp" flush="false"/>
</html>