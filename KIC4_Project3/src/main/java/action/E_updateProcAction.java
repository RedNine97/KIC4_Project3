package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDAO;
import member.E_BoardDTO;

public class E_updateProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//추가(수정된 게시물로 페이지를 이동시키기 위해서
		String pageNum=request.getParameter("pageNum");
		System.out.println("E_UpdateProAction에서의 pageNum=>"+pageNum);
		//-----------------------------------------------------
		E_BoardDTO article=new E_BoardDTO();
		
		
		article.setEventno(Integer.parseInt(request.getParameter("num")));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setEventstart(request.getParameter("eventstart"));
		article.setEventend(request.getParameter("eventend"));
		  
		article.setImg_main(request.getParameter("file_main"));
		article.setImgpath(request.getParameter("file_pc"));
		article.setImgpath2(request.getParameter("file_mobile"));
		 
		
		//DTO저장 끝
		E_BoardDAO dbPro=new E_BoardDAO();
		int check=dbPro.updateArticle(article);//1->성공 0->실패
		
		//2개의 공유값이 필요
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		
		
		return "/E_updateProc.jsp";
	}

}
