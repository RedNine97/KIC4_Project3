package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class U_KakaoLogErrorAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String age_range = request.getParameter("age_range");
		System.out.println("카카오 로그인 에러 age_range=>"+age_range);
		request.setAttribute("age_range", age_range);
		return "/U_KakaoLogError.jsp";
	}

}
