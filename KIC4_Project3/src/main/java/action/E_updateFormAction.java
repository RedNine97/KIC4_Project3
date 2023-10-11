package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDAO;
import member.E_BoardDTO;

public class E_updateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//E_content.jsp=>글수정하기버튼 클릭=>E_updateForm.jsp?num=3&page=1
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("E_updateForm.jsp의 num=>"+num+", pageNum=>"+pageNum);
		E_BoardDAO bdPro = new E_BoardDAO(); //메서드 호출목적
		E_BoardDTO article = bdPro.getArticle(num);//조회수 증가x

		request.setAttribute("eventno", num);//${num}
		request.setAttribute("pageNum", pageNum);//${pageNum}
		request.setAttribute("article", article);
		
		return "/E_updateForm.jsp";
	}

}
