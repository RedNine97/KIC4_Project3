package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDAO;
import member.E_BoardDTO;

public class E_deleteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//deleForm.do?num=2&pageNum=1 ---> deleteProc.do(deleteArticle())
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("deleteForm.do의 num=>"+num+", pageNum=>"+pageNum);	
		
		E_BoardDAO dbPro=new E_BoardDAO();
		E_BoardDTO article=dbPro.getArticle(num);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=dbPro.checkManager();
		System.out.println("E_eventAction의 최종 x="+x);

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);//${article.num}~
		request.setAttribute("checkManager", x);
		
		return "/E_deleteForm.jsp"; 
												
	}

}
