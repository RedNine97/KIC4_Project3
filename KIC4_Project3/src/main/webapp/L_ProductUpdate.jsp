<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>상품 수정 페이지(관리자페이지)</title>
</head>
<body>
		<jsp:include page="top.jsp" flush="false" />
		<div class="relative max-w-screen-2xl px-4 py-0 mx-auto sm:px-6 sm:py-12 lg:pt-0 lg:pb-0 lg:px-40">
	    <div class="relative p-6 pb-20 bg-white">
    
        <h2 class="mt-4 text-lg font-large text-gray-900">상품 수정 페이지</h3>
        <br>
	    <form method="post" name="ProductUpdate" action="./productUpdatePro.shop">
			<div class="mb-6">
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품아이디</label>
				    <input type="text" name="pID" value="${product.pID}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품명</label>
				    <input type="text" name="pname" value="${product.pname}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">도수</label>
				    <input type="text" name="alcdegree" value="${product.alcdegree}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">규격</label>
				    <input type="text" name="volume" value="${product.volume}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">주원료</label>
				    <input type="text" name="ingredient" value="${product.ingredient}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">제조회사</label>
				    <input type="text" name="pcompany" value="${product.pcompany}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품 가격</label>
				    <input type="text" name="pprice" value="${product.pprice}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상황별대상</label>
				    <select name="pperson" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
              			<option value="웃어른" <c:if test="${product.pperson eq '웃어른'}">selected="selected"</c:if>>웃어른</option>
                		<option value="연인" <c:if test="${product.pperson eq '연인'}">selected="selected"</c:if>>연인</option>
                		<option value="친구" <c:if test="${product.pperson eq '친구'}">selected="selected"</c:if>>친구</option>
                		<option value="혼자" <c:if test="${product.pperson eq '혼자'}">selected="selected"</c:if>>혼자</option>
                		<option value="비즈니스" <c:if test="${product.pperson eq '비즈니스'}">selected="selected"</c:if>>비즈니스</option>
              		</select>
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품 종류</label>
				    <select name="pcategory" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
              			<option value="탁주" <c:if test="${product.pcategory eq '탁주'}">selected="selected"</c:if>>탁주</option>
                		<option value="약주" <c:if test="${product.pcategory eq '연인'}">selected="selected"</c:if>>약주</option>
                		<option value="과실주" <c:if test="${product.pcategory eq '과실주'}">selected="selected"</c:if>>과실주</option>
                		<option value="증류주" <c:if test="${product.pcategory eq '증류주'}">selected="selected"</c:if>>증류주</option>
                		<option value="기타주류" <c:if test="${product.pcategory eq '기타주류'}">selected="selected"</c:if>>기타주류</option>
              		</select>
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품 설명</label>
				    <textarea name="pdesc" rows="13" cols="40" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">${product.pdesc}</textarea>
				</div>
				<br>
				<div>
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">상품 재고</label>
				    <input type="text" name="pstock" value="${product.pstock}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				</div>
	</div>   	
		            <h3 class="mt-10 text-lg font-medium text-gray-900">상품 이미지 수정</h3>
		            <br>
		            <div class="mb-10">
				    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이미지 경로</label>
				    <input type="text" name="imgpath" value="${product.imgpath}" id="small-input" class="block w-full p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
					</div>
					<br>
		        	<button type="button" onclick="location.href='./product.shop'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-left">
		        		상품목록으로</button>
		        	<button type="reset"  class="mx-5 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		다시작성</button>
		        	<button type="submit"  class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		수정하기</button>&nbsp;
				</p>
				
			</div>
			</div>
		
	    </form>
	    <jsp:include page="footer.jsp" flush="false" />
</body>
</html>