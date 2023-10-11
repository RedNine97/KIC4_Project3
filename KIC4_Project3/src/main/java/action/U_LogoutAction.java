package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;

public class U_LogoutAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//세션 연결상태 => 바로 종료 => 메모리상의 데이터를 삭제
		String access_Token=request.getParameter("access_Token");
		System.out.println("access_Token=>"+access_Token);
		
		String memid=request.getParameter("memid");
		System.out.println("memid=>"+memid);
		
		U_MemberDAO memDao = new U_MemberDAO();
		boolean LogoutMemLogin = memDao.deleteMemLogin(memid);
		
		request.setAttribute("LogoutMemLogin", LogoutMemLogin);
		request.setAttribute("access_Token", access_Token);
		
		return "/U_Logout.jsp";
	}

}
