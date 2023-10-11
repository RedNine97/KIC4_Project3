//Login.jsp에서 처리했던 자바코드를 여기서 처리한다. --> 처리 결과를 request객체에 저장한다. --> 컨트롤러가 전달받아서 Login.jsp에 전달한다.
//JspBoard2의 ListAction.java
package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

//login.jsp에서 작업한 자바코드는 LoginAction에서 처리한다.
//login.jsp는 결과를 뿌려주는 프론트 역할만 한다. 
//자바코드에 관련된 메서드를 호출한다던지 이런 부분들은 LoginAction컨트롤러가 한다. (명령어처리클래스)

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import member.E_BoardDAO;


public class E_eventAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1. /list.do에서 search,searchtext도 매개변수로 처리
		/*
		HttpSession session = request.getSession(true);
		String  memid=(String)session.getAttribute("memid");
		System.out.println("memid세션확인!!!!!!!!!!!!!!"+memid);
		*/
		String pageNum=request.getParameter("pageNum"); 
		//추가(검색분야,검색어)
		String search=request.getParameter("search");//검색분야  
		String searchtext=request.getParameter("searchtext");   
		System.out.println("E_eventAction의 매개변수 확인");
		System.out.println("pageNum="+pageNum+",search="+search+",searchtext="+searchtext);
		int count=0;//총레코드수
		List articleList=null;//화면에 출력할 레코드를 저장할 변수
		
		E_BoardDAO dbPro=new E_BoardDAO();
		
		count=dbPro.getArticleSearchCount(search, searchtext);//sql구문에 따라라서 결과 달라짐
		System.out.println("ListAction의 현재 레코드수(count)=>"+count);
		
		//1.화면에 출력할 페이지번호, 2.출력할 레코드 갯수
		Hashtable<String,Integer> pgList=dbPro.pageList(pageNum, count);
		if(count > 0){
		    System.out.println("E_eventAction의 "+pgList.get("startRow")+","+pgList.get("endRow"));
		    articleList=dbPro.getBoardArticles(pgList.get("startRow"), pgList.get("pageSize"),search,searchtext);//첫번째 레코드번호,불러올 갯수
		}else { //count=0
		    articleList=Collections.EMPTY_LIST;//아무것도 없는 빈 list객체 반환
		}
		
		
		int x=0;
		//매니저인지 체크하는 부분
		x=dbPro.checkManager();
		System.out.println("E_eventAction의 최종 x="+x);
		//2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용
		request.setAttribute("search", search);//검색분야
		request.setAttribute("searchtext", searchtext);//검색어
		request.setAttribute("pgList", pgList);//페이징처리 10개 정보저장
		request.setAttribute("articleList", articleList);
		
		request.setAttribute("checkManager", x);
		
		//3.공유해서 이동할 수 있도록 페이지를 지정
		return "/E_event.jsp";
	}

}
