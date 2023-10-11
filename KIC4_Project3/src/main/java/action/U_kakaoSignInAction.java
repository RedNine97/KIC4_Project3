package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;

public class U_kakaoSignInAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String memid=request.getParameter("memid");
		String thumbnail_image=request.getParameter("thumbnail_image");
		String access_Token=request.getParameter("access_Token");
		System.out.println("memid=>"+memid);
		
		U_MemberDAO memDao = new U_MemberDAO();
		boolean loginCheck = memDao.memloginSuc(memid);
		
		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("memid", memid);
		request.setAttribute("thumbnail_image", thumbnail_image);
		request.setAttribute("access_Token", access_Token);
		
		return "/U_kakaoSignIn.jsp";
	}

}
