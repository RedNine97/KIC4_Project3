package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;
import member.U_RegisterDTO;

public class U_SearchPwdUpdateProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String memid=request.getParameter("memid");
		String pwd=request.getParameter("pwd");
		
		U_MemberDAO memDao = new U_MemberDAO();
		boolean PwdUpCheck=memDao.pwdSearchUpdate(memid,pwd);
		
		request.setAttribute("PwdUpCheck", PwdUpCheck);
		
		return "/U_SearchPwdUpdateProc.jsp";
	}

}
