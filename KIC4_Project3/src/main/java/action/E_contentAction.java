package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDAO;
import member.E_BoardDTO;

//요청받아서 처리해주는 클래스(액션클래스)->실행결과->컨트롤러->jsp
public class E_contentAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// E_event.jsp에서 넘어온 데이터->num,pageNum
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println("ContentAction의 pageNum=>"+pageNum+",num=>"+num);
		E_BoardDAO dbPro=new E_BoardDAO();
		E_BoardDTO article=dbPro.getArticle(num);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=dbPro.checkManager();
		System.out.println("E_eventAction의 최종 x="+x);
		
		//2.처리한 결과를 서버의 메모리에 저장->request에 저장->jsp 에서 ${키명} 불러오기
		request.setAttribute("num", num);//${num}
		request.setAttribute("pageNum", pageNum);//${pageNum}
		request.setAttribute("article", article);//${article.num}~
		request.setAttribute("checkManager", x);
		
		return "/E_content.jsp";
	}
}
