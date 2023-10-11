<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
   
    
    <title>베스트 상품 리스트</title>
    
</head>
<body>
<jsp:include page="top.jsp" flush="false" />


    <section>
    

   		<div class="relative max-w-screen-2xl px-4 py-0 mx-auto sm:px-6 sm:py-12 lg:pt-0 lg:pb-0 lg:px-40">
   		<div class="sm:gap-4 mt-10 pl-8 py-12 border-0 border-solid border-inherit rounded-none bg-gray-50">
   		<div class="flex items-center mb-2">
			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-10 mr-2">
	  			<path stroke-linecap="round" stroke-linejoin="round" d="M16.5 18.75h-9m9 0a3 3 0 013 3h-15a3 3 0 013-3m9 0v-3.375c0-.621-.503-1.125-1.125-1.125h-.871M7.5 18.75v-3.375c0-.621.504-1.125 1.125-1.125h.872m5.007 0H9.497m5.007 0a7.454 7.454 0 01-.982-3.172M9.497 14.25a7.454 7.454 0 00.981-3.172M5.25 4.236c-.982.143-1.954.317-2.916.52A6.003 6.003 0 007.73 9.728M5.25 4.236V4.5c0 2.108.966 3.99 2.48 5.228M5.25 4.236V2.721C7.456 2.41 9.71 2.25 12 2.25c2.291 0 4.545.16 6.75.47v1.516M7.73 9.728a6.726 6.726 0 002.748 1.35m8.272-6.842V4.5c0 2.108-.966 3.99-2.48 5.228m2.48-5.492a46.32 46.32 0 012.916.52 6.003 6.003 0 01-5.395 4.972m0 0a6.726 6.726 0 01-2.749 1.35m0 0a6.772 6.772 0 01-3.044 0" />
	  		</svg>
	 		 	<div class="font-bold text-3xl font-sans serif">TOP 20</div><p>
 		 </div>
 		 <div class="font-sans serif">가장 인기가 많은 술들이에요.</div>
		
		</div>
		</div>

      <!-- 상품 -->
      <div class="relative max-w-screen-2xl px-4 py-0 mx-auto sm:px-6 sm:py-12 lg:pt-0 lg:pb-0 lg:px-40">
        <div>
        
          <!-- 상품리스트 -->
          <div class="lg:col-span-4 pb-10">
						
	            <p class="mb-0 flex justify-start">
	            <div class="h-14 mb-10 py-4 border-t border-t-gray-400 border-b border-b-gray-300">
	              <span class="text-gray-700 text-m float-right"> <em class="productlist-num not-italic font-bold">20</em> 개의 상품 </span>
	               </div>
	            </p>
           
            
            <ul class="grid gap-6  lg:grid-cols-4 sm:grid-cols-2 ">

         	<c:forEach var="product" items="${productList}">
              <li class="mb-16">
                <a href="./productDetail.shop?pID=${product.pID}&pageNum=${pgList.currentPage}" class="block overflow-hidden group">
                  <div class="aspect-[3/4] rounded-lg w-full hover:rounded-lg overflow-hidden ">
                    <img src="${product.imgpath}.jpg" alt="${product.pname}"
                    class="w-[100%] h-[100%] object-cover transition duration-500  group-hover:scale-105 "
                  />  
                  </div>
                 
                  <div class="relative pt-3 bg-white">
                    <h3
                      class="text-sm text-gray-900 font-bold group-hover:underline group-hover:underline-offset-4">
                    ${product.pname}
                    </h3>

                    <p class="mt-2">
                      <span class="text-gray-900 font-bold"> <em class="price not-italic tracking-tighter">
                      <fmt:formatNumber value="${product.pprice}" pattern="###,###,###" /></em><span class="text-xs">원</span> 
                      </span>
                    </p>
                    <hr class="my-1">
                    
                    <div class="flex items-center">
                     <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
 					 <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
					</svg>
 					<span class="text-base ml-1">
                    ${product.count}
                    </span>
					</div>
                    
                  </div>
                </a>
              </li>
              </c:forEach>
              
            </ul>			

          </div>


        </div>
      </div>
    </section>


<jsp:include page="footer.jsp" flush="false" />
</body>
</html>