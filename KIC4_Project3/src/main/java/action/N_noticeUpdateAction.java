package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;
import notice.NoticeDTO;

public class N_noticeUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		NoticeDAO ndao=new NoticeDAO();
		NoticeDTO article=ndao.updateGetArticle(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return "/N_noticeUpdate.jsp";
	}

}
