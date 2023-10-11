<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>상품 삭제 페이지(관리자페이지)</title>
</head>
<body>
		<jsp:include page="top.jsp" flush="false" />
		
		<div class="relative max-w-screen-lg px-4 py-0 mx-auto sm:px-6 sm:py-12 lg:pt-0 lg:pb-0 lg:px-40">
	    <div class="relative p-6 pb-20 bg-white">
    
        <center><h2 class="mt-6 text-xl font-large text-gray-900">삭제할 상품 정보를 확인해주세요.</h2></center>
        <form method="post" name="ProductDelete" action="productDeletePro.shop">
	    <div class="px-10 py-10">
			<center>
			<table class="border border-gray-300 border-separate rounded-[20px] overflow-hidden">
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품아이디&nbsp;&nbsp;&nbsp;</td>
				    <td class="px-6"><input type="hidden" name="pID" value="${product.pID}">${product.pID}</td>
				</tr>				
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품명</td>
				    <td class="px-6">${product.pname}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">도수</td>
				    <td class="px-6">${product.alcdegree}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">규격</td>
				    <td class="px-6">${product.volume}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">주원료</td>
				    <td class="px-6">${product.ingredient}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">제조회사</td>
				    <td class="px-6">${product.pcompany}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품가격</td>
				    <td class="px-6"><fmt:formatNumber value="${product.pprice}" pattern="###,###,###" /> 원</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상황별대상</td>
				    <td class="px-6">${product.pperson}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품종류</td>
				    <td class="px-6">${product.pcategory}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품설명</td>
				    <td class="px-6">${product.pdesc}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품재고</td>
				    <td class="px-6">${product.pstock}</td>
				</tr>
				<tr>
				    <td class="px-6 py-3 bg-gray-50">상품이미지</td>
				    <td class="px-6 py-6"><img width="400" src="${product.imgpath}.jpg"></td>
				</tr>
		</table>  
		<div class="mt-4">
		<button type="button" onclick="location.href='./product.shop'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold text-sm hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent float-left rounded">
		        		글목록으로</button>
		<button type="submit" onclick="alert('삭제되었습니다.')" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold text-sm hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded float-right">
		        		삭제하기</button>&nbsp;
		</div>
		</center>
		</div> 	
	</div>
</div>
		
</form>
      <jsp:include page="footer.jsp" flush="false" />

</body>
</html>