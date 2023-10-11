<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<c:set var="memid" value="${memid}"/>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>술주랑</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

  <script type="text/javascript">

  function moveTop() {
    window.scrollTo({ top: 0, behavior: "smooth"});
  }
  
  $(window).on('load resize', function() {
    //if($(window).width()>1279) { 	
    if(matchMedia("(min-width: 1280px)").matches) {
      $("#bestList").children().eq(9).addClass("hidden");
    }else{
      $("#bestList").children().eq(9).removeClass("hidden");
    }
  });
  
  /* 스타일 시트 사용할 경우
  @media (min-width: 1280px) {
    #bestList div:nth-child(10){
      display: none;
    }
  }
  */
  $(document).ready(function () {
	    $(".slide_div").not(".show_slide").hide();//show_slide 클래스가 아닌것을 hidden
	    setInterval(nextSlide, 4000); 
	  });
	  
	  function prevSlide() {
	    $(".slide_div").hide();
	    let allSlide = $(".slide_div"); 
	    let currentIndex = 0; 
	    $(".slide_div").each(function(index,item){ 
	      if($(this).hasClass("show_slide")) {//show_slide가지고 있다면 
	        currentIndex = index;
	      }
	    });
	          
	    let newIndex = 0;
	      
	    if(currentIndex <= 0) {
	      newIndex = allSlide.length-1;
	    } else {
	      newIndex = currentIndex-1;
	    }
	  
	    $(".slide_div").removeClass("show_slide");        
	    $(".slide_div").eq(newIndex).addClass("show_slide");
	    $(".slide_div").eq(newIndex).show();
	  
	  }
	  
	  function nextSlide() {
	    $(".slide_div").hide();
	    let allSlide = $(".slide_div");
	    let currentIndex = 0;
	    
	    $(".slide_div").each(function(index,item){
	      if($(this).hasClass("show_slide")) {
	        currentIndex = index;
	      }
	    });
	    
	    let newIndex = 0;
	    
	    if(currentIndex >= allSlide.length-1) {
	      newIndex = 0;
	    } else {
	      newIndex = currentIndex+1;
	    }
	  
	    $(".slide_div").removeClass("show_slide");
	    $(".slide_div").eq(newIndex).addClass("show_slide");
	    $(".slide_div").eq(newIndex).show();
	    
	  }
</script>

  <style>


    .carousel-open:checked + .carousel-item {
      position: static;
      opacity: 100;
    }

    .carousel-item {
      -webkit-transition: opacity 0.6s ease-out;
      transition: opacity 0.6s ease-out;
    }

    #carousel-1:checked ~ .control-1,
    #carousel-2:checked ~ .control-2,
    #carousel-3:checked ~ .control-3 {
      display: block;
    }

    .carousel-indicators {
      list-style: none;
      margin: 0;
      padding: 0;
      position: absolute;
      bottom: 2%;
      left: 0;
      right: 0;
      text-align: center;
      z-index: 10;
    }

    #carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
    #carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
    #carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
      color: #000;
    }  
  </style>
  <jsp:include page="top.jsp" flush="false" />
</head>


