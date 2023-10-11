package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//ArrayList, List사용
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class Y_BoardDAO {
	//1.연결할 클래스 객체선언
	private DBConnectionMgr pool=null;
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;//select는 반환값이 있기 때문에 그 반환값을 담기 위함
	private String sql=""; //실행시킬 sql구문 저장용

	//2. 생성자를 통해서 서로 연결
	public Y_BoardDAO() {
		try {
			pool=DBConnectionMgr.getInstance(); //DB연결얻어오기
		}catch(Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}
	
	//------------------------------------- 메서드 -----------------------------------------
	//매니저인지 확인하는 메서드
	public int checkManager() {
		int x=0;
		String managerid="";
		String memid="";
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);//DBConnectionMgr
			sql="select * from manager";//manager table의 모든 데이터를 불러와라
			pstmt=con.prepareStatement(sql);//pstmt에 위의 query를 저장 후 DB에 연결 준비
			rs=pstmt.executeQuery();//query 실행 후 그 결과값을 rs에 저장
			//결과값 불러오기
			if(rs.next()) {
				managerid=rs.getString("managerid");//변수명=rs.get자료형(필드명 또는 인덱스명) 
			}
			System.out.println("checkManager()의 managerid=>"+managerid);
			
			sql="select * from memlogin";//memlogin table의 모든 데이터를 불러와라
			pstmt=con.prepareStatement(sql);//pstmt에 위의 query를 저장 후 DB에 연결 준비
			rs=pstmt.executeQuery();//query 실행 후 그 결과값을 rs에 저장
			//결과값 불러오기
			if(rs.next()) {
				memid=rs.getString("memid");//변수명=rs.get자료형(필드명 또는 인덱스명) 
			}
			System.out.println("checkManager()의 memid=>"+memid);
			
			if(managerid.contentEquals(memid)) {
				x=1;
				System.out.println("contentEquals 실행확인, x=>"+x);
			}
		}catch(Exception e) {
			System.out.println("checkManager() 에러발생=>"+e);
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("최종 x=>"+x);
		return x;//로그인정보가 매니저면 x=1, 아니면 x=0
	}
	
	
	//로그인이 되었는지를 체크해주는 메서드(마이페이지 출력여부)
	public int loginCheck(String memid){
		int x=0;//로그인 여부
		try {
		    con = pool.getConnection();
		    System.out.println("con=>"+con);
		    sql="select count(*) from memlogin";
		    pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//1번 인덱스 값을 가져온다. 로그인 시 무조건 1개의 행이 있어야하니 정상값은 1, 2이상도 비정상
			}
		}catch(Exception e) {
			System.out.println("loginCheck() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//회원테이블의 정보를 가져오는 메서드
	public Y_BoardDTO getMemberInfo(String memid) {
		Y_BoardDTO article=null; //ArrayList<BoardDTO> article=null; (제너릭)
		try {
			System.out.println("getMemberInfo() memid값 넘오는지 확인=>"+memid);
			con=pool.getConnection();
			sql="select * from member where memid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article=makeMemInfoFromResult();
			}
		}catch(Exception e) {
			System.out.println("getMemberInfo() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("article=>"+article);
		
		return article;
	}
	
	
	
	//------회원테이블의 정보 set하는 메서드--------
	private Y_BoardDTO makeMemInfoFromResult() throws Exception {//getter method
		Y_BoardDTO article=new Y_BoardDTO();
		article.setGrade(rs.getString("grade"));
		article.setMemname(rs.getString("memname"));
		article.setEmail(rs.getString("email"));
		article.setMphone(rs.getString("mphone"));
		article.setNickname(rs.getString("nickname"));
		article.setAddr(rs.getString("addr"));
		article.setZipcode(rs.getString("zipcode"));
		article.setBirthday(rs.getString("birthday"));
		article.setEnrolldate(rs.getTimestamp("enrolldate"));
		article.setDeletedate(rs.getTimestamp("deletedate"));
		article.setDelflag(rs.getString("delflag"));
		article.setPwd(rs.getString("pwd"));
		
		return article;
	}
	
	//memberUpdate 회원수정 메서드
	public boolean memberUpdate(RegisterDTO regBean,String passwd, String memid) {
		boolean check=false;//회원수정 성공유무
		String dbpasswd="";//DB상에서 찾은 암호 저장 변수선언
		System.out.println("memberUpdate 매개변수 확인 regBean=>"+regBean+", passwd=>"+passwd+", memid"+memid);
		
		try {
			con=pool.getConnection();
			//--트랜잭션=>오라클의 필수(p410~413)=>자동으로 commit(X)
			con.setAutoCommit(false);//default가 true기 때문에 실수한번 할 수가 없다, 바로 데이터가 들어감
			//------------------비밀번호 확인
			sql="select pwd from member where memid=?";
			pstmt=con.prepareStatement(sql);//NullPointerException
			pstmt.setString(1, memid);//2.index~
			rs=pstmt.executeQuery();
			//암호를 찾았다면
			if(rs.next()) {
				dbpasswd=rs.getString("pwd");//rs.getString("불러올 필드명")
				System.out.println("dbpasswd=>"+dbpasswd);
				//dbpasswd(DB상 암호)==passwd(웹상에서 입력한 값)
				if(dbpasswd.contentEquals(passwd)) {
					System.out.println("if문 확인!!!!!!!!!!!!"+regBean.getMphone());
					sql="update member set nickname=?,email=?,mphone=?,zipcode=?,addr=? where memid=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,regBean.getNickname());
				    pstmt.setString(2,regBean.getEmail());
				    pstmt.setString(3,regBean.getMphone());
				    pstmt.setString(4,regBean.getZipcode());
				    pstmt.setString(5,regBean.getAddr());
				    pstmt.setString(6,memid);
			
				    int update=pstmt.executeUpdate();//반환값 1(성공),0(실패)
				    con.commit();//메모리->실제 테이블에 반영
				    System.out.println("update(데이터 수정유무)=>"+update);
				    if(update==1) {
				    	check=true;//데이터 update 성공확인
				    }
			
				}else {//암호가 틀린경우
					check=false;//회원수정 실패
				}
			}	else {//암호가 존재X
				check=false;
			}
			
		}catch(Exception e) {
			System.out.println("memberUpdate() 실행오류=>"+e);
			
		}finally {
			pool.freeConnection(con, pstmt);//rs 없음 (select가 아님)
		}
		return check;
	}
	
	//7)회원 탈퇴
	//SQL> select passwd from member where id='nup';
	//SQL> delete from member where id='nup';
	public int memberDelete(String id,String passwd) {
		String dbpasswd="";//DB상에서 찾은 암호 저장 변수선언
		int x=-1;//회원탈퇴 유무 확인위한 변수선언
		System.out.println("id=>"+id+", passwd=>"+passwd);
		try {
			con=pool.getConnection();//이미 만들어진 연결객체 얻어옴
			con.setAutoCommit(false);//트랜잭션 처리
			//인증처리
			sql="select pwd from member where memid=?";//sql
			pstmt=con.prepareStatement(sql);//NullPointerException
			pstmt.setString(1, id);//2.index~
			rs=pstmt.executeQuery();
			//암호를 찾았다면
			if(rs.next()) {
				System.out.println("if문 확인!!!!!!!!!!!!");
				dbpasswd=rs.getString("pwd");//rs.getString("불러올 필드명")
				System.out.println("dbpasswd=>"+dbpasswd);
				//dbpasswd(DB상 암호)==passwd(웹상에서 입력한 값)
				if(dbpasswd.equals(passwd)) {
					deleteMemLogin(id);
					sql="delete from member where memid=?";
					pstmt=con.prepareStatement(sql);//NullPointerException
					pstmt.setString(1, id);
					int delete=pstmt.executeUpdate();
					System.out.println("delete(회원탈퇴 성공유무)=>"+delete);
					con.commit();//트랜잭션 처리 끝
					x=1;//회원탈퇴 성공
				}else {//암호가 틀린경우
					x=0;//회원탈퇴 실패
				}
			}	else {//암호가 존재X
				x=-1;
			}
		}catch(Exception e) {
			System.out.println("memberDelete() 실행오류=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);//검색때문에 rs객체가 필요
		}
		return x;
	}

	//회원로그인 데이터 삭제->memid, pwd->delete
	  public boolean deleteMemLogin(String memid){
		boolean Logout = false;//회원삭제유무
		//DB작업(select)
System.out.println("memid넘어오는지 확인=>"+memid);
		try
		{
		  //DB접속구문
		  con = pool.getConnection();
		  con.setAutoCommit(false);//시작점

	      String sql="delete from memlogin where memid = ?";
	      pstmt = con.prepareStatement(sql);
		  pstmt.setString(1,memid);
		//1->logout 했다. ,0 -> logout실패
		 int LogoutCheck = pstmt.executeUpdate();//update
	     System.out.println("LogoutCheck="+LogoutCheck);
		 con.commit();//오라클의 경우

		 if(LogoutCheck ==1){
			 Logout = true;//데이터수정 성공
		  }
		}
		catch (Exception ex)
		{
	      System.out.println("=deleteMemLogin()에러=");
		  System.out.println("==에러라인 279==");
	      System.out.println(ex);
		}finally{	//DB객체를 해제
	      pool.freeConnection(con,pstmt);
		}
	   return Logout;
	  }
/*
	  //---------------------------------------주문내역---------------------------------------------
		public List<Y_BoardDTO> getOrderList(String memid) {
			System.out.println("getOrderList 실행확인");
			List<Y_BoardDTO> orderList=null;

			try {
				con = pool.getConnection();
				//sql
				sql="select * from buy where memid=? ";
				pstmt.setString(1, memid);
				pstmt=con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					orderList= new ArrayList();
					do {
						Y_BoardDTO article=new Y_BoardDTO(); 
						article=makeArticleFromBuy();
						//추가
						orderList.add(article);//생략하면 데이터 저장X => for문X(Null)
					}while(	rs.next());//더 있으면 계속
				}
				
		    }catch(Exception e) {
		    	System.out.println("getOrderList()에러유발=>"+e);
		    }finally {
		    	pool.freeConnection(con, pstmt, rs);
		    }
			return orderList;
		}
		
		private Y_BoardDTO makeArticleFromBuy() throws Exception {//getter method
			Y_BoardDTO article=new Y_BoardDTO();

			article.setOrderno(rs.getInt("orderno"));//주문번호
			article.setShipno(rs.getInt("shipno"));//배송지번호
			article.setOrderdate(rs.getTimestamp("orderdate"));//주문날짜.
			article.setShippingfee(rs.getInt("shippingfee"));//배송비
			
			return article;
		}
		
		public List<Y_BoardDTO> getOrderDetailList(String memid) {
			System.out.println("getOrderList 실행확인");
			List<Y_BoardDTO> orderDetailList=null;

			try {
				con = pool.getConnection();
				//sql
				sql="select * from buy where memid=? ";
				pstmt.setString(1, memid);
				pstmt=con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					orderDetailList= new ArrayList();
					do {
						Y_BoardDTO article=new Y_BoardDTO(); 
						article=makeArticleFromOrder();
						//추가
						orderDetailList.add(article);//생략하면 데이터 저장X => for문X(Null)
					}while(	rs.next());//더 있으면 계속
				}
				
		    }catch(Exception e) {
		    	System.out.println("getOrderList()에러유발=>"+e);
		    }finally {
		    	pool.freeConnection(con, pstmt, rs);
		    }
			return orderDetailList;
		}
		
		private Y_BoardDTO makeArticleFromOrder() throws Exception {//getter method
			Y_BoardDTO article=new Y_BoardDTO();

			article.setDetailno(rs.getInt("detailno"));//주문상세번호
			article.setOrderno(rs.getInt("orderno"));//주문번호
			article.setPid(rs.getInt("pid"));//상품번호
			article.setCount(rs.getInt("count"));//수량
			article.setPrice(rs.getInt("price"));//가격
			
			return article;
		}

	  //---------------------------------------주문내역---------------------------------------------
*/
	//페이징처리 : 전체 레코드 수를 구해서 화면에 뿌려는 것
	//1. 페이징처리를 하기 위해서는 전체 레코드 수를 반드시 구해와야한다. 
	//=>레코드를 전부 한 페이지에 보여줄 수 없기 때문에 적절히(ex. 한 페이지당 10개씩) 끊어서 보여주는 기법
	//select count(*) from board; 반환형O 매개변수X
	public int getArticleCount() {//회원리스트getMemberCount()->MemberDAO
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);//DBConnectionMgr
			sql="select count(*) from eventboard";//
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//변수명=rs.get자료형(필드명 또는 인덱스명) 
										//--> count(*)은 필드명이 아니기 때문에 index 번호로 불러와야 함.
			}
		}catch(Exception e) {
			System.out.println("getArticleCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//1.검색어에 해당되는 총레코드수를 구하는 메서드(검색분야,검색어)
	public int getArticleSearchCount(String search, String searchtext) {//회원리스트getMemberSearchCount()->MemberDAO
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);//DBConnectionMgr
			//-----------------------------------------------------------
			if(search==null || search=="") {//검색분야 선택X
				sql="select count(*) from eventboard";
			}else {//검색분야(제목,작성자,제목+본문)
				if(search.equals("subject_content")) {//제목+본문
					sql="select count(*) from eventboard where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%' ";
				}else {//제목,작성자=>필드명->매개변수를 이용해서 하나의 sql통합
					sql="select count(*) from eventboard where "+search+" like '%"+searchtext+"%' ";
				}
			}
			System.out.println("getArticleSearchCount 검색sql=>"+sql);
			//-----------------------------------------------------------
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//변수명=rs.get자료형(필드명 또는 인덱스명) 
										//--> count(*)은 필드명이 아니기 때문에 index 번호로 불러와야 함.
			}
		}catch(Exception e) {
			System.out.println("getArticleSearchCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);//연결객체 및 다른 객체 반납
		}
		return x;
	}
	
	
	//2. 글 목록보기에 대한 메서드 구현=>레코드 한 개 이상은 끊어서 보여준다=>한페이지당10개씩
	//---> 잘라서 보여주는 메서드가 필요함.  n번째부터 ~ n번째까지 보여 범위 지정을 위해 매개변수 start, end필요
	//public List getMemberList(int start,int end) -> int start 레코드 시작번호, int end불러올 레코드의 갯수(10씩 보여주고 싶어? int end=10) end기준으로 생각
	public List<E_BoardDTO> getArticles(int start,int end) {
		System.out.println("getArticles실행확인");
		List<E_BoardDTO> articleList=null; //ArrayList<BoardDTO> articleList=null (o)
		
		try {
			System.out.println("getArticles실행확인트라이");
			con=pool.getConnection();
			//Mysql방식
			//sql="select * from eventboard order by eventno desc,eventno limit ?,?";//?,? => A and B //그룹번호=게시물번호역할도 하기 떄문에 가능
			//oracle의 페이징처리방식
			sql = "SELECT * "
					+ "  FROM ( "
					+ "  	SELECT rownum AS RNUM, EVENTNO, MANAGERID, SUBJECT, CONTENT, IMGPATH , READCOUNT, EVENTDATE, EVENTSTART, EVENTEND, IMGPATH2, IMG_MAIN "
					+ "	  FROM ( "
					+ "	  	select * "
					+ "		  from eventboard "
					+ "		  order by eventno desc  "
					+ "	  ) "
					+ "  ) "
					+ " WHERE RNUM >= ? AND RNUM < ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);//mysql은 레코드 번호 순번이 내부적으로 0부터 시작하기 때문에 start-1 이었음.
			pstmt.setInt(2, start+end); //몇 개까지 불러와서 담을 건가? default(10)
			rs=pstmt.executeQuery();
			//기존에 데이터가 있으면 누적해서 쌓아 올려야한다.
			if(rs.next()) {//화면에 보여줄 데이터가 있으면
				articleList=new ArrayList(end); //end갯수만큼 공간을 생성해라
				do {
					E_BoardDTO article=new E_BoardDTO(); //회원리스트면 MemberDTO
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
		return articleList; //E_event.jsp에서 반환 -> for문 테이블에 출력
	}
				 
	
	
	//2)검색어에 따른 레코드의 범위지정에 대한 메서드
	public List<E_BoardDTO> getBoardArticles(int start,int end,String search,String searchtext) {
		System.out.println("getBoardArticles실행확인");
		List<E_BoardDTO> articleList=null; //ArrayList<BoardDTO> articleList=null (o)
		try {
			con=pool.getConnection();
			//-----------------------------------------------------------------------------------------
			if(search==null || search=="") {	//검색분야
				//Mysql
				//sql="select * from eventboard order by eventno desc,eventno limit ?,?";//?,? => A and B //그룹번호=게시물번호역할도 하기 떄문에 가능
				//oracle
				sql="SELECT *\r\n"
						+ "  FROM (\r\n"
						+ "  	SELECT rownum AS RNUM, EVENTNO, MANAGERID, SUBJECT, CONTENT, IMGPATH , READCOUNT, EVENTDATE, EVENTSTART, EVENTEND, IMGPATH2, IMG_MAIN   \r\n"
						+ "	  FROM (\r\n"
						+ "	  	select * \r\n"
						+ "		  from eventboard \r\n"
						+ "		  order by eventno desc  \r\n"
						+ "	  )\r\n"
						+ "  )\r\n"
						+ " WHERE rnum >= ? AND rnum < ?";
				
			}else {//제목+본문
				if(search.equals("subject_content")) {//제목+본문
					//mysql
					//sql="select * from eventboard where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%' order by eventno desc,eventno limit ?,?";
					//oracle
					sql = "SELECT *\r\n"
							+ "  FROM (\r\n"
							+ "  	SELECT rownum AS RNUM, EVENTNO, MANAGERID, SUBJECT, CONTENT, IMGPATH , READCOUNT, EVENTDATE, EVENTSTART, EVENTEND, IMGPATH2, IMG_MAIN  \r\n"
							+ "	  FROM (\r\n"
							+ "	  	select * \r\n"
							+ "		  from eventboard \r\n"
							+ "		  WHERE SUBJECT LIKE '%"  + searchtext  + "%' OR content LIKE '%" + searchtext + "%'\r\n"
							+ "		  order by eventno desc  \r\n"
							+ "	  )\r\n"
							+ "  )\r\n"
							+ " WHERE rnum >= ? AND rnum < ?";
				}else {//제목,작성자=>필드명->매개변수를 이용해서 하나의 sql통합
					sql = "SELECT *\r\n"
							+ "  FROM (\r\n"
							+ "  	SELECT rownum AS RNUM, EVENTNO, MANAGERID, SUBJECT, CONTENT, IMGPATH , READCOUNT, EVENTDATE, EVENTSTART, EVENTEND, IMGPATH2, IMG_MAIN  \r\n"
							+ "	  FROM (\r\n"
							+ "	  	select * \r\n"
							+ "		  from eventboard \r\n"
							+ "		  WHERE " + search + " LIKE '%" + searchtext + "%'\r\n"
							+ "		  order by eventno desc  \r\n"
							+ "	  )\r\n"
							+ "  )\r\n"
							+ " WHERE rnum >= ? AND rnum < ? ";
				}
			}
			System.out.println("getBoardArticles()의 sql=>"+sql);
			//-----------------------------------------------------------------------------------------
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);//mysql은 레코드 번호 순번이 내부적으로 0부터 시작하기 때문에 start-1
			pstmt.setInt(2, start+end); //몇 개까지 불러와서 담을 건가? default(10)
			System.out.println("start="+start+"start+end="+(start+end));
			rs=pstmt.executeQuery();
			//기존에 데이터가 있으면 누적해서 쌓아 올려야한다.
			if(rs.next()) {//화면에 보여줄 데이터가 있으면
				articleList=new ArrayList(end); //end갯수만큼 공간을 생성해라
				do {
					E_BoardDTO article=new E_BoardDTO(); //
					article=makeArticleFromResult();
					//필드별로 setter메서드를 통해 각각 넣어준다. like 분리수거
					//추가
					articleList.add(article);//생략하면 데이터 저장X => for문X(Null)
				}while(rs.next());//더 있으면 계속
			}
		}catch(Exception e) {
			System.out.println("getBoardArticles() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList; //list.jsp에서 반환 -> for문 테이블에 출력
	}
	
	
	//(3)페이징 처리 계산을 정리해주는 메서드(ListAction에서 소스가져옴)
	//Hashtable객체를 반환값으로=>페이징 처리에 관련된 처리결과를 저장할 변수들을 하나의 객체에 담아서 반환(key,value)->${키명}사용하기위해
	public Hashtable pageList(String pageNum,int count) {
		//0.페이징 처리결과를 저장할 Hashtable객체를 선언
		Hashtable<String,Integer> pgList=new Hashtable<String,Integer>();
		System.out.println("pageList실행");
		//1.ListAction에서 소스코드를 가지고와서 편집
		int pageSize=2; //numPerPage 페이지당 보여주는 게시물 수(=레코드 수)(default:10)
		int blockSize=3; //pagePerBlock 블럭 당 보여주는 페이지 수(default:10)

		//게시판을 처음 실행하면 무조건 1페이지부터 출력->왜? 가장 최근의 글이 나오게 설정해줬기 때문 
		if(pageNum==null){//처음에 1페이지는 내가 누를 수 없기 때문에 parameter값이 null
			pageNum="1";//무조건 default로 1페이지 설정
		}
		//nowPage(현재페이지(클릭해서 보고 있는 페이지))
		int currentPage = Integer.parseInt(pageNum); //if문 안에 넣으면 null인 경우에만 돌아가기 때문에 빼놓기
		int startRow = (currentPage - 1) * pageSize + 1; //시작 레코드 번호	
		int endRow = currentPage * pageSize;//1*10=10, 2*10=20, 3*10=30
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		int number = 0;//beginPerPage 페이지별로 시작하는 맨 처음에 나오는 게시물 번호
		
		System.out.println("현재 레코드 수(count)=>" + count); //37행에 표현식으로 출력
		
		number = count - (currentPage - 1) * pageSize;
		System.out.println("페이지별 number=>" + number);
		//-----------------모델1에서의 list.jsp에서 소스코드를 복사=>편집-----------------------
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		//2.시작페이지
		int startPage=0;
		if(currentPage%blockSize!=0){//1~9페이지(10)11~19(20)21~29(경계선)
			startPage=currentPage/blockSize*blockSize+1;
		}else{//10%10=0(10의 배수)
							//(10/10-1 )*10=0+1=1, 20=>11
			startPage=((currentPage/blockSize)-1)*blockSize+1;
		}
		//종료페이지
		int endPage=startPage+blockSize-1;//1+10-1=10,11+10
		System.out.println("startPage=>"+startPage+",endPage=>"+endPage);
		//블럭별로 구분해서 링크걸어서 출력
		if(endPage>pageCount) endPage=pageCount;
		//페이징 처리에 대한 계산결과=>Hashtable에 저장->ListAction전달
		//메모리에 저장->공유->list.jsp에서 불러다 사용
		pgList.put("pageSize", pageSize);//pgList.get(키명)
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
	
	
	//게시판에 글쓰기 및 답변 글쓰기 -> 메서드 하나로 통합
	//insert into board values(?,,,); --> insert into는 원래 반환값이 없어서 void
	public void insertArticle(E_BoardDTO article) {//(회원가입의 MemberDTO mem과 같다)
		//1. 넘어온 article이 신규글인지 답변글인지 확인하는 절차가 필요->
		int num=article.getEventno(); //0이면 신규글, 0이 아니면 답변글 -->구분용도->답글 기능이 없으니 필요가 없나?
		/*
		String img_main=article.getImg_main();
		String imgpath=article.getImgpath();
		String imgpath2=article.getImgpath2();
		*/
		
		//num과 number의 차이? num은 신규글인지 답변글인지 구분하는 용도, number는 데이터 저장용도
		int number=0; //데이터를 저장하기 위한 게시물 번호
		System.out.println("insertArticle()의 내부 number=>"+num); //디버깅
		
		try {
			con=pool.getConnection();
			sql="select max(eventno) from eventboard"; //지금까지 가지고 있는 게시물 번호의 최대값을 구함
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//데이터가 들어있는 경우(게시물O)
				number=rs.getInt(1)+1; //최댓값+1, max는 필드명이 아니기 때문에 인덱스 번호로 지정할 수 있음. 
			}else {//데이터가 들어있지 않은 경우(게시물X)=>0=>게시물 번호를 넣어줘야함(신규)
				number=1;
			}
			
			
			//12개 =>eventno,eventdate,readcount(생략)->default
			//작성날짜=> 오라클은 system, MySQL은 now() 
			sql="insert into eventboard(subject,content,eventdate,eventstart,eventend,eventno,img_main,imgpath,imgpath2) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());//웹에서 이미 저장된 상태
			pstmt.setString(2, article.getContent());
			pstmt.setTimestamp(3, article.getEventdate());
			pstmt.setString(4, article.getEventstart());
			pstmt.setString(5, article.getEventend());
			pstmt.setInt(6, number); 
			pstmt.setString(7, article.getImg_main());
			pstmt.setString(8, article.getImgpath());
			pstmt.setString(9, article.getImgpath2());
			
			//5번째에 해당하는 pstmt.setTimestamp(5, article.getReg_date()); 를 안쓰고 싶으면?
			//5번째 value에 ? 대신 now() 쓸 수 있다. values(?,?,?,?,now(),?,?,?,?,?)";
			int insert=pstmt.executeUpdate();
			System.out.println("insertArticle() 에러발생=>"+insert);
		}catch(Exception e) {
			System.out.println("insertArticle() 에러발생=>"+e);
		}finally{
			pool.freeConnection(con, pstmt, rs); //보통 insert면 rs가 없지만 sql구문을 여러개 넣을거라서 필요
		}
	}
	
	
	//글 상세보기 ->eventno로 바꾼 부분있음
	//content.jsp?num=3&pageNum=1
	//형식) 해당 게시물 넘버로 게시물 검색 select * from board where num=3;
	//형식2) 게시물의 조회수 변경 update board set readcount=readcount+1 where num=3;
	//조회수 수정 -> 조회수 수정된 게시물 검색해서 화면에 출력, 검색한 다음에 수정하면 새로고침해야되서 수정 후 검색하는 게 나음
	public E_BoardDTO getArticle(int num) {
		E_BoardDTO article=null; //ArrayList<BoardDTO> article=null; (제너릭)
		try {
			System.out.println("num값=>"+num);
			con=pool.getConnection();
			sql="update eventboard set readcount=readcount+1 where eventno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int update=pstmt.executeUpdate();
			System.out.println("조회수 증가(sql)=>"+sql);
			System.out.println("조회수 증가유무(update)=>"+update);
			
			sql="select * from eventboard where eventno=?";
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
	
	
	
	//------중복된 레코드 한 개를 담을 수 있는 메서드를 따로 만들어서 처리--------
	//접근 지정자는 private =>왜? 외부에서 호출목적X  내부에서 호출목적O
	private E_BoardDTO makeArticleFromResult() throws Exception {//getter method
		E_BoardDTO article=new E_BoardDTO();

		article.setEventno(rs.getInt("eventno"));//게시물번호
		article.setManagerid(rs.getString("managerid"));//작성자(관리자)
		article.setSubject(rs.getString("subject"));//제목
		article.setContent(rs.getString("content"));//글 내용
		
		article.setImg_main(rs.getString("img_main"));//글 이미지
		article.setImgpath(rs.getString("imgpath"));//글 이미지
		article.setImgpath2(rs.getString("imgpath2"));//글 이미지
		
		article.setReadcount(rs.getInt("readcount")); //default 0
		
		article.setEventdate(rs.getTimestamp("eventdate"));//작성날짜는 자동으로 계산해서 넣어준다.
		article.setEventstart(rs.getString("eventstart"));//이벤트시작일
		article.setEventend(rs.getString("eventend"));//이벤트종료일
		
		
		return article;
	}
	
	
	//----------------------------------------------------------------------
	//글 수정하기
	//1) 수정할 데이터를 찾을 메서드 = select * from member where num=? => 글상세보기랑 거의 같음=>조회수 증가부분만 삭제시켜주면 사용가능
	public E_BoardDTO updateGetArticle(int num) {
		E_BoardDTO article=null; //ArrayList<BoardDTO> article=null; (제너릭)
		try {
			con=pool.getConnection();
			//조회수 증가 시키는 코드를 삭제
			sql="select * from eventboard where eventno=?";
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
	
	// 2) 수정할 메서드 작성=>관리자인증확인절차=>회원탈퇴(암호를 비교=>탈퇴)
	// update eventboard set subject=?,content=?,eventstart=?,eventend=? where eventno=?";
	public int updateArticle(E_BoardDTO article) { //insertArticle 매개변수: 레코드 통째로 가지고 와야함
		//E_updateForm.jsp에서 넘어온 값을 입력받아서 처리...
		int x=-1;//게시물의 수정성공유무(맞다 안맞다 반환값을 저장)
		
		//------------------------------------
		String managerpwd="";
		String memloginpwd="";
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);//DBConnectionMgr
			sql="select * from manager";//manager table의 모든 데이터를 불러와라
			pstmt=con.prepareStatement(sql);//pstmt에 위의 query를 저장 후 DB에 연결 준비
			rs=pstmt.executeQuery();//query 실행 후 그 결과값을 rs에 저장
			//결과값 불러오기
			if(rs.next()) {
				managerpwd=rs.getString("pwd");//변수명=rs.get자료형(필드명 또는 인덱스명) 
			}
			System.out.println("updateArticle()의 managerpwd=>"+managerpwd);
			
			sql="select * from memlogin";//memlogin table의 모든 데이터를 불러와라
			pstmt=con.prepareStatement(sql);//pstmt에 위의 query를 저장 후 DB에 연결 준비
			rs=pstmt.executeQuery();//query 실행 후 그 결과값을 rs에 저장
			//결과값 불러오기
			if(rs.next()) {
				memloginpwd=rs.getString("pwd");//변수명=rs.get자료형(필드명 또는 인덱스명) 
			}
			System.out.println("updateArticle()의 memloginpwd=>"+memloginpwd);
			
			if(managerpwd.contentEquals(memloginpwd)) {
					sql="update eventboard set subject=?,content=?,eventstart=?,eventend=?,img_main=?,imgpath=?,imgpath2=?";
					sql+=" where eventno=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, article.getSubject());//웹에서는 Setter Method를 메모리에 저장
					pstmt.setString(2, article.getContent());
					pstmt.setString(3, article.getEventstart());
					pstmt.setString(4, article.getEventend());
					pstmt.setString(5, article.getImg_main());
					pstmt.setString(6, article.getImgpath());
					pstmt.setString(7, article.getImgpath2());
					pstmt.setInt(8, article.getEventno());
					int update=pstmt.executeUpdate();
					
					System.out.println("게시판의 글수정 성공유무(update)=>"+update);//1 or 0실패
					x=1;//수정성공 표시
			}else {//암호 불일치
				x=0;//수정 실패
			}
		}catch(Exception e) {
			System.out.println("updateArticle() 에러발생=>"+e);
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("updateArticle()의 최종 x=>"+x);
		return x;//로그인pwd== 매니저pwd이지만 x=1, 로그인pwd!=매니저pwd 면 x=0
		
		
		
	}
	
	
	
	//글 삭제=>암호 비교=>delete from eventboard where num=?
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
					sql = "delete from eventboard where eventno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					int delete = pstmt.executeUpdate();
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
