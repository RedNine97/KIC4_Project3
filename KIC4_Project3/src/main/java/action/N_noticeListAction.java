package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDAO;

public class N_noticeListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pageNum=request.getParameter("pageNum"); 
		String search=request.getParameter("search");  
		String searchtext=request.getParameter("searchtext");   
		System.out.println("N_noticeListAction 의 매개변수 확인");
		System.out.println("pageNum="+pageNum+",search="+search+",searchtext="+searchtext);
		
		int count=0;//총레코드수
		List articleList=null;//화면에 출력할 레코드를 저장할 변수
		
		NoticeDAO ndao=new NoticeDAO();
		
		count=ndao.getArticleSearchCount(search, searchtext);
		System.out.println("ListAction의 현재 레코드수(count)=>"+count);
		
		//1.화면에 출력할 페이지번호, 2.출력할 레코드 갯수
		Hashtable<String,Integer> pgList=ndao.pageList(pageNum, count);
		if(count > 0){
		    System.out.println("N_noticeListAction의 "+pgList.get("startRow")+","+pgList.get("endRow"));
		    articleList=ndao.getBoardArticles(pgList.get("startRow"), pgList.get("pageSize"),search,searchtext);//첫번째 레코드번호,불러올 갯수
		}else { //count=0
		    articleList=Collections.EMPTY_LIST;//아무것도 없는 빈 list객체 반환
		}			
				
		int x=0;
		//매니저인지 체크하는 부분
		x=ndao.checkManager();
		System.out.println("N_noticeListAction의 최종 x="+x);
		
		//2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용
		request.setAttribute("search", search);//검색분야
		request.setAttribute("searchtext", searchtext);//검색어
		request.setAttribute("pgList", pgList);//페이징처리 10개 정보저장
		request.setAttribute("articleList", articleList);
		
		request.setAttribute("checkManager", x);
		
		return "/N_noticeList.jsp";
	}

}