<body>
    <section class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">
    
     <!-- 이벤트 배너 -->
    <div class="carousel relative container mx-auto" style="max-width:1600px;">
        <div class="carousel-inner relative overflow-hidden w-full">
            <!-- 슬라이드 1 -->

            <input class="carousel-open hidden" type="radio" id="carousel-1" name="carousel" aria-hidden="true" checked="checked">

            <div class=" carousel-item slide_div show_slide" onclick="javascript:location.href='E_event.shop' ">
              <img class="cursor-pointer" src="./img/ev1.jpg"> 
            </div>

            <label for="carousel-3" class="control-1 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50 leading-tight text-center z-10 inset-y-0 left-0 my-auto prev" onclick="prevSlide()">‹</label>
            <label for="carousel-2" class="control-1 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50 leading-tight text-center z-10 inset-y-0 right-0 my-auto next" onclick="nextSlide()">›</label>

            <!-- 슬라이드 2 -->
            <input class="carousel-open hidden" type="radio" id="carousel-2" name="carousel" aria-hidden="true">

            <div class="slide_div" onclick="javascript:location.href='E_event.shop' ">
                <img class="w-full cursor-pointer" src="./img/ev2.jpg"> 
            </div>

            <label for="carousel-1" class="control-2 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50  leading-tight text-center z-10 inset-y-0 left-0 my-auto prev" onclick="prevSlide()">‹</label>
            <label for="carousel-3" class="control-2 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50   leading-tight text-center z-10 inset-y-0 right-0 my-auto next" onclick="nextSlide()">›</label>

            <!-- 슬라이드 3-->
            <input class="carousel-open hidden" type="radio" id="carousel-3" name="carousel" aria-hidden="true">

            <div class="slide_div"  class="cursor-pointer" onclick="javascript:location.href='E_event.shop' ">
              <img class="cursor-pointer" src="./img/ev3.jpg"> 
            </div>
            
            <label for="carousel-2" class="control-3 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50 leading-tight text-center z-10 inset-y-0 left-0 my-auto prev" onclick="prevSlide()">‹</label>
            <label for="carousel-1" class="control-3 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  opacity-50  leading-tight text-center z-10 inset-y-0 right-0 my-auto next" onclick="nextSlide()">›</label>

            <ol class="carousel-indicators hidden md:inline-block">
                <li class="inline-block mr-3">
                    <label for="carousel-1" class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-gray-500"></label>
                </li>
                <li class="inline-block mr-3">
                    <label for="carousel-2" class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-gray-500"></label>
                </li>
                <li class="inline-block mr-3">
                    <label for="carousel-3" class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-gray-500"></label>
                </li>
            </ol>

        </div>
    </div>

    <!--Top 버튼-->
    <div id="topBtn" class="flex items-center justify-center bg-blue-600 hover:bg-blue-500 text-white font-semibold fixed rounded-full cursor-pointer w-20 h-20 text-2xl bottom-7 right-7 md:w-16 md:h-16 md:text-xl md:bottom-6 md:right-6 z-10" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" onclick="moveTop()">
      TOP <span class="hidden text-sm md:inline-block">▲</span>
    </div>

    <div class="flex justify-center w-full text-black text-center font-bold text-xl mt-4 -mb-0.5 h-11">
      <div class="self-center">술주랑에 와 주셔서 정말 감사합니다! <span class="inline-block">즐거운 쇼핑되세요!</span></div>
    </div>

    <!-- 베스트 상품 파트 -->
    <section class="bg-white py-8">
      <div class="flex justify-center bg-blue-500 text-white w-full text-center font-bold text-xl -mb-2 h-11">
        <div class="self-center">술주랑에서 가장 사랑받는 술이에요</div>
      </div>
      <div id="bestList" class="container mx-auto flex items-center flex-wrap pt-4 pb-12">
        <nav id="best_store" class="w-full top-0 px-6 py-1">
          
          <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">

            <p class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl md:mt-3">
              베스트 상품
            </p>

            <div class="flex items-center" id="store-nav-content">

              <a class="pl-3 inline-block no-underline text-sm text-black hover:text-gray-500" href="./productBest.shop">
                more >>
              </a>

            </div>
          </div>
        </nav>
		
		<c:forEach var="beProduct" items="${beProduct}">
	        <div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col text-2xl md:text-base ">
	          <a href="./productDetail.shop?pID=${beProduct.pID}">
	            <img src="${beProduct.imgpath}.jpg">
	            <div class="pt-3 flex items-center">
	              <p class="">${beProduct.pname}</p>
	            </div>
	            <p class="pt-1 text-gray-900 text-right">
	            <fmt:formatNumber value="${beProduct.pprice}" pattern="###,###,###" /></em>
	            원</p>
	          </a>
	        </div>
		</c:forEach>
		
      </div>
    </section>

    <!-- 추천 상품 파트 -->
    <section class="bg-white py-8">
      <div class="flex justify-center bg-blue-500 text-white w-full text-center font-bold text-xl -mb-2 -mt-10 h-11">
        <div class="self-center">이런 술은 어떠신가요?</div>
      </div>
      <div class="container mx-auto flex items-center flex-wrap pt-4 pb-12">
        <nav id="best_store" class="w-full  top-0 px-6 py-1">
          <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">
  
            <p class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl md:mt-3">
              추천 상품
            </p>
  
            <div class="flex items-center" id="store-nav-content">
  
              <a class="pl-3 inline-block no-underline text-sm text-black hover:text-gray-500" href="./product.shop">
                more >>
              </a>
  
            </div>
          </div>
        </nav>
  		<c:forEach var="reProduct" items="${reProduct}">
	        <div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col text-2xl md:text-base">
	          <a href="./productDetail.shop?pID=${reProduct.pID}">
	            <img src="${reProduct.imgpath}.jpg">
	            <div class="pt-3 flex items-center">
	              <p class="">${reProduct.pname}</p>
	            </div>
	            <p class="pt-1 text-gray-900 text-right">
				<fmt:formatNumber value="${reProduct.pprice}" pattern="###,###,###" /></em>
				원</p>
	          </a>
	        </div>
  		</c:forEach>
      </div>
    </section>

    <!-- 디자인 부분 -->
    <div class="flex justify-center bg-blue-500 text-white w-full text-center font-bold text-xl  h-11">
      <div class="self-center">다른 분들은 이렇게 말씀하셨어요</div>
    </div>


    <!-- 리뷰 파트, 버튼 눌러서 옆으로 슬라이드 하는 기능 구현 필요.. 했는데 리뷰가 사라짐 -->
    <section class="bg-white py-8 mb-12">
      
      <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">
        <p class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl">
          실시간 리뷰
        </p>
      </div>
      <div class="container mx-auto flex justify-around lg:justify-evenly flex-wrap pt-4 pb-12">  
        <div class="w-5/6 md:w-1/4 xl:w-1/4 p-3 flex flex-col">
          <div class="p-1">
            <a href="#">
              <img class="rounded-xl" src="./img/sool.jpg">
            </a>
          </div>
          <div class="text-center text-yellow-400 ">★★★★★</div>
          <div class="truncate w-full my-4">
            나는 긴 리뷰가 있을때 점들을 보여주고 싶은 생각이 있는데 이거 되니 안되니 되는거 맞아?
          </div> 
          <div class="text-center">
            닉네임
          </div>
        </div>

        <div class="w-5/6 md:w-1/4 xl:w-1/4 p-3 flex flex-col">
          <div class="p-1">
            <a href="#">
              <img class="rounded-xl" src="./img/sool.jpg">
            </a>
          </div>
          <div class="text-center text-yellow-400 ">★★★★★</div>
          <div class="truncate w-full my-4">
            어느 음식에나 잘 어울리고 특히 매운 음식에 좋을 것 같다고 생각이 드네요!
          </div> 
          <div class="text-center">
            닉네임
          </div>
        </div>

        <div class="w-5/6 md:w-1/4 xl:w-1/4 p-3 flex flex-col">
          <div class="p-1">
            <a href="#">
              <img class="rounded-xl" src="./img/sool.jpg">
            </a>
          </div>
          <div class="text-center text-yellow-400 ">★★★★★</div>
          <div class="truncate w-full my-4">
            지인한테 추천 받고 첫 주문인데 기대되네요! 지인이라고 하니까 생각나는게 있는데 제가 LA에 있을때는 말이죠 정말 제가 꿈에 무대인 메이저리그로 진출해서 가는 식당마다 싸인해달라 기자들은 항상 붙어다니며 취재하고 제가 그 머~ 어~ 대통령이 된 기분이였어요 그런데 17일만에 17일만에 마이너리그로 떨어졌어요 못던져서 그만두고 그냥 확 한국으로 가버리고 싶었어요 그래서 집에 가는길에 그 맥주6개 달린거 있잖아요 맥주6개 그걸 사가지고 집으로 갔어요 그전에는 술먹으면 야구 못하는줄 알았어요 그냥 한국으로 가버릴려구.... 그리고 맥주 6개먹고 확 죽어버릴려고 그랬어요 야구 못하게 되니깐 그러나 집에가서 일단은 부모님에게 전화를 해야겠다고 생각을 했어요 다음날 가려고 전화를 딱 했는데 어머니께서 찬호야 어후~ 찬호야 아들 잘있어 밥은 먹고 다니는겨~ 잘지내는겨 대뜸 그러시는 거에요 내가 말도 하기도 전해 그래서 저는 야구좀 안되지만 잘하고 있다고 여기사람들 잘챙겨준다고 라고 거짓말을 했어요 한국은 못가게 됬지 내일 야구장은 가야하지 막막하더라구요 그럼 어떻게 가야하나 생각을 했어요 그리고 나서 영어공부를 하게 됬는데요...
          </div> 
          <div class="text-center">
            닉네임
          </div>
        </div>

      </div>
    </section>
    <jsp:include page="footer.jsp" flush="false" />
</section>
</body>

</html>
