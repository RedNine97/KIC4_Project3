package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;
import notice.NoticeDTO;

public class N_noticeReadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println("N_noticeReadAction의 pageNum=>"+pageNum+",num=>"+num);
		NoticeDAO ndao=new NoticeDAO();
		NoticeDTO article=ndao.getArticle(num);
		
		int x=0;
		//매니저인지 체크하는 부분
		x=ndao.checkManager();
		System.out.println("N_noticeReadAction의 최종 x="+x);
		
		//2.처리한 결과를 서버의 메모리에 저장->request에 저장->jsp 에서 ${키명} 불러오기
		request.setAttribute("num", num);//${num}
		request.setAttribute("pageNum", pageNum);//${pageNum}
		request.setAttribute("article", article);//${article.num}~
		request.setAttribute("checkManager", x);
		
		return "/N_noticeRead.jsp";
	}

}
