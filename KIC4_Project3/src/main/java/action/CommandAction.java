package action;

/*
 * 기능은 다르지만 요청을 받아서 처리해주는 메서드를 
 * 공통의 메서드로 작성하기 위해서 만든 인터페이스
 * 
 * 스프링에서는 ModelAndView를 대신 사용할 예정이다.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {

	public String requestPro(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable;
	//모든 클래스가 이 메서드를 무조건 상속받아서 만들도록 설계하면, 
	//기능은 달라도 메서드 이름은 통일시켜서 편리하다.
}