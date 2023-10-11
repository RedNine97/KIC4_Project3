<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.Y_BoardDAO,javax.servlet.http.HttpSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="dbPro" class="member.Y_BoardDAO" />
<%
String  memid=(String)session.getAttribute("memid");
String  thumbnail_image=(String)session.getAttribute("thumbnail_image");
String access_Token=(String)session.getAttribute("access_Token");
int logincheck=dbPro.loginCheck(memid);
System.out.println("memid => "+memid+", logincheck=>"+logincheck+", access_Token=>"+access_Token);
%>

    <header aria-label="Site Header" class="bg-white sticky shadow-sm top-0 z-10  backdrop-blur-sm	bg-white/90">
        <div
          class="mx-auto flex h-16 max-w-screen-2xl items-center gap-8 sm:px-6 lg:px-40"
        >
          <a class="block text-teal-600 flex items-center" href="./M_mainpage.shop">
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
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="./product.shop">
                    전체상품
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="./productBest.shop">
                    베스트
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="./E_event.shop">
                    이벤트
                  </a>
                </li>
      
                <li>
                  <a class="text-gray-900 transition hover:text-gray-500/75" href="./noticeList.shop">
                    공지사항
                  </a>
                </li>
      
              </ul>
            </nav>
      
            <div class="flex items-center gap-4">
              <div class="flex gap-4">
              <%if (logincheck==1) {%>
                <a
                  class="block px-1 py-2.5 text-sm font-medium text-gray-700 transition hover:text-gray-500"
                  href="./Y_myPage.shop"
                >
                  마이페이지
                </a>
                <%} %>
      
                <!-- memlogin 정보가 없을 때 -->
	    	    <%if (logincheck==0) {%>
                <a
                class="block px-1 py-2.5 text-sm font-medium text-gray-700 transition hover:text-gray-500"
                  href="./U_LoginPage.shop"
                >
                  로그인
                </a>
				<!-- memlogin 정보가 있을 때  -->
	    	    <%}else if(logincheck==1){ %>
	    	    
                <a
				class="block px-1 py-2.5 text-sm font-medium text-gray-700 transition hover:text-gray-500"
				href="U_Logout.shop?memid=${memid}&access_Token=${access_Token}">
                  로그아웃
  				 </a>
  				 	<% if(thumbnail_image !=null) { 	%>			 
  				 	<img src="${thumbnail_image}" class="rounded-full w-11 h-11 outline hover:outline-offset-1 outline-violet-300/50 ">
  				 		  <%} %>
  				 <%} %>
  				 
  				   
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