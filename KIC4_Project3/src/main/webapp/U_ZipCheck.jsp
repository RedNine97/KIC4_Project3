<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*,member.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memDao" class="member.U_MemberDAO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>우편번호 검색 </title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="U_script.js?ver=4.0"></script>
</head>
<body>
	<div class="bg-blue-100 py-6 px-4">
		<div class="bg-white text-center py-6 my-4">
			<center>
				<img src="./img/logo_mini.png"/>
				<br>
			</center>
			<b class="font-extrabold">우편번호 찾기</b>
			   <form name="zipForm" action="U_ZipCheck.shop" method="post">
			   	   <br>
			       <div class="grid grid-cols-4 place-content-center">
			           <p class="pt-1.5 font-medium">동이름 입력 : </p><input name="area3" type="text" class="block w-56 rounded border-gray-300 shadow focus:border-blue-600 focus:ring-blue-600" autofocus>
			           &nbsp;<input type="button" value="검색" onclick="dongCheck();" class="w-16 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-3 rounded">
			       </div>
			       <input type="hidden" name="check" value="n">
			    </form>
			<div>
			  <!-- 찾은 데이터를 보여주는 코딩(검색시작) --> 
			  <c:if test="${check eq 'n'}">
			  	<c:if test="${zipcodeList.isEmpty()}">
				  	<p class="text-center text-sm mt-1 -mb-2 pb-1 text-red-500">
						검색된 결과가 없습니다.</p>
					<br>
					</div>
					<div>
				</c:if>
				<c:if test="${!empty zipcodeList}">
			  <p class="text-center text-sm mt-1 -mb-2 pb-1 text-red-500">
				* 검색후 , 아래 우편번호를 클릭하면 자동으로 입력됩니다.
			  </p>
			  <br>
			  </div>
			  <!-- 실제 데이터를 출력하는 코딩 -->
			  <div>
			  <br>
			  <jsp:useBean id="zipcode" class="member.ZipcodeDTO" />
			  <c:forEach var="zipcode" items="${zipcodeList}">
				  <c:set var="tempZipcode" value="${zipcode.getZipcode().trim()}"/>
				  <c:set var="tempArea1" value="${zipcode.getArea1().trim()}"/>
				  <c:set var="tempArea2" value="${zipcode.getArea2().trim()}"/>
				  <c:set var="tempArea3" value="${zipcode.getArea3().trim()}"/>
				  <c:set var="tempArea4" value="${zipcode.getArea4().trim()}"/>
			  
				 <a href="JavaScript:sendAddress('${tempZipcode}','${tempArea1}','${tempArea2}','${tempArea3}','${tempArea4}')"
				 class="font-mono hover:bg-blue-200 border-gray-300 shadow"
				 >
				 ${tempZipcode}&nbsp;${tempArea1}&nbsp;${tempArea2}&nbsp;${tempArea3}&nbsp;
				 ${tempArea4}</a><br>
			     </c:forEach>
			     </c:if><!-- else -->
			   </c:if><!-- if(check.equals("n")){ -->
			 </div>
			  <div>
				<br>
				<a href="javascript:this.close();" onClick="self.close()">
			    <button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-1 border border-blue-500 hover:border-transparen rounded-full">
 					 닫기
				</button></a>
			 </div>
		</div>
	 </div>
 </body>
 </html>