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
    <script src="filter.js"></script>    
    <title>상품리스트</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

<c:set var="checkManager" value="${checkManager}"/>

<section>
      
      <div aria-label="search " class="bg-gray-50">
        <div class="mx-auto max-w-screen-2xl px-4 py-3 sm:px-6 lg:px-40">
        
        <form name="search" action="product.shop">
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

              <select id="SortBy" name="SortBy" onchange="sortChange()" class="mt-1 text-sm border-gray-300 rounded">
              	<option value="PID DESC">신상품순</option>
                <option value="pprice DESC">높은 가격순</option>
                <option value="pprice ASC">낮은 가격순</option>
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

              <div class="space-y-2 max-h-[1000px] overflow-auto ">
              
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
                       <label class="inline-flex items-center gap-2">
                         <input
                           type="checkbox"
                           name="pcategory" id="pcategory" value="'탁주'"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                         탁주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label class="inline-flex items-center gap-2">
                         <input
                           type="checkbox"
                           name="pcategory" id="pcategory" value="'약주'"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                          약·청주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label class="inline-flex items-center gap-2">
                         <input
                           type="checkbox"
                           name="pcategory" id="pcategory" value="'과실주'"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                           과실주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label class="inline-flex items-center gap-2">
                         <input
                           type="checkbox"
                           name="pcategory" id="pcategory" value="'증류주'"
                           class="w-5 h-5 border-gray-300 rounded"
                         /> 
                         <span class="text-sm font-medium text-gray-700">
                           증류주
                         </span>
                       </label>
                     </li>
 
                     <li class="w-6/12">
                       <label class="inline-flex items-center gap-2">
                         <input
                           type="checkbox"
                           name="pcategory" id="pcategory" value="'기타주류'"
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
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="alcdegree1" id="alcdegree" value="between 0 and 10"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          0%-10%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="alcdegree2" id="alcdegree" value="between 10 and 20"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          10%-20%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="alcdegree3" id="alcdegree" value="between 20 and 30"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          20%-30%
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="alcdegree4" id="alcdegree" value=">=30"
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
                        <label class="flex items-center gap-2" >
                        <input
                            type="number"
                            name="priceFrom" id="priceFrom" onchange="pricecheck1()"
                            placeholder="0"
                            class="w-full border-gray-200 rounded-md shadow-sm sm:text-sm px-2"
                          />
                          <span class="text-sm text-gray-600">원</span>

                        </label>

                        <label class="flex items-center gap-2">
                          <input
                            type="number"
                            name="priceTo" id="priceTo" onchange="pricecheck2()"
                            placeholder="1,000,000"
                            class="w-full border-gray-200 rounded-md shadow-sm sm:text-sm px-2"
                          />
                          <span class="text-sm text-gray-600">원</span>

                        </label>
                      </div>
                    </div>
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
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="pperson" id="pperson" value="'웃어른'"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                        웃어른
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="pperson" id="pperson" value="'연인'"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          연인
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="pperson" id="pperson" value="'친구'"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          친구
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="pperson" id="pperson" value="'혼자'"
                          class="w-5 h-5 border-gray-300 rounded"
                        />
                        <span class="text-sm font-medium text-gray-700">
                          혼자
                        </span>
                      </label>
                    </li>

                    <li class="w-6/12">
                      <label class="inline-flex items-center gap-2">
                        <input
                          type="checkbox"
                          name="pperson" id="pperson" value="'비즈니스'"
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
            <button id="filterSearch" onclick="filterSearch()" class="sticky mt-4 w-20 p-2 text-sm font-medium transition bg-gray-500 rounded text-white ">
                검색
              </button>
              <button onclick="reset()" class="sticky mt-4 w-20 p-2 text-sm font-medium transition bg-gray-500 rounded text-white ">
                초기화
              </button>
            </div>
            </div>
          </div>


          <!-- 상품리스트 -->
          <div id="divReloadLayer" class="lg:col-span-4 mt-4 pb-10">
          <p class="flex justify-end">
          <c:if test="${checkManager==1}">
          <button type="button" onclick="location.href='./productWrite.shop'" class="bg-transparent hover:bg-blue-500 text-xs text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
  				상품등록
			</button>
			</c:if>
			</p>
            <p class="my-3 flex justify-start">
              <span class="text-gray-700 text-sm"> <em class="productlist-num not-italic font-bold">${pgList.count }</em> 건의 결과가 있어요 </span>
            </p>
            
            <ul class="grid gap-6  lg:grid-cols-3 sm:grid-cols-2 ">

         	<c:forEach var="product" items="${productList}">
              <li class="mb-16">
                <a href="./productDetail.shop?pID=${product.pID}&pageNum=${pgList.currentPage}" class=" block overflow-hidden group">
                  <div class="aspect-[3/4] rounded-lg w-full hover:rounded-lg overflow-hidden">
                    <img src="${product.imgpath}.jpg" alt="${product.pname}"
                    class="w-[100%] h-[100%] object-cover transition duration-500  group-hover:scale-105 "
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
                	<c:if test="${checkManager==1}">
          			<button type="button" onclick="location.href='./productUpdate.shop?pID=${product.pID}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-2 mt-2 border border-blue-500 hover:border-transparent rounded">
  							수정
					</button>			
          			<button type="button" onclick="location.href='./productDelete.shop?pID=${product.pID}'" class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-1 px-2 mt-2 border border-blue-500 hover:border-transparent rounded">
  						삭제
					</button>	
					</c:if>
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
                  href="./product.shop?pageNum=${pgList.startPage-pgList.blockSize}&pcategory=${pcategory}&alcdegree=${alcdegree}&pprice1=${pprice1}&pprice2=${pprice2}&pperson=${pperson}&sort=${sort}"
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
              		<a href="./product.shop?pageNum=${i}&pcategory=${pcategory}&alcdegree=${alcdegree}&pprice1=${pprice1}&pprice2=${pprice2}&pperson=${pperson}&sort=${sort}" class="block w-8 h-8 leading-8 text-center border border-gray-100 text-white bg-gray-900 rounded">
		                 ${i}
		             </a>
              	</c:when>
              	<c:otherwise>
		                <a
		                  href="./product.shop?pageNum=${i}&pcategory=${pcategory}&alcdegree=${alcdegree}&pprice1=${pprice1}&pprice2=${pprice2}&pperson=${pperson}&sort=${sort}"
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
                  href="./product.shop?pageNum=${pgList.startPage+pgList.blockSize}&pcategory=${pcategory}&alcdegree=${alcdegree}&pprice1=${pprice1}&pprice2=${pprice2}&pperson=${pperson}&sort=${sort}"
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

<jsp:include page="footer.jsp" flush="false" />
</body>
</html>