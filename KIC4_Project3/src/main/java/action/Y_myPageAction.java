package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Y_BoardDAO;
import member.Y_BoardDTO;

//요청받아서 처리해주는 클래스(액션클래스)->실행결과->컨트롤러->jsp
public class Y_myPageAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 로그인하면서 session에 저장한 데이터
		HttpSession session = request.getSession(true);
		String  memid=(String)session.getAttribute("memid");
		System.out.println("mypageAction의 값확인=>memid="+memid);
		Y_BoardDAO dbPro=new Y_BoardDAO();
		Y_BoardDTO article=dbPro.getMemberInfo(memid);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=dbPro.checkManager();
		//int loginCheck = dbPro.loginCheck(memid);
		//System.out.println("logincheck의 값 확인=>"+loginCheck);
		
		
		//request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("memid", memid);
		request.setAttribute("article", article);
		request.setAttribute("checkManager", x);
		
		return "/Y_myPage.jsp";
	}
}
