package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;
import notice.NoticeDTO;

public class N_noticeDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		NoticeDAO ndao=new NoticeDAO();
		NoticeDTO article=ndao.updateGetArticle(num);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=ndao.checkManager();
		System.out.println("N_noticeDeleteAction의 최종 x="+x);

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		request.setAttribute("checkManager", x);

		return "/N_noticeDelete.jsp";
	}

}
