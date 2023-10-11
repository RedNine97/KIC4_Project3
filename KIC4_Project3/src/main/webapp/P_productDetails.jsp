<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.*"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 상세 페이지</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script>
    $(document).ready(() => {
      $("#cart_btn").click(function () {
          $("#p_form").attr("action", "./J_cart.html");
      });
    })
    $(document).ready(() => {
      $("#pay_btn").click(function () {
            $("#p_form").attr("action", "./J_payment.html");
      });
    })

    //====================== 상품상세페이지의 리뷰 더보기 사용시 주석 해제 =====================
    //기능:리뷰상자에서 리뷰 더보기를 클릭시 '리뷰 더보기'라는 글자 없애기
    /* 
    $(document).ready(() => {
      $('#review_more').click(function () {
        $("#review_more").hide();
      })
    })
    */

    let rtc ="propertychange change keyup paste input";//중복코드 주의

  $(document).ready(() => {$("#pro_num").on(rtc, pro_count)})
  
  function pro_count(type) {
    let number=$("#pro_num").val();
    if(type==='p' && $("#pro_num").val()<999){
      $("#pro_num").val(parseInt(number)+1)
    }else if(type==='m' && $("#pro_num").val()>0){
      $("#pro_num").val(parseInt(number)-1)
    }else{
      $("#pro_num").val(parseInt(number));
    }
  }

//==== 자바스크립트 파일로 옮길때는 아래 코드 삭제해야함(중복코드) ====
    function isNum(){
      $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }
//==== 자바스크립트 파일로 옮길때는 위 코드 삭제해야함(중복코드) ====

  $(document).ready(() => {$("#pro_num").on(rtc, p_calc);})

  function p_calc(){
    let x=document.getElementById("p_price").textContent.replace(/,/g , '');
    let y=document.getElementById("pro_num").value;
    let result=(x*y).toLocaleString('ko-KR');
    document.getElementById("p_result").textContent=result+'원';    
  }

  $(document).ready(() => {
    $("#pro_num").keydown(function() {
    //$('input[type="text"]').keydown(function() {//혹시 필요한 경우에
      if (event.keyCode === 13) {
        event.preventDefault();
      };
    });
  })
  </script>
  <jsp:include page="top.jsp" flush="false" /> 
