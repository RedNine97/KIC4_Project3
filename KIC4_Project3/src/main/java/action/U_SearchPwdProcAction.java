package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;
import member.U_RegisterDTO;

public class U_SearchPwdProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String memid=request.getParameter("memid");
		
		//memid로 검색한 memid가 있다면 꺼내온 데이터를 RegisterDTO에 담는다.
		U_MemberDAO memDao = new U_MemberDAO();
		U_RegisterDTO searchPwd=memDao.searchPwd(memid);
		
		request.setAttribute("searchPwd", searchPwd);
		
		return "/U_SearchPwdProc.jsp";
	}

}
