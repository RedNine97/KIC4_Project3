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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script type="text/javascript">
    	$(function(){
   			$("#pcategory").on("click", function(){
   				//checkbox 중에서 이름이 pcategory이고, 체크된 타겟의 value값을 가져온다.
   				var category = $('input:checkbox[name="pcategory"]:checked').val();
   				console.log(category);
   				location.href='product.shop?pcategory='+category;
   			});   	 
   		})
    </script>    
    <title>상품리스트</title>
</head>
<body>
    <header aria-label="Site Header" class="bg-white sticky shadow-sm top-0 z-10  backdrop-blur-sm	bg-white/90">
        <div
          class="mx-auto flex h-16 max-w-screen-2xl items-center gap-8 sm:px-6 lg:px-40"
        >
          <a class="block text-teal-600 flex items-center" href="/">
            <span class="sr-only">Home</span>
            <svg
              class="h-1"
              viewBox="0 0 28 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <img src="./logo/logo_mini.png" class="w-10">
              <img src="./logo/logo4.png" class="h-8 ml-1">
            </svg>
          </a>
      
          <div class="flex flex-1 items-center justify-end md:justify-between">
            <nav aria-label="Site Nav" class="hidden md:block">
              <ul class="flex items-center gap-10  font-bold text-base">
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="/KIC4_Project3/product.shop">
                    전체상품
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="/KIC4_Project3/productBest.shop">
                    베스트
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="/">
                    이벤트
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="/">
                    공지사항
                  </a>
                </li>
      
              </ul>
            </nav>
      
            <div class="flex items-center gap-4">
              <div class="flex gap-4">
                <a
                  class="block px-1 py-2.5 text-sm font-medium text-gray-700 transition hover:text-gray-500"
                  href="/"
                >
                  마이페이지
                </a>
      
                <a
                class="block px-1 py-2.5 text-sm font-medium text-gray-700 transition hover:text-gray-500"
                  href="/"
                >
                  로그인
                </a>
                <a href="#" class="block py-3 px-2 hover:border-red-700">
                  <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path>
                  </svg>
                </a>
              </div>
      
              <button
                class="block rounded bg-gray-100 p-2.5 text-gray-600 transition hover:text-gray-600/75 md:hidden"
              >
                <span class="sr-only">Toggle menu</span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M4 6h16M4 12h16M4 18h16"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>
    </header>


    <section>
      
      <div aria-label="search " class="bg-gray-50">
        <div class="mx-auto max-w-screen-2xl px-4 py-3 sm:px-6 lg:px-40">
        
        <form name="search" action="/KIC4_Project3/product.shop">
          <div class="flex items-center sm:justify-between sm:gap-4">
          
            <div class="relative hidden sm:block">
              <label class="sr-only" for="search"> Search </label>
              <input name="search" 
                class="h-12 w-full rounded-lg border border-gray-200 bg-white  pl-4 pr-10 text-sm sm:w-[300px]"
                id="search"
                type="search"
                placeholder="상품 검색"
                autocomplete="off"
              />
      
              <button
                type="submit"
                class="absolute top-1/2 right-2 -translate-y-1/2 rounded-md bg-gray-50 p-2 text-gray-600 transition hover:text-gray-700"
              >
                <span class="sr-only">Submut Search</span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-4 w-4"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                  />
                </svg>
              </button>
            </div>

            <div class="py-3 flex justify-end">
              <label for="SortBy" class="hidden block text-xs font-medium text-gray-700">
                상품 보기
              </label>

              <select id="SortBy" class="mt-1 text-sm border-gray-300 rounded">
              	<option value="PID, DESC">신상품순</option>
                <option value="Price, DESC">높은 가격순</option>
                <option value="Price, ASC">낮은 가격순</option>
              </select>
            </div> 

          </div>
          </form>
      
        
          </div>
        </div>

      <!-- 상품 -->
      <div class="relative max-w-screen-2xl px-4 py-0 mx-auto sm:px-6 sm:py-12 lg:pt-0 lg:pb-0 lg:px-40">
        <div class=" mt-0 flex">
          <!-- 검색필터 -->
          <div  class="hidden space-y-4 pt-7 pb-10 lg:block sticky top-20 h-full min-w-[340px] pr-10 md:hidden">
            <div class="relative h-full" >
            <div>
              <p class="block text-sm font-medium text-gray-700 pb-3">검색 필터</p>

              <div class="space-y-2 max-h-[400px] overflow-auto ">


                 <!-- 주종 -->
                 <details
                 class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden"
               >
                 <summary
                   class="flex items-center justify-between gap-2 p-3 text-gray-900 transition cursor-pointer"
                 >
                   <span class="text-sm font-medium"> 주종 </span>

                   <span class="transition group-open:-rotate-180">
                     <svg
                       xmlns="http://www.w3.org/2000/svg"
                       fill="none"
                       viewBox="0 0 24 24"
                       stroke-width="1.5"
                       stroke="currentColor"
                       class="w-4 h-4"
                     >
                       <path
                         stroke-linecap="round"
                         stroke-linejoin="round"
                         d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                       />
                     </svg>
                   </span>
                 </summary>

                 <div class="bg-white border-t border-gray-200">                 

                   <ul class="p-4 space-y-1 border-t border-gray-200 flex flex-wrap">
                     <li class="w-6/12 mt-1">
                       <label
                         for="category1"
                         class="inline-flex items-center gap-2"
                       >
                         <input
                           type="checkbox"
                           id="category1"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                         탁주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label
                         for="category2"
                         class="inline-flex items-center gap-2"
                       >
                         <input
                           type="checkbox"
                           id="category2"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                          약·청주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label
                         for="category3"
                         class="inline-flex items-center gap-2"
                       >
                         <input
                           type="checkbox"
                           id="category3"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                           과실주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label
                         for="category4"
                         class="inline-flex items-center gap-2"
                       >
                         <input
                           type="checkbox"
                           id="category4"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                           증류주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label
                         for="category5"
                         class="inline-flex items-center gap-2"
                       >
                         <input
                           type="checkbox"
                           id="category5"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                           기타주류
                         </span>
                       </label>
                     </li>  
                                    
                   </ul>                
                 </div>
               </details>
               
               
                <!-- 도수 -->
                <details
                class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden"
              >
                <summary
                  class="flex items-center justify-between gap-2 p-3 text-gray-900 transition cursor-pointer"
                >
                  <span class="text-sm font-medium"> 도수 </span>

                  <span class="transition group-open:-rotate-180">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="currentColor"
                      class="w-4 h-4"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                      />
                    </svg>
                  </span>
                </summary>

                <div class="bg-white border-t border-gray-200">
                

                  <ul class="p-4 space-y-1 border-t border-gray-200 flex flex-wrap">
                    <li class="w-6/12 mt-1">
                      <label
                        for="FilterRed"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterRed"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          0%-10%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterBlue"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterBlue"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          10%-20%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterGreen"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterGreen"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          20%-30%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterOrange"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterOrange"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          30% 이상
                        </span>
                      </label>
                    </li>
                  </ul>
                </div>
              </details>
         
                <!-- 가격 -->
                <details
                  class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden"
                >
                  <summary
                    class="flex items-center justify-between gap-2 p-3 text-gray-900 transition cursor-pointer"
                  >
                    <span class="text-sm font-medium"> 가격 </span>

                    <span class="transition group-open:-rotate-180">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="w-4 h-4"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                        />
                      </svg>
                    </span>
                  </summary>

                  <div class="bg-white border-t border-gray-200">
                    

                    <div class="p-4 border-t border-gray-200">
                      <div class="flex justify-between gap-4">
                        <label
                          for="FilterPriceFrom"
                          class="flex items-center gap-2"
                        >
                          
                          <input
                            type="number"
                            id="FilterPriceFrom"
                            placeholder="0"
                            class="w-full border-gray-200 rounded-md shadow-sm sm:text-sm px-2"
                          />
                          <span class="text-sm text-gray-600">원</span>

                        </label>

                        <label for="FilterPriceTo" class="flex items-center gap-2">
                          
                          <input
                            type="number"
                            id="FilterPriceTo"
                            placeholder="100,000"
                            class="w-full border-gray-200 rounded-md shadow-sm sm:text-sm px-2"
                          />
                          <span class="text-sm text-gray-600">원</span>

                        </label>
                      </div>
                    </div>
                  </div>
                </details>

                <!-- 주원료 -->
                <details
                  class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden"
                >
                  <summary
                    class="flex items-center justify-between gap-2 p-3 text-gray-900 transition cursor-pointer"
                  >
                    <span class="text-sm font-medium"> 주원료 </span>

                    <span class="transition group-open:-rotate-180">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="w-4 h-4"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                        />
                      </svg>
                    </span>
                  </summary>

                  <div class="bg-white border-t border-gray-200">
                  

                    <ul class="p-4 space-y-1 border-t border-gray-200 flex flex-wrap">
                      <li class="w-6/12 mt-1">
                        <label
                          for="FilterRed"
                          class="inline-flex items-center gap-2"
                        >
                          <input
                            type="checkbox"
                            id="FilterRed"
                            class="w-5 h-5 border-gray-300 rounded"
                          />
  
                          <span class="text-sm font-medium text-gray-700">
                          웃어른
                          </span>
                        </label>
                      </li>
  
                      <li class="w-6/12">
                        <label
                          for="FilterBlue"
                          class="inline-flex items-center gap-2"
                        >
                          <input
                            type="checkbox"
                            id="FilterBlue"
                            class="w-5 h-5 border-gray-300 rounded"
                          />
  
                          <span class="text-sm font-medium text-gray-700">
                            연인
                          </span>
                        </label>
                      </li>
  
                      <li class="w-6/12">
                        <label
                          for="FilterGreen"
                          class="inline-flex items-center gap-2"
                        >
                          <input
                            type="checkbox"
                            id="FilterGreen"
                            class="w-5 h-5 border-gray-300 rounded"
                          />
  
                          <span class="text-sm font-medium text-gray-700">
                            친구
                          </span>
                        </label>
                      </li>
  
                      <li class="w-6/12">
                        <label
                          for="FilterOrange"
                          class="inline-flex items-center gap-2"
                        >
                          <input
                            type="checkbox"
                            id="FilterOrange"
                            class="w-5 h-5 border-gray-300 rounded"
                          />
  
                          <span class="text-sm font-medium text-gray-700">
                            혼자
                          </span>
                        </label>
                      </li>
  
                      <li class="w-6/12">
                        <label
                          for="FilterPurple"
                          class="inline-flex items-center gap-2"
                        >
                          <input
                            type="checkbox"
                            id="FilterPurple"
                            class="w-5 h-5 border-gray-300 rounded"
                          />
  
                          <span class="text-sm font-medium text-gray-700">
                            비즈니스
                          </span>
                        </label>
                      </li>
  
                  
                    </ul>

                 
                  </div>
                </details>

                <!-- 상황별(대상) -->
                <details
                class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden"
              >
                <summary
                  class="flex items-center justify-between gap-2 p-3 text-gray-900 transition cursor-pointer"
                >
                  <span class="text-sm font-medium"> 상황별(대상) </span>

                  <span class="transition group-open:-rotate-180">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="currentColor"
                      class="w-4 h-4"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                      />
                    </svg>
                  </span>
                </summary>

                <div class="bg-white border-t border-gray-200">
                
                  <ul class="p-4 space-y-1 border-t border-gray-200 flex flex-wrap">
                    <li class="w-6/12 mt-1">
                      <label
                        for="FilterRed"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterRed"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                        웃어른
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterBlue"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterBlue"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          연인
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterGreen"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterGreen"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          친구
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterOrange"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterOrange"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          혼자
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label
                        for="FilterPurple"
                        class="inline-flex items-center gap-2"
                      >
                        <input
                          type="checkbox"
                          id="FilterPurple"
                          class="w-5 h-5 border-gray-300 rounded"
                        />

                        <span class="text-sm font-medium text-gray-700">
                          비즈니스
                        </span>
                      </label>
                    </li>

                
                  </ul>
                </div>
              </details>
              </div>
            </div>
            <div class="border-t	mt-4">
              <button class="sticky mt-4 block w-20 p-2 text-sm font-medium transition bg-gray-500 rounded text-white ">
                초기화
              </button>
            </div>
            </div>
          </div>

          <!-- 상품리스트 -->
          <div class="lg:col-span-4 mt-4 pb-10">
          <p class="flex justify-end">
          <button type="button" onclick="location.href='/KIC4_Project3/productWrite.shop'" class="bg-transparent hover:bg-blue-500 text-xs text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
  				상품등록
			</button>
			</p>
            <p class="my-3 flex justify-start">
              <span class="text-gray-700 text-sm"> <em class="productlist-num not-italic font-bold">${pgList.count }</em> 건의 결과가 있어요 </span>
            </p>
            
            <ul class="grid gap-6  lg:grid-cols-3 sm:grid-cols-2 ">

         	<c:forEach var="product" items="${productList}">
              <li class="mb-16">
                <a href="#" class=" block overflow-hidden group">
                  <div class="rounded-lg w-full hover:rounded-lg overflow-hidden">
                    <img src="${product.imgpath}.jpg" alt="${product.pname}"
                    class="w-[] h-[] object-cover transition duration-500  group-hover:scale-105 "
                  />  
                  </div>
                 
                  <div class="relative pt-3 bg-white">
                    <h3
                      class="text-sm text-gray-900 font-bold group-hover:underline group-hover:underline-offset-4"
                    >
                    ${product.pname}
                    </h3>

                    <p class="mt-2">
                      <span class="text-gray-900 font-bold"> <em class="price not-italic tracking-tighter">
                      <fmt:formatNumber value="${product.pprice}" pattern="###,###,###" /></em><span class="text-xs">원</span> 
                      </span>
                    </p>
                    
                  </div>
                </a>
                	<div class="text-xs">
          			<button type="button" onclick="location.href='/KIC4_Project3/productUpdate.shop?pID=${product.pID}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-2 mt-2 border border-blue-500 hover:border-transparent rounded">
  							수정
					</button>			
          			<button type="button" onclick="location.href='/KIC4_Project3/productDelete.shop?pID=${product.pID}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-2 mt-2 border border-blue-500 hover:border-transparent rounded">
  						삭제
					</button>	
					</div>		
              </li>
              </c:forEach>
              
            </ul>
			
		<c:if test="${pgList.count > 0}">
            <ol class="flex justify-center gap-1 mt-8 text-xs font-medium">            
	            <c:set var="pageCount" value="${pgList.count/pgList.pageSize+(pgList.count%pgList.pageSize==0?0:1)}" />
				<c:set var="startPage" value="${pgList.currentPage-((pgList.currentPage-1)%pgList.blockSize)}" />
				<c:set var="endPage" value="${pgList.startPage+pgList.blockSize-1}" />
				<c:if test="${pgList.endPage>pgList.pageCount}">
					<c:set var="endPage" value="${pgList.endPage=pgList.pageCount}" />
				</c:if>
				
			  <c:if test="${pgList.startPage>pgList.blockSize}">
              <li>
                <a
                  href="/KIC4_Project3/product.shop?pageNum=${pgList.startPage-pgList.blockSize}"
                  class="inline-flex items-center justify-center w-8 h-8 border border-gray-100 rounded"
                >
                  <span class="sr-only">Prev Page</span>
        
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="w-3 h-3"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </a>
              </li>
              </c:if>
        	  
      	  	  <c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">          
              <li>
              <c:choose>
              	<c:when test="${pgList.currentPage==i}">
              		<a href="/KIC4_Project3/product.shop?pageNum=${i}" class="block w-8 h-8 leading-8 text-center border border-gray-100 text-white bg-gray-900 rounded">
		                 ${i}
		             </a>
              	</c:when>
              	<c:otherwise>
		                <a
		                  href="/KIC4_Project3/product.shop?pageNum=${i}"
		                  class="block w-8 h-8 leading-8 text-center border border-gray-100 rounded">
		                 ${i}
		                </a>
		        </c:otherwise>
                </c:choose>
              </li>        
              </c:forEach>  
        		
        	    <c:if test="${pgList.endPage<pgList.pageCount}">
        	    <li>
                <a
                  href="/KIC4_Project3/product.shop?pageNum=${pgList.startPage+pgList.blockSize}"
                  class="inline-flex items-center justify-center w-8 h-8 border border-gray-100 rounded"
                >
                  <span class="sr-only">Next Page</span>
        
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="w-3 h-3"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </a>
              </li>
              </c:if>
            </ol>
            </c:if>
          </div>


        </div>
      </div>
    </section>


    <footer aria-label="Site Footer" class="bg-gray-100">
        <div class="mx-auto max-w-5xl px-4 py-16 sm:px-6 lg:px-40">
          <div class="flex justify-center text-teal-600">
            <svg
              class="h-0"
              viewBox="0 0 118 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <div class="flex justify-center">
              <img src="./logo/logo2.png" class="h-40">
              </div>
            </svg>
          </div>
      
          <p class="mx-auto mt-6 max-w-md text-center leading-relaxed text-gray-500">
            고객센터 : 070-123-4567 <br>
            평일 : 10:00 - 18:00, 주말 휴무
          </p>
      
          <nav aria-label="Footer Nav" class="mt-12">
            <ul class="flex flex-wrap justify-center gap-6 md:gap-8 lg:gap-12">
              <li>
                <a class="text-gray-700 transition hover:text-gray-700/75" href="/">
                  이용약관
                </a>
              </li>
      
              <li>
                <a class="text-gray-700 transition hover:text-gray-700/75" href="/">
                  개인정보처리방침
                </a>
              </li>
      
              <li>
                <a class="text-gray-700 transition hover:text-gray-700/75" href="/">
                  사업자정보
                </a>
              </li>
            </ul>
          </nav>
      
          <ul class="mt-12 flex justify-center gap-6 md:gap-8">
            <li>
              <a
                href="/"
                rel="noreferrer"
                target="_blank"
                class="text-gray-700 transition hover:text-gray-700/75"
              >
                <span class="sr-only">Facebook</span>
                <svg
                  class="h-6 w-6"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
            </li>
      
            <li>
              <a
                href="/"
                rel="noreferrer"
                target="_blank"
                class="text-gray-700 transition hover:text-gray-700/75"
              >
                <span class="sr-only">Instagram</span>
                <svg
                  class="h-6 w-6"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
            </li>
      
            <li>
              <a
                href="/"
                rel="noreferrer"
                target="_blank"
                class="text-gray-700 transition hover:text-gray-700/75"
              >
                <span class="sr-only">Twitter</span>
                <svg
                  class="h-6 w-6"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"
                  />
                </svg>
              </a>
            </li>
      
            <li>
              <a
                href="/"
                rel="noreferrer"
                target="_blank"
                class="text-gray-700 transition hover:text-gray-700/75"
              >
                <span class="sr-only">GitHub</span>
                <svg
                  class="h-6 w-6"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
            </li>
      
            <li>
              <a
                href="/"
                rel="noreferrer"
                target="_blank"
                class="text-gray-700 transition hover:text-gray-700/75"
              >
                <span class="sr-only">Dribbble</span>
                <svg
                  class="h-6 w-6"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
            </li>
          </ul>
        </div>
      </footer>
</body>
</html>