package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.E_BoardDAO;

public class E_deleteProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		//추가(삭제된 게시물 페이지로 이동시키기 위해서)
		String pageNum=request.getParameter("pageNum");
		//추가2
		String passwd=request.getParameter("passwd");//입력을 통해서 넘김
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println("E_deleteProcAction에서의 pageNum=>"+pageNum+",num=>"+num+",passwd=>"+passwd);
		//-----------------------------------------------------
		E_BoardDAO dbPro=new E_BoardDAO();
		int check=dbPro.deleteArticle(num,passwd);//1->성공 0->실패
		
		//2개이 공유값이 필요
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/E_deleteProc.jsp";
	}

}
