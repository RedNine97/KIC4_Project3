package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_MemberDAO;

public class U_kakaoLoginCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		   String memid = request.getParameter("memid");
		   String email = request.getParameter("email");
		   String nickname = request.getParameter("nickname");
		   String age_range = request.getParameter("age_range");
		   String thumbnail_image = request.getParameter("thumbnail_image");
		   String access_Token = request.getParameter("access_Token");
		   System.out.println("memid="+memid);
		   System.out.println("age_range="+age_range);
		   
		   //성인사이트(술 때문)이기 때문에 나이가 안돼는 연령대는 가입할 수 없다.
		   char charValue = age_range.charAt(0);
		   System.out.println("charValue="+charValue);
		   if (charValue=='1') {
			   return "/U_KakaoLogError.shop?age_range="+age_range;
		   }
		   
		   //중복id체크 메서드 호출
		   U_MemberDAO memDao = new U_MemberDAO();
		   boolean check = memDao.checkId(memid);
		
		   request.setAttribute("check", check);
		   request.setAttribute("memid", memid);
		   request.setAttribute("email", email);
		   request.setAttribute("nickname", nickname);
		   request.setAttribute("age_range", age_range);
		   request.setAttribute("thumbnail_image", thumbnail_image);
		   request.setAttribute("access_Token", access_Token);
		
		return "/U_kakaoLoginCheck.jsp";
	}

}
