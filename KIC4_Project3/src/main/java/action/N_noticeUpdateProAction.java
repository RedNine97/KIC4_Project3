package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;
import notice.NoticeDTO;

public class N_noticeUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		NoticeDTO article=new NoticeDTO();
		
		article.setNoticeno(Integer.parseInt(request.getParameter("num")));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setImgpath(request.getParameter("imgpath"));
			    
	    NoticeDAO ndao=new NoticeDAO();
	    int check=ndao.updateArticle(article);
	    
	    request.setAttribute("num", num);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("check", check);
			    
		return "/N_noticeUpdatePro.jsp";
	}

}
