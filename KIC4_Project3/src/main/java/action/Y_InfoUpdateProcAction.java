package action;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.RegisterDTO;
import member.Y_BoardDAO;
import member.Y_BoardDTO;

public class Y_InfoUpdateProcAction implements CommandAction {
	//요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//소스를 변경해도 바로 반영X->서버에서 기본적으로 전의 페이지를 불러오기때문에
		response.setHeader("Cache-Control","no-cache");//메모리 저장X
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires",0);
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		// 로그인하면서 session에 저장한 데이터
		HttpSession session = request.getSession(true);
		String  memid=(String)session.getAttribute("memid");
		String passwd=request.getParameter("pwd");
		System.out.println("myInfoAction의 값확인=>memid="+memid+", pwd=>"+passwd);
		Y_BoardDAO dbPro=new Y_BoardDAO();
		//Y_BoardDTO article=dbPro.getMemberInfo(memid);
		
		//빈즈객체를 생성 ->확인용 
	    RegisterDTO regDTO = new RegisterDTO();
	    
	    regDTO.setNickname(request.getParameter("nickname"));
	    regDTO.setEmail(request.getParameter("email"));
	    regDTO.setMphone(request.getParameter("mphone"));
	    regDTO.setZipcode(request.getParameter("zipcode"));
	    regDTO.setAddr(request.getParameter("addr"));
	    
	    
	    boolean check=dbPro.memberUpdate(regDTO,passwd,memid);//회원수정메서드 호출
	    System.out.println("InfoUpdateProc.jsp의 회원수정유무(check)=>"+check);
	    
	    request.setAttribute("check", check);
	    request.setAttribute("regDTO", regDTO);
	    
	    
    return "/Y_InfoUpdateProc.jsp";
	}
}