package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;

public class N_noticeDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		String passwd=request.getParameter("passwd");						
		
		NoticeDAO ndao=new NoticeDAO();
		int check=ndao.deleteArticle(num,passwd);//1->성공 0->실패
		
		//2개이 공유값이 필요
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
	
		return "/N_noticeDeletePro.jsp";

	}

}
