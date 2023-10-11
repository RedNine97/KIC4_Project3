package notice;

import java.sql.*;
import java.util.*;

import member.DBConnectionMgr;

public class NoticeDAO {
	
	//DB연결
	private DBConnectionMgr pool=null; 
		
	private Connection con=null;  
	private PreparedStatement pstmt=null; 
	private ResultSet rs=null;
	private String sql="";
			
	public NoticeDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		} catch(Exception e) {
			System.out.println("DB연결 실패 => "+e);
		}		
	}
		
	//관리자로 로그인했는지 체크
	public int checkManager() {
		int x=0;
		String managerid="";
		String memid="";
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select * from manager";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				managerid=rs.getNString("managerid");
			}
			System.out.println("checkManager()의 managerid=>"+managerid);
			
			sql="select * from memlogin";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memid=rs.getNString("memid");
			}
			System.out.println("checkManager()의 memid=>"+memid);
			
			if(managerid.contentEquals(memid)) {
				x=1;
				System.out.println("contentEquals 실행 확인, x=>"+x);
			}
		}catch(Exception e) {
			System.out.println("checkManager() 에러발생=>"+e);
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("최종 x=>"+x);
		return x;	//관리자면 x=1, 아니면 x=0
	}
	
	//1. 페이징처리를 하기 위해서는 전체 레코드 수를 반드시 구해와야한다. 
	public int getArticleCount() {
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getArticleCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//1.검색어에 해당되는 총레코드수를 구하는 메서드(검색분야,검색어)
	public int getArticleSearchCount(String search, String searchtext) {
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			if(search==null || search=="") {
				sql="select count(*) from notice";
			}else {
				if(search.equals("subject_content")) {//제목+본문
					sql="select count(*) from notice where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%' ";
				}else {
					sql="select count(*) from notice where "+search+" like '%"+searchtext+"%' ";
				}
			}
			System.out.println("getArticleSearchCount 검색sql=>"+sql);
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getArticleSearchCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	//2. 글 목록보기에 대한 메서드 구현 =>한페이지당10개씩 잘라서 보여주는 메서드가 필요함
	public List<NoticeDTO> getArticles(int start,int end) {
		List<NoticeDTO> articleList=null;
		
		try {
			con=pool.getConnection();
			sql = "SELECT * FROM (SELECT rownum AS RNUM, NOTICENO, MANAGERID, SUBJECT, CONTENT, IMGPATH , COUNT, NOTICEDATE FROM (select * from notice order by noticeno desc)) WHERE RNUM >= ? AND RNUM < ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, start-1+end);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				articleList=new ArrayList(end);
				do {
					NoticeDTO article=new NoticeDTO(); //회원리스트면 MemberDTO
					article=makeArticleFromResult();
					//추가
					articleList.add(article);//생략하면 데이터 저장X => for문X(Null)
				}while(	rs.next());//더 있으면 계속
			}
		}catch(Exception e) {
			System.out.println("getArticles() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList;
	}
				 
	
	
	//2)검색어에 따른 레코드의 범위지정
	public List<NoticeDTO> getBoardArticles(int start,int end,String search,String searchtext) {
		List<NoticeDTO> articleList=null;
		try {
			con=pool.getConnection();
			if(search==null || search=="") {
				sql = "SELECT * FROM (SELECT rownum AS RNUM, NOTICENO, MANAGERID, SUBJECT, CONTENT, IMGPATH , COUNT, NOTICEDATE FROM (select * from notice order by noticeno desc)) WHERE RNUM >= ? AND RNUM < ?";
			}else {
				if(search.equals("subject_content")) {
					sql = "SELECT * FROM (SELECT rownum AS RNUM, NOTICENO, MANAGERID, SUBJECT, CONTENT, IMGPATH , COUNT, NOTICEDATE FROM (select * from notice WHERE SUBJECT LIKE '%"+searchtext+"%' OR content LIKE '%"+searchtext+"%' order by noticeno desc)) WHERE RNUM >= ? AND RNUM < ?";
				}else {
					sql = "SELECT * FROM (SELECT rownum AS RNUM, NOTICENO, MANAGERID, SUBJECT, CONTENT, IMGPATH , COUNT, NOTICEDATE FROM (select * from notice WHERE "+search+" LIKE '%"+searchtext+"%' order by noticeno desc)) WHERE RNUM >= ? AND RNUM < ?";
				}
			}
			System.out.println("getBoardArticles()의 sql=>"+sql);
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, start-1+end);
			System.out.println("start="+start+"start-1+end="+(start-1+end));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				articleList=new ArrayList(end);
				do {
					NoticeDTO article=new NoticeDTO();
					article=makeArticleFromResult();
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception e) {
			System.out.println("getBoardArticles() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList;
	}
	
	
	//(3)페이징 처리 계산
	public Hashtable pageList(String pageNum,int count) {
		
		Hashtable<String,Integer> pgList=new Hashtable<String,Integer>();
		
		int pageSize=10;
		int blockSize=5; 

		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum); 
		int startRow = (currentPage - 1) * pageSize + 1; 
		int endRow = currentPage * pageSize;
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		int number = 0;
		
		System.out.println("현재 레코드 수(count)=>" + count);
		
		number = count - (currentPage - 1) * pageSize;
		System.out.println("페이지별 number=>" + number);
		
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int startPage=0;
		if(currentPage%blockSize!=0){
			startPage=currentPage/blockSize*blockSize+1;
		}else{
			startPage=((currentPage/blockSize)-1)*blockSize+1;
		}
		int endPage=startPage+blockSize-1;
		System.out.println("startPage=>"+startPage+",endPage=>"+endPage);
		
		if(endPage>pageCount) endPage=pageCount;
		
		pgList.put("pageSize", pageSize);
		pgList.put("blockSize", blockSize);
        pgList.put("currentPage", currentPage);
        pgList.put("startRow", startRow);
        pgList.put("endRow", endRow);
        pgList.put("count", count);
        pgList.put("number", number);
        pgList.put("startPage", startPage);
        pgList.put("endPage", endPage);
        pgList.put("pageCount", pageCount);

		return pgList;
	}
	
	
	//공지사항 글쓰기
	public void insertArticle(NoticeDTO article) {
		int number=0;
		
		try {
			con=pool.getConnection();
			sql="select max(noticeno) from notice"; 
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			sql="insert into notice(noticeno,subject,content,imgpath,noticedate) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, number); 
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getImgpath());
			pstmt.setTimestamp(5, article.getNoticedate());
			
			int insert=pstmt.executeUpdate();
			System.out.println("insertArticle()의 insert=>"+insert);
		}catch(Exception e) {
			System.out.println("insertArticle() 에러발생=>"+e);
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	//글 상세보기
	public NoticeDTO getArticle(int num) {
		NoticeDTO article=null;
		try {
			System.out.println("num값=>"+num);
			con=pool.getConnection();
			sql="update notice set count=count+1 where noticeno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int update=pstmt.executeUpdate();
			System.out.println("조회수 증가(sql)=>"+sql);
			System.out.println("조회수 증가유무(update)=>"+update);
			
			sql="select * from notice where noticeno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article=makeArticleFromResult();
				
			}
		}catch(Exception e) {
			System.out.println("getArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("article=>"+article);
		
		return article;
	}
	
	private NoticeDTO makeArticleFromResult() throws Exception {//getter method
		NoticeDTO article=new NoticeDTO();

		article.setNoticeno(rs.getInt("noticeno"));
		article.setManagerid(rs.getString("managerid"));
		article.setSubject(rs.getString("subject"));
		article.setContent(rs.getString("content"));
		
		article.setImgpath(rs.getString("imgpath"));
		
		article.setCount(rs.getInt("count")); //default 0
		
		article.setNoticedate(rs.getTimestamp("noticedate"));
		
		return article;
	}
	
	
	//글 수정하기
	public NoticeDTO updateGetArticle(int num) {
		NoticeDTO article=null; 
		try {
			con=pool.getConnection();
			sql="select * from notice where noticeno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article=makeArticleFromResult();
			}
		}catch(Exception e) {
			System.out.println("updateGetArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}
	
	// 2) 수정할 메서드 작성 => 관리자 인증
	public int updateArticle(NoticeDTO article) {
		
		int x=-1;

		try {
			con=pool.getConnection();
			sql="update notice set subject=?,content=?,imgpath=? where noticeno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getImgpath());
			pstmt.setInt(4, article.getNoticeno());
			int update=pstmt.executeUpdate();
					
			System.out.println("공지사항 수정 성공유무(update)=>"+update);  //1 or 0실패
			x=1;
		}catch(Exception e) {
			System.out.println("updateArticle() 에러발생=>"+e);
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("updateArticle()의 최종 x=>"+x);
		return x; 
				
	}
	
	
	
	//글 삭제=>암호 비교
	public int deleteArticle(int num, String passwd) {
		String managerpwd="";
		int x=-1; //게시물의 삭제성공유무
		try {
			con = pool.getConnection();
			sql="select * from manager";//manager table의 모든 데이터를 불러와라
			pstmt=con.prepareStatement(sql);//pstmt에 위의 query를 저장 후 DB에 연결 준비
			rs=pstmt.executeQuery();//query 실행 후 그 결과값을 rs에 저장
			if (rs.next()) {//찾는 암호가 존재한다면?
				managerpwd = rs.getString("pwd");
				System.out.println("updateArticle()의 managerpwd=>"+managerpwd);
				
				if (managerpwd.equals(passwd)) {//managerpwd=passwd
					sql = "delete from notice where noticeno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					int delete = pstmt.executeUpdate();
					System.out.println("sql"+sql);
					System.out.println("글 삭제 성공유무(delete)=>" + delete);
					x=1;//삭제 성공
				} else {//managerpwd≠passwd
					System.out.println("입력된 암호=>" + passwd);
					x=0;//암호가 틀린 경우
				}
			}
		}catch(Exception e) {
			System.out.println("deleteArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
}
