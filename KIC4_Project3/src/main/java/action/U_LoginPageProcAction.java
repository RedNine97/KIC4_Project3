package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemLoginDTO;
import member.U_MemberDAO;

public class U_LoginPageProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//LoginPage.shop에 의한 LoginPage.jsp에서 값이 넘어옴.
				String memid=request.getParameter("memid");
				String pwd=request.getParameter("pwd");
				
				System.out.println("memid=>"+memid);
				System.out.println("pwd=>"+pwd);//경로확인
				U_MemberDAO memDao = new U_MemberDAO();
				boolean loginCheck = memDao.loginCheck(memid,pwd);
				
				request.setAttribute("loginCheck", loginCheck);
				request.setAttribute("memid", memid);
				request.setAttribute("pwd", pwd);
				 
				return "/U_LoginPageProc.jsp";
	}

}