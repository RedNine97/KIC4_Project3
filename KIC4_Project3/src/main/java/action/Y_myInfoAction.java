package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Y_BoardDAO;
import member.Y_BoardDTO;

//요청받아서 처리해주는 클래스(액션클래스)->실행결과->컨트롤러->jsp
public class Y_myInfoAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//소스를 변경해도 바로 반영X->서버에서 기본적으로 전의 페이지를 불러오기때문에
		response.setHeader("Cache-Control","no-cache");//메모리 저장X
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires",0);
		
		// 로그인하면서 session에 저장한 데이터
		HttpSession session = request.getSession(true);
		String  memid=(String)session.getAttribute("memid");
		System.out.println("myInfoAction의 값확인=>memid="+memid);
		Y_BoardDAO dbPro=new Y_BoardDAO();
		Y_BoardDTO article=dbPro.getMemberInfo(memid);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=dbPro.checkManager();

		request.setAttribute("memid", memid);
		request.setAttribute("article", article);
		request.setAttribute("checkManager", x);
		
		return "/Y_myInfo.jsp";
	}
}
