package action;

//DB관련 날짜,시간
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDTO;
//추가
import member.E_BoardDAO;

public class E_writeProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("E_writeProcAction실행 확인");
		request.setCharacterEncoding("utf-8");

		E_BoardDTO article=new E_BoardDTO();
		
		//article.setEventno(Integer.parseInt(request.getParameter("num")));
		article.setSubject(request.getParameter("subject"));
		//readcount(0)->default 9개에서 readcount는 자동으로 반영, 날짜, 원격ip주소
		article.setEventdate(new Timestamp(System.currentTimeMillis())); //날짜는 액션태그로 호출불가-> 오늘날짜 계산해서 수동으로 저장	
		
		article.setContent(request.getParameter("content"));
		article.setEventstart(request.getParameter("eventstart"));
		article.setEventend(request.getParameter("eventend"));
		
		
		article.setImg_main(request.getParameter("file_main"));
		article.setImgpath(request.getParameter("file_pc"));
		article.setImgpath2(request.getParameter("file_mobile"));
		
		//DTO저장 끝
		E_BoardDAO dbPro=new E_BoardDAO();
		dbPro.insertArticle(article);
		
		return "/E_writeProc.jsp";
	}

}
