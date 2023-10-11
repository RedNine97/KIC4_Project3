<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="script.js?ver=2.4"></script>
    
    <title>주문내역조회</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" />

	<!-- Section Start -->
	  <!-- 주문 내역 보기 section -->
  <section>
    
    <div class="mb-6 bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 sm:h-24 grid text-xl">
      <div >
        주문 내역 보기
      </div>
    </div>

    <!-- 주문내역 검색 start -->
    <div>
      <form class="px-0 sm:px-8">
        <div class="px-3 sm:px-0">
          <div class="text-xl font-semibold sm:px-0 border-b border-gray-900 pb-1">
            검색 기간 설정
          </div>
          <div>
            <div class="inline-flex my-2 mr-4 pt-2">
              <button class="border border-gray-300 px-4 py-2">오늘</button>
              <button class="border border-gray-300 px-4 py-2">1주</button>
              <button class="border border-gray-300 px-4 py-2">1개월</button>
              <button class="border border-gray-300 px-4 py-2">1년</button>
            </div>
            <div class="inline-block">
              <input type="date">
              <span>~</span>
              <input type="date">
            </div>       
          </div>
        </div>

        <div class="">
          <div class="mx-3 sm:mx-0 mt-4 sm:mt-6 text-xl font-semibold px-0 border-b border-gray-900 pb-1">
            검색조건
          </div>
          <div class="flex my-2 pt-2">
            <div class="w-full sm:w-auto inline-flex sm:inline-block">     
              <select name="search">
                <option value="order_num">주문번호</option>
                <option value="ship_num">배송번호</option>
                <option value="product" selected>주문상품</option>
              </select>
              <input class="w-full sm:w-80 border border-x-transparent sm:border-gray-500 " type="text" size="25" name="pro_search">
            </div>
            <button class="sm:rounded-md w-20 sm:w-24 mx-0 sm:ml-2 px-4 bg-blue-500 text-white hover:bg-opacity-90 focus:outline-none sm:focus:ring-2 focus:ring-blue-600 focus:ring-offset-2">검색</button>            
          </div>          
        </div>
      </form>
    </div>
    <!-- 주문내역 검색 end -->
    <!-- 주문내역 검색 구현 문제시 삭제 -->
        <!-- 게시판에 데이터가 없을 때 -->
	    <c:if test="${pgList.count==0}">
		</c:if>
				 <!-- 레코드 결과가 1개라도 있다면? -->
		<c:if test="${pgList.count>0}">
				<c:set var="number" value="${pgList.number}" />
    	<c:forEach var="article" items="${articleList}">
    	
		        </c:forEach>
        </c:if>
		
    <!-- 주문 내역 표 start-->
    <div class="w-full px-8 py-6 table">
      <div class="-ml-5 sm:mx-0 mt-4 sm:mt-6 text-xl font-semibold px-0 pb-1 mb-3 sm:mb-4">
         주문 내역
      </div>
      <div class=" border-y border-gray-700" >
        <div class="text-center grid grid-cols-11 align-middle bg-gray-50">
          <div class="hidden md:table-cell align-middle col-span-1 border">주문번호</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">배송번호</div>
          <div class="hidden md:table-cell align-middle col-span-3 border">주문상품</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">상품 가격</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">수량</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">구매 금액</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">배송비</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">결제 금액</div>
          <div class="hidden md:table-cell align-middle col-span-1 border">주문 날짜</div>
        </div>
        <div class="text-center grid-cols-3 grid md:grid-cols-11">
          <div class="col-span-1 grid place-items-center border md:order-1">
            1234
          </div>
          <div class="col-span-1 grid place-items-center md:col-span-1 border md:order-2">
            1111-1111
          </div>
          <div class="col-span-1 grid grid place-items-center border md:order-9">
            22.02.22
          </div>
          <div class="col-span-3 md:col-span-3 border flex items-center md:order-3">
            <img class="w-24 mx-2 my-2 flex-auto" src="./img/sool.jpg">
            <span class="mx-2 my-2 flex-auto grid-flow-dense">
              [500ml] 병영소주
            </span>
          </div>
          <div class="grid place-items-center border md:order-4 grid-flow-dense">
            <span>
              <span span class="md:hidden">상품 가격 : </span>
              <span>22,000</span>
            </span>
          </div>
          <div class="grid place-items-center md:col-span-1 border md:order-5 grid-flow-dense">
            <span>
              <span span class="md:hidden">수량 : </span>
              <span>1</span>
            </span>
          </div>
          <div class="grid place-items-center border md:order-6">
            <span>
              <span span class="md:hidden">구매 금액 : </span>
              <span>22,000</span>
            </span>
          </div>
          <div class="col-span-1 grid place-items-center border md:order-7">
            <span>
              <span span class="md:hidden">배송비 : </span>
              <span>3,000</span>
            </span>
          </div>
          <div class="col-span-2 md:col-span-1 grid place-items-center border md:order-8">
            <span>
              <span span class="font-bold md:hidden">총 결제 금액 : </span>
              <span span class="font-bold md:font-normal">25,000</span>
            </span>
          </div>

      </div>
    </div>
    <!-- 주문 내역 표-->

    <div class="text-center my-3">
      <nav class="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
        <a href="#" class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
          <span class="sr-only">Previous</span>
          <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" />
          </svg>
        </a>
        <a href="#" aria-current="page" class="relative z-10 inline-flex items-center bg-blue-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600">1</a>

        <a href="#" class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
          <span class="sr-only">Next</span>
          <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z" clip-rule="evenodd" />
          </svg>
        </a>
      </nav>
    </div>

  </section>
  <!-- 주문 내역 보기 section -->
  
  
    <!-- section start-->
  <section class="mb-8">
    
    <div class="mt-12 mb-6  bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 sm:h-24 grid text-xl">
      <div >
        주문 처리 현황
      </div>
    </div>

    <!-- 주문 처리 현황 표 start-->
    <form name="" id="" action="./Y_orderCancel.html" method="get">

      <div class="w-full px-8 table">
        <div class="" >
          <div class="text-center grid grid-cols-11 align-middle bg-gray-50">
            <div class="hidden md:table-cell align-middle col-span-1 border">주문번호</div>
            <div class="hidden md:table-cell align-middle col-span-3 border">주문상품</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">수량</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">상품 가격</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">구매 금액</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">배송비</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">결제 금액</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">주문 날짜</div>
            <div class="hidden md:table-cell align-middle col-span-1 border">주문 상태</div>
          </div>
          <div class="text-center grid-cols-3 grid md:grid-cols-11">
            <div class="col-span-2 md:col-span-1 grid place-items-center border md:order-1">
              1234
            </div>
            <div class="col-span-1 grid place-items-center border md:order-9">
              22.02.22
            </div>
            <div class="col-span-3 md:col-span-3 border flex items-center md:order-3">
              <img class="w-24 mx-2 my-2 flex-auto" src="./img/sool.jpg">
              <span class="mx-2 my-2 flex-auto grid-flow-dense">
                [500ml] 병영소주
              </span>
            </div>
            <div class="grid place-items-center border md:order-5 grid-flow-dense">
              <span>
                <span span class="md:hidden">상품 가격 : </span>
                <span>22,000</span>
              </span>
            </div>
            <div class="grid place-items-center md:col-span-1 border md:order-4 grid-flow-dense">
              <span>
                <span span class="md:hidden">수량 : </span>
                <span>1</span>
              </span>
            </div>
            <div class="grid place-items-center border md:order-6">
              <span>
                <span span class="md:hidden">구매 금액 : </span>
                <span>22,000</span>
              </span>
            </div>
            <div class="col-span-1 grid place-items-center border md:order-7">
              <span>
                <span span class="md:hidden">배송비 : </span>
                <span>3,000</span>
              </span>
            </div>
            <div class="col-span-2 md:col-span-1 grid place-items-center border md:order-8">
              <span>
                <span span class="font-bold md:hidden">총 결제 금액 : </span>
                <span span class="font-bold md:font-normal">25,000</span>
              </span>
            </div>
            
            <div class="col-span-3 md:col-span-1 text-center flex justify-center items-center border md:grid md:place-items-center md:order-last">
              <span class="text-blue-500 mx-2">입금전</span>
              <button type="submit">주문 취소</button>
            </div>
            <!-- 입금이 완료되면 입금 완료로 -->
        </div>
      </div>
    </form>
    <!-- 주문 처리 현황 표 end-->

    <div class="my-3 text-center">
      <nav class="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
        <a href="#" class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
          <span class="sr-only">Previous</span>
          <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" />
          </svg>
        </a>
        <a href="#" aria-current="page" class="relative z-10 inline-flex items-center bg-blue-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600">1</a>

        <a href="#" class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
          <span class="sr-only">Next</span>
          <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z" clip-rule="evenodd" />
          </svg>
        </a>
      </nav>
    </div>

  </section>
<!-- section end-->
	<!-- Section End -->
    
      <jsp:include page="footer.jsp" flush="false" />
    
</body>
</html>