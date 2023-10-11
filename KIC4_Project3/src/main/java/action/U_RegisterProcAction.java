package action;

import java.sql.Timestamp;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.U_RegisterDTO;
import member.ZipcodeDTO;

public class U_RegisterProcAction implements CommandAction
{
	//요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request,
		                     HttpServletResponse response)
		                     throws Throwable{
		
		 //한글처리
		   request.setCharacterEncoding("utf-8");
		 
		 //빈즈객체를 생성 ->확인용 
	    U_RegisterDTO regDTO = new U_RegisterDTO();
	    System.out.println("regDTO="+regDTO);
	    String mphone="";
	    mphone = request.getParameter("number");
	    mphone	+=request.getParameter("mphone");
	    
	    regDTO.setMemid(request.getParameter("memid"));
	    regDTO.setMemname(request.getParameter("memname"));
	    regDTO.setBirthday(request.getParameter("birthday"));
	    regDTO.setEmail(request.getParameter("email"));
	    regDTO.setMphone(mphone);
	    regDTO.setNickname(request.getParameter("nickname"));
	    regDTO.setEnrolldate(new Timestamp(System.currentTimeMillis()));
	    regDTO.setPwd(request.getParameter("pwd"));
	    regDTO.setAddr(request.getParameter("addr"));
	    regDTO.setZipcode(request.getParameter("zipcode"));
	    
	    request.setAttribute("regDTO", regDTO);
    return "/U_RegisterProc.jsp";
	}
}