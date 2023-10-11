package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class N_noticeWriteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num=0;
		
		if(request.getParameter("num")!=null){
	 		num=Integer.parseInt(request.getParameter("num")); 
	 		System.out.println("N_noticeList.jsp에서 넘어온 매개변수 확인");
	 		System.out.println("num=>"+num);
	 	}
		
		request.setAttribute("num", num);
		
		return "/N_noticeWrite.jsp";
	}

}