</head>
<body>
  <!-- Navigation Bar Start -->
  <form method="post" name="ProductDetail" action="/KIC4_Project3/J_GoodsDetailAction.shop">
  <div class="relative mx-auto max-w-screen-xl px-4 py-8">
    <div>
      <h1 class="text-2xl font-bold lg:text-3xl">${goodsbean.pname}<h1>
    </div>

    <div class="grid gap-8 lg:grid-cols-4 lg:items-start">
      <div class="lg:col-span-2 mr-20">
        <div class="relative mt-4">
          <img src="${goodsbean.imgpath}.jpg"          
            class="w-50 rounded-xl object-cover lg:h-[540px]"/>          
        </div> 
      </div>
      
      <div class="lg:col-span-1 lg:-ml-24 py-8">
        <span class="text-yellow-400 font-bold">#수경재배 새싹삼 소주 #조선 3대 명주</span>   
        <p>수경재배한 청정 새싹삼은 뿌리까지 먹을 수 있는 삼으로 더 건강하고 맛있게 마실 수 있는 증류주에요.</p>
        <p>감홍로는 조선 3대 명주 중 하나로 다양한 한약재가 들어가서 조선시대부터 약주로 활용된 술이에요.</p>

        <span class="block pt-8 text-sm text-gray-500">배송기간 : 2일 이내 배송</span>

        <span class="block pt-12">판매가격 :</span>
        <h3 class="block text-2xl font-bold">
          <!-- ================판매가격================ -->
          <span name="p_price" id="p_price">${goodsbean.pprice}</span>원
          <!-- ================판매가격================ -->
        </h3>
      </div>


      <!-- 상품상세 form -->
      <div class="lg:col-span-1 lg:sticky lg:top-0 border px-3 py-4">  
        <form class="space-y-4 lg:pt-6" name="p_form" id="p_form" action="" method="get">
          <!--===================405에러떠서 method="get"으로 해둠=====================-->
          
          <fieldset>
            <legend class="text-lg font-bold">${goodsbean.count}</legend>
          </fieldset>
          <!-- 수량변경 start -->
          <div class="rounded border bg-gray-100 p-4 text-center">
            <p class="text-sm">
              <button type="button" class="relative border border-gray-300 border-2 h-12 w-12 text-xl" id="minus_num" onclick='pro_count("m");p_calc();'>-</button>
              <input class="relative -top-0.5 border border-gray-300 border-2 h-12 w-16 -mx-2 text-center" type="text" name="pro_num" id="pro_num" value="0"  maxlength="3" 
              oninput="isNum.call(this);">
              <button type="button" class="relative border h-12 w-12 text-xl border-gray-300 border-2 ml-0.5" id="plus_num" onclick='pro_count("p");p_calc();'>+</button>
            </p>
          </div>
          <!-- 수량변경 end-->

          <fieldset>
            <legend class="text-lg font-bold">총 상품 가격</legend>            
          </fieldset>

          <div class="rounded border bg-gray-100 p-4">
            <p class="text-sm text-center">
              <!-- ===============상품 가격=============== -->
              <span class="block" name="p_result" id="p_result">0원</span>
              <!-- ===============상품 가격=============== -->
            </p>
          </div>

          <div class="rounded border p-4">
            <p class="text-sm">
              <span class="block mb-1">배송비</span>
                <p class="text-blue-500 text-lg">3000원</p>
                <p class="text-blue-500 text-sm">※ 각 양조장에 따라 배송비가 변동될 수 있습니다.</p>
          </div>

          <div class="lg:static lg:bg-white py-2 px-1 bg-gray-100 fixed bottom-0 left-0 right-0 flex lg:block">
            <!-- 장바구니 페이지 이동, 로그인이 안돼있으면 로그인 페이지로 -->
            <button
              type="submit" id="cart_btn"
              class="w-full rounded border border-gray-300 bg-white lg:bg-gray-100 mx-1 lg:mx-0 px-6 py-3 text-sm font-bold tracking-wide">
              장바구니 이동
            </button>

            <!-- 결제 페이지 이동, 로그인이 안돼있으면 로그인 페이지로 -->
            <button
            type="submit" id="pay_btn"
            class="w-full rounded bg-blue-500 lg:my-1.5 lg:mx-0 mx-1 px-6 py-3 text-sm font-medium tracking-wide text-white">
            바로 구매하기
          </button>
        </div>

        </form>
        <!-- 상품상세 form -->
      </div>

      <div class="lg:col-span-3">        
        <div class="prose max-w-none pl-0 lg:pl-6">

          <!-- 상품 상세 설명 파트, 설명이나 추천안주 같은 내용이 들어감, 이 부분은 상품마다 변경이 되도록 구상함 -->
          <div>
            <span>
             <p>${goodsbean.pdesc}</p>
            </span>
          </div>
          <div>
            <label class="font-semibold">상품정보</label>
            <div class="table border border-gray-100 text-center mt-3 text-sm md:table-fixed mx-0 sm:mx-4 lg:mx-1">
              <div class="table-row border h-10 px-2">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  상품종류
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.pcategory}
                </div>
              </div>
              <div class="table-row border h-10">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  도수
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.alcdegree}
                </div>
              </div>
              <div class="table-row border h-10">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  규격
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.volume}
                </div>
              </div>
              <div class="table-row border h-10">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  원료
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.ingredient}
                </div>
              </div>
              <div class="table-row border h-10">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  제조회사
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.pcompany}
                </div>
              </div>
              <div class="table-row border h-10">
                <div class="table-cell border px-2 align-middle bg-gray-100">
                  상황별 대상
                </div>
                <div class="table-cell border px-2 align-middle">
                  ${goodsbean.pperson}
                </div>
              </div>
            </div>
          </div>

            <!-- 교환/반품 문의 안내, 이 부분은 변경 없어도 될듯함-->
            <div class="my-12">
              <label class="font-semibold">교환/반품 문의</label>
              <p>01.
              상품의 파손 및 하자, 변질 등 문제가 있는 경우</p>
              <p>-성함, 연락처, 상품의 사진과 함께 고객센터로
              문의 부탁드립니다.</p>
              <p>02.
              수령하신 상품의 불량, 파손, 오배송의 경우</p>
              <p>- 교환/반품이 가능하며 배송비는 판매자가 부담합니다.</p>
              <p>03.
              교환 / 반품 / 환불이 제한되는 경우</p>
              <p>- 배송완료 후 7일이 지나 자동으로 수령확인 처리가 되거나, 상품을 확인하고 직접 수령확인하신 이후</p>
              <p>※ 식품 특성상, 아래와 같은 경우 교환/반품/환불이
              제한될 수 있습니다.</p>
              <p>- 제품이 개봉되었거나 포장이 훼손된 경우
              (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</p>
              <p>- 사전 연락없이 임의 반송된 경우</p>
              <p>- 주소의 오기재, 잘못된 주문, 주소 불명, 수취인 부재의 경우</p>
              <p>- 단순 변심에 의한 경우</p>
              <p>- 잘못된 방법으로 보관하거나 고객님의 부주의로 인한
              오염, 파손, 변질된 제품</p>
            </div>


          <!-- 리뷰 -->
          <div class="bg-gray-100">
            <!-- 리뷰 작성 폼 필요 -->
            <!-- 리뷰 작성자라면 자기가 쓴 글 수정/삭제 버튼 보이도록 -->
            <div>
              <div class="bg-blue-100 flex flex-col md:flex-row text-sm md:text-base">
                <div class="flex justify-between md:grow">
                  <span class="ml-4 mt-2 md:my-2 font-semibold ">닉네임</span>
                  <span class="mr-4 mt-2">상품명</span>
                </div>
                <div class="mx-4 my-2">0000.02.20</div>
              </div>
              <div class="py-2">
                <span span class="ml-4 mt-2">혼자 부담없이 먹기에 좋아요!</span>
                <img class="border ml-4 my-4 w-28"src="./img/sool.jpg">
              </div>
            </div>

            <div>
              <div class="bg-blue-100 flex flex-col md:flex-row text-sm md:text-base">
                <div class="flex justify-between md:grow">
                  <span class="ml-4 mt-2 md:my-2 font-semibold ">닉네임</span>
                  <span class="mr-4 mt-2">상품명</span>
                </div>
                <div class="mx-4 my-2">0000.02.20</div>
              </div>
              <div class="py-2">
                <span span class="ml-4 mt-2">부드럽고 깊은 맛입니다.</span>
                <img class="border ml-4 my-4 w-28"src="./img/sool.jpg">
              </div>
            </div>

            <!-- 페이징 처리와 비슷하게 리뷰가 길어질때 클릭해서 더 많은 리뷰를 보이게 하는 기능, 필요없다 판단시 생략 가능
            <details>
              <summary class="cursor-pointer list-none font-medium text-blue-600 hover:text-blue-500 text-center mb-4" id="review_more">
                리뷰 더보기
              </summary>

                <div>
                  <div class="bg-blue-100 flex flex-col md:flex-row text-sm md:text-base">
                    <div class="flex justify-between md:grow">
                      <span class="ml-4 mt-2 md:my-2 font-semibold ">닉네임</span>
                      <span class="mr-4 mt-2">상품명</span>
                    </div>
                    <div class="mx-4 my-2">0000.02.20</div>
                  </div>
                  <div class="py-2">
                    <span span class="ml-4 mt-2">지인한테 추천 받고 첫 주문인데 기대되네요!</span>
                    <img class="border ml-4 my-4 w-28"src="./img/sool.jpg">
                  </div>
                </div>

            </details>
          -->

          </div>
        </div>
      </div>
    </div>
  </div>
  </form>

      <jsp:include page="footer.jsp" flush="false" /> 
  <!-- FOOTER -->
</body>
</html>