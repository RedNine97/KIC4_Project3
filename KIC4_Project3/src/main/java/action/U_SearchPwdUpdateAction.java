package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;
import member.U_RegisterDTO;

public class U_SearchPwdUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String memid=request.getParameter("memidDb");
		String emailDb=request.getParameter("emailDb");
		
		//memid로 검색한 memid가 있다면 RegisterDTO에 담는다.
		U_MemberDAO memDao = new U_MemberDAO();
		U_RegisterDTO searchPwd=memDao.searchPwd(memid);
		
		request.setAttribute("memid", memid);
		request.setAttribute("searchPwd", searchPwd);
		
		return "/U_SearchPwdUpdate.jsp";
	}

}
