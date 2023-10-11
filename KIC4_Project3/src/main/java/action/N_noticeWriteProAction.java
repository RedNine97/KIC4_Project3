package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;
import notice.NoticeDTO;

public class N_noticeWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		NoticeDTO article=new NoticeDTO();
		
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));			
		article.setImgpath(request.getParameter("imgpath"));
		article.setNoticedate(new Timestamp(System.currentTimeMillis()));
		
		NoticeDAO ndao=new NoticeDAO();
		ndao.insertArticle(article);
		
		return "/N_noticeWritePro.jsp";
	}

}
