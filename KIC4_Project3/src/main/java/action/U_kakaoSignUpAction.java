package action;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import member.U_MemberDAO;
import member.U_RegisterDTO;

public class U_kakaoSignUpAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String memid = request.getParameter("memid");
		String memname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String thumbnail_image = request.getParameter("thumbnail_image");
		
		U_RegisterDTO regDTO = new U_RegisterDTO();
		
		regDTO.setMemid(request.getParameter("memid"));
		regDTO.setMemname(memname);
		regDTO.setEmail(request.getParameter("email"));
		regDTO.setEnrolldate(new Timestamp(System.currentTimeMillis()));
		
		U_MemberDAO memDao = new U_MemberDAO();
		boolean checkSignUp = memDao.kakaoInsert(regDTO);
		
		if(checkSignUp==false){
        	return "/U_LogError.shop";
        }

		request.setAttribute("memid", memid);
		request.setAttribute("thumbnail_image", thumbnail_image);
		
		//바로 로그인하러 가기
		return "/U_kakaoSignIn.shop";
	}

}
