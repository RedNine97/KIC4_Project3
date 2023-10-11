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
      <script>
    //돌고돌아 결국 alert창 선택...
    function writeAlert(){	
      if($("#b_title,#u_title").val()==""){
        alert("제목을 입력해주세요.");
        $("#b_title,#u_title").focus();
        return false;
      }
      if($('#u_title').val()=="(수정) "){
        alert("제목을 다시 입력해주세요.");
        $("#u_title").focus();
        return false;
      }
      if($("#b_content").val()==""){
        alert("내용을 입력해주세요.");
        $("#b_content").focus();
        return false;
      }
    }

    //====작업시 새로고침 신경쓰이면 이부분 주석 처리=====
    function no_save(){
      $(document).ready(() => {
        $(window).on('beforeunload', function(){
          return "저장되지 않았습니다. 그래도 종료합니까?";
        });
        $(document).on("submit", "form", function(){
          $(window).off('beforeunload');
        });
      })
    }
    //====작업시 새로고침 신경쓰이면 이부분 주석 처리=====

    //수정되는 공지사항이라면 제목을 (수정)으로 바꾸고 시작하도록
    $(document).ready(() => {
        $('#u_title').val("(수정) ${article.subject}"); 
    })
  </script>
    <style>
    /* 이쪽 스타일 시트는 아마 사용하지 않을듯(css파일관리 등 문제) 
    공지사항 작성페이지와 다른점을 고민하다가 실험삼아 넣어봤으니 사용해봐도 됨. 
    기능:textarea 스크롤바 색상바꾸기 */
      /*
      .area_scroll::-webkit-scrollbar {
          width: 10px;
      }

      .area_scroll::-webkit-scrollbar-thumb {
          height: 30%; 
          background: #3763eb;        
          border-radius: 4px;
      }

      .area_scroll::-webkit-scrollbar-track {
          background: rgba(33, 122, 244, .1);
      }
      */
      /* 이쪽 스타일 시트는 아마 사용하지 않을듯(css파일관리 등 문제)*/
  </style>
    <title>공지사항 수정</title>
</head>
<body onload="no_save()">
<jsp:include page="top.jsp" flush="false" />
	
    <div class="bg-blue-500 text-white font-bold text-center md:text-left md:pl-20 md:text-2xl content-center h-16 md:h-24 grid text-xl">
      <div >
        공지사항 수정
      </div>
    </div>
  <!-- 공지사항 수정 form start-->
  <form class="grid" name="noticeUpdate" action="./noticeUpdatePro.shop" method="get" onsubmit="return writeAlert();">
    <!-- 페이지 흐름때문에 method="get" 상태임, 추신 : 작업시 새로고침때 경고창 신경쓰이면 위 스크립트 부분 주석 처리 -->
    
    <input type="hidden" name="num" value="${article.noticeno}">
	<input type="hidden" name="pageNum" value="${pageNum}">
			
    <div class="place-self-center w-3/4">
      <div class="hidden md:block mt-4 text-xl font-bold">
        제목
      </div>
        <input class="placeholder:italic placeholder:text-slate-400 md:placeholder:text-white block bg-white w-full border border-slate-300 rounded-md my-4 py-2 pl-5 pr-3 shadow-sm focus:outline-none focus:border-blue-600 focus:ring-blue-600 focus:ring-1 sm:text-sm" 
        		  placeholder="제목" type="text" name="subject" id="u_title" autofocus maxlength=""/>
    </div>
    <!-- 공지사항 작성 페이지와 다르게 제목에 (수정)이라는 글자로 바꿈 -->
    <div class="place-self-center w-3/4">
      <div class="hidden md:block mt-2 text-xl font-bold">
        내용
      </div>
      <textarea class="area_scroll h-64 md:h-screen resize-none placeholder:italic placeholder:text-slate-400 md:placeholder:text-white block w-full bg-white border border-slate-300 rounded-md my-2 py-2 pl-5 pr-3 shadow-sm focus:outline-none focus:border-blue-600 focus:ring-blue-600 focus:ring-1 sm:text-sm" 
      			    placeholder="내용을 작성해주세요." name="content" id="b_content">${article.content}</textarea>
    </div>
    <!-- 위 부분(textarea 내부) 글자 삭제후 사용 -->

      <div class="grid grid-cols-2 justify-items-stretch md:grid-cols-3 px-4 py-3 text-center sm:px-6">
        <button type="button" class="col-span-1 md:w-28 md:order-2 md:col-end-auto md:justify-self-end rounded-md border border-blue-700 bg-white py-2 px-6 text-lg md:text-sm font-medium text-blue-700 shadow-sm hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-0 mx-2 my-2" 
        			 onClick="location.href='./noticeList.shop'">
          목록으로
        </button>
        <button type="submit" class="col-span-1 md:w-28 md:order-1 md:col-start-2 md:justify-self-center rounded-md border border-transparent bg-blue-700 py-2 px-6 md:text-sm font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 mx-2 my-2">
        수정하기</button>         
      </div>
    </div>
  </form>
  <!-- 공지사항 수정 form end-->
  
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>