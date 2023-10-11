<%@page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="memDao" class="member.MemberDAO"/>
<%
boolean loginReset = memDao.loginReset();
System.out.println("초기화=>"+loginReset);

response.sendRedirect(request.getContextPath()+"/M_mainpage.shop");
%>
