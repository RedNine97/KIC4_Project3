package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;
import member.U_RegisterDTO;
import member.ZipcodeDTO;

public class U_SearchIdProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String memname=request.getParameter("memname");
		String email=request.getParameter("email");
		String randomKey=request.getParameter("randomKey");
		String userkey=request.getParameter("userkey");
		System.out.println("randomKey=>"+randomKey);
		System.out.println("userkey=>"+userkey);
		
		//배열로 받은 이유는 한 사용자가 계정을 여러개 가질 수도 있기 때문이다.
		U_MemberDAO memDao = new U_MemberDAO();
		ArrayList<U_RegisterDTO> searchId = memDao.searchId(memname,email);
		int totalList = searchId.size();//검색갯수
		System.out.println("searchId=>"+searchId);
		
		request.setAttribute("searchId", searchId);
		request.setAttribute("totalList", totalList);
		request.setAttribute("memname", memname);
		request.setAttribute("email", email);
		
		return "/U_SearchIdProc.jsp";
	}

}
