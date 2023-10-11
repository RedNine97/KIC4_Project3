package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;

public class U_IdCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//scrip.js->memid값을 받아서 처리
		
		   String memid = request.getParameter("memid");
		   System.out.println("memid="+memid);
		 
		   //중복id체크 메서드 호출
		   U_MemberDAO memDao = new U_MemberDAO();
		   boolean check = memDao.checkId(memid);
		
		   request.setAttribute("memid", memid);
		   request.setAttribute("check", check);
		   
		return "/U_IdCheck.jsp";
	}

}
