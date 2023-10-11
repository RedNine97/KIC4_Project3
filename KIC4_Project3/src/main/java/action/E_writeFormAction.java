package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class E_writeFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.writeForm.jsp에 수행했던 자바코드
	 	//E_event.jsp(글쓰기)->신규글, content.jsp(글상세보기)
	 	int num=0;
	 	
	 	//content.jsp에서 매개변수가 전달 글수정을 위해서 존재하는 구문
	 	if(request.getParameter("num")!=null){//num≠null? 0(X),음수(X) 양수 1이상
	 		num=Integer.parseInt(request.getParameter("num")); //input박스에 입력되어 넘어온 값은 string인데 계산해야돼서 int로 변환
	 		System.out.println("E_event.jsp에서 넘어온 매개변수 확인"); //디버깅
	 		System.out.println("num=>"+num);
	 	}
	 	//2.실행결과->서버의 메모리에 저장->이동
	 	request.setAttribute("num", num);
	 	
		return "/E_writeForm.jsp";
	}

}
