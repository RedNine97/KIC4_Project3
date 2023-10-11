package member;

//DB작업
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class U_MemberDAO {
	//pool객체를 선언
		private DBConnectionMgr pool = null;//풀객체

		public U_MemberDAO(){
	     //DBConnectionMgr의 객체를 얻어오는 구문
		  try
		  {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool="+pool);
		  }
		  catch (Exception e)
		  {
			System.out.println
			("Error:커넥션불러오기 실패"+e);
		  }
		}

		//비지니스메서드 구현
		//1.회원인지를 체크해주는 메서드(인증)
	public boolean loginCheck(String memid,
		                      String pwd){
	    //DB접속
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	    
		boolean check = false;//로그인성공유무
		//DB작업(select)

		try
		{
		  //DB접속구문
		  con = pool.getConnection();
		  //con.setAutoCommit(false);//시작점
		  
	     String sql="select memid,pwd from member "+
			        "where memid = ? and pwd = ?";
		 pstmt = con.prepareStatement(sql);
	     pstmt.setString(1,memid);
		 pstmt.setString(2,pwd);
		 rs = pstmt.executeQuery();
	     
		 if(rs.next()) {
			 String sql2= "insert into memlogin "+
				        "values(?,?)";
			 pstmt = con.prepareStatement(sql2);
		     pstmt.setString(1,memid);
		     pstmt.setString(2,pwd);
		   //1->insert갯수,0->삽입실패
			 int count = pstmt.executeUpdate();//insert
		     System.out.println("count="+count);
			 con.commit();//오라클의 경우
			 if(count > 0){
				 check = true;//데이터입력 성공
			  }else {
				  System.out.println("로그인회원 테이블에 값이 1도 안들어감");
			  }
		 }else {
			 System.out.println("로그인회원 테이블 값 안들어감");
		 }
		}
		catch (Exception ex)
		{
	      System.out.println("=loginCheck()에러=");
		  System.out.println("==에러라인 71==");
	      System.out.println(ex);
		}finally{	//DB객체를 해제
	      pool.freeConnection(con,pstmt,rs);
		}
	   return check;
	}
	
	//2.소셜로그인 회원로그인하기
		 public boolean memloginSuc(String memid){
		   
		   //DB접속
			Connection con = null;
			PreparedStatement pstmt=null;    
			boolean check = false;//성공유무
			String pwd=null;
			try
			{
			  //DB접속구문
			  con = pool.getConnection();
			  //트랜잭션처리
			  con.setAutoCommit(false);//DB작업의시작

		     String sql="insert into memlogin values(?,?)";

			 pstmt = con.prepareStatement(sql);
		     pstmt.setString(1,memid);
		     pstmt.setString(2,pwd);
		     //1->insert갯수,0->삽입실패
			 int count = pstmt.executeUpdate();//insert
		     System.out.println("count="+count);
			 con.commit();//오라클의 경우

			 if(count > 0){
				 check = true;//데이터입력 성공
			  }
			}
			catch (Exception ex)
			{
		      System.out.println("=memloginSuc()에러=");
			  System.out.println("==에러라인 117==");
		      System.out.println(ex);
			}finally{	//DB객체를 해제
		      pool.freeConnection(con,pstmt);
			}
		   return check;
		 }
	
	    //3.중복ID를 체크하는 메서드
	 public boolean checkId(String memid){
	  
	    //DB접속
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	    
		boolean check = false;//중복ID유무
		//DB작업(select)

		try
		{
		  //DB접속구문
		  con = pool.getConnection();
		  System.out.println("con="+con);
	      String sql="select memid from member "+
			         " where memid = ?";
	      pstmt = con.prepareStatement(sql);
		  pstmt.setString(1,memid);
		  rs = pstmt.executeQuery();
		  check = rs.next();//true
		  System.out.println("중복ID를 체크 checkId=>"+check);
		}
		catch (Exception ex)
		{
	      System.out.println("=checkId()에러=");
		  System.out.println("==에러라인 152==");
	      System.out.println(ex);
		}finally{	//DB객체를 해제
	      pool.freeConnection(con,pstmt,rs);
		}
	   return check;
	 }
	    //4.우편번호를 검색->회원전체를 검색(메서드)
	 public ArrayList<ZipcodeDTO> zipcodeRead(String area3){
	  
	  //DB접속
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ZipcodeDTO> vecList = new ArrayList();//담을객체

		try
		{
		  //DB접속구문
		  con = pool.getConnection();
	      String sql="select * from zipcode where area3 like '"+area3+"%'";
	      pstmt = con.prepareStatement(sql);
		  rs = pstmt.executeQuery();
		  
		  //검색한 데이터를 찾아서 벡터에 담는코딩
		   while(rs.next()){//찾은 데이터가 있다면
	        ZipcodeDTO tempZipcode = new ZipcodeDTO();
			tempZipcode.setZipcode(rs.getString("zipcode"));
			tempZipcode.setArea1(rs.getString("area1"));
			tempZipcode.setArea2(rs.getString("area2"));
			tempZipcode.setArea3(rs.getString("area3"));
			tempZipcode.setArea4(rs.getString("area4"));
			//벡터에 담기->화면에 출력하기위해
			vecList.add(tempZipcode);
		   }
		}
		catch (Exception ex)
		{
	      System.out.println("=zipcodeRead()에러=");
		  System.out.println("==에러라인 191==");
	      System.out.println(ex);
		}finally{	//DB객체를 해제
	      pool.freeConnection(con,pstmt,rs);
		}
	   return vecList;
	 }
	 
	 //5.회원가입->화면에 출력(빈즈데이터)->DB
	 public boolean memberInsert(U_RegisterDTO regBean){
	 //DB접속
		 Connection con = null;
		 PreparedStatement pstmt=null;    
		 boolean check = false;//회원가입성공유무
		 try
		 {
			 //DB접속구문
			 con = pool.getConnection();
			 //트랜잭션처리
			 con.setAutoCommit(false);//DB작업의시작

		     String sql="insert into member(memid,memname,birthday,email,mphone,"
		    		 +"nickname,enrolldate,deletedate,pwd,addr,zipcode) values(?,?,?,?,?,?,?,?,?,?,?)";

			 pstmt = con.prepareStatement(sql);
		     pstmt.setString(1,regBean.getMemid());
			 pstmt.setString(2,regBean.getMemname());
			 pstmt.setString(3,regBean.getBirthday());
			 pstmt.setString(4,regBean.getEmail());
			 pstmt.setString(5,regBean.getMphone());
			 pstmt.setString(6,regBean.getNickname());
			 pstmt.setTimestamp(7,regBean.getEnrolldate());
			 pstmt.setTimestamp(8,regBean.getDeletedate());
			 pstmt.setString(9,regBean.getPwd());
			 pstmt.setString(10,regBean.getAddr());
			 pstmt.setString(11,regBean.getZipcode());
		     //1->insert갯수,0->삽입실패
			 int count = pstmt.executeUpdate();//insert
		     System.out.println("count="+count);
			 con.commit();//오라클의 경우

			 if(count > 0){
				 check = true;//데이터입력 성공
			  }
			}
			catch (Exception ex)
			{
		      System.out.println("=memberInsert()에러=");
			  System.out.println("==에러라인 242==");
		      System.out.println(ex);
			}finally{	//DB객체를 해제
		      pool.freeConnection(con,pstmt);
		 }
		 return check;
	}
	  
	//6.회원로그인 데이터 삭제->memid, pwd->delete
	  public boolean deleteMemLogin(String memid){
	   //DB접속
		Connection con = null;
		PreparedStatement pstmt=null;
		boolean Logout = false;//회원삭제유무
		//DB작업(select)

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
	  
	  //7.아이디 찾기
	  public ArrayList<U_RegisterDTO> searchId(String memname,String email){
		  
		  //DB접속
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<U_RegisterDTO> idList = new ArrayList();//담을객체

			try
			{
			  //DB접속구문
			  con = pool.getConnection();
		      String sql="select memid,enrolldate from member where memname=? and email=?";
		      pstmt = con.prepareStatement(sql);
		      pstmt.setString(1,memname);
		      pstmt.setString(2,email);
			  rs = pstmt.executeQuery();
			  
			  //검색한 데이터를 찾아서 벡터에 담는코딩
			   while(rs.next()){//찾은 데이터가 있다면
				U_RegisterDTO regDTO = new U_RegisterDTO();
				regDTO.setMemid(rs.getString("memid"));
				regDTO.setEnrolldate(rs.getTimestamp("enrolldate"));
				
				//idList에 담기->화면에 출력하기위해
				idList.add(regDTO);
			   }
			}
			catch (Exception ex)
			{
		      System.out.println("=searchId()에러=");
			  System.out.println("==에러라인 317==");
		      System.out.println(ex);
			}finally{	//DB객체를 해제
		      pool.freeConnection(con,pstmt,rs);
			}
		   return idList;
		 }
	  
	  	//8.비밀번호 찾기
	  	//memid로 검색해서 memid와 email을 꺼내온다.
	  	public U_RegisterDTO searchPwd(String memid){
		    //DB접속
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			U_RegisterDTO regDto = null;

			try
			{
			  //DB접속구문
			  con = pool.getConnection();
			  String sql="select memid,memname,email from member where memid = ?";
		      pstmt = con.prepareStatement(sql);
			  pstmt.setString(1,memid);
			  rs = pstmt.executeQuery();
			  
			  //검색한 데이터를 찾아서 DTO에 담는코딩
			   if(rs.next()){//찾은 데이터가 있다면
				   regDto = new U_RegisterDTO();
				   regDto.setMemid(rs.getString("memid"));
				   regDto.setMemname(rs.getString("memname"));
				   regDto.setEmail(rs.getString("email"));
			   }
			}
			catch (Exception ex)
			{
		      System.out.println("=getMember()에러=");
			  System.out.println("==에러라인 358==");
		      System.out.println(ex);
			}finally{	//DB객체를 해제
		      pool.freeConnection(con,pstmt,rs);
			}
		   return regDto;
		  }
	  
	  	//9.비밀번호 변경(Update)
		public boolean pwdSearchUpdate(String memid,String pwd) {
			Connection con = null;
			PreparedStatement pstmt=null;
		    boolean check=false;//비밀번호 수정 성공유무
		    
			try {
				con=pool.getConnection();
				con.setAutoCommit(false);
				String sql="update member set pwd=? where memid=?";

				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,pwd);
				pstmt.setString(2,memid);
				
				int update = pstmt.executeUpdate();//반환값 1 (성공), 0 (실패)
				con.commit();//메모리를 테이블에 반영된다.
				System.out.println("update(데이터 수정 유무) => "+update);
				if(update>0) {
					check=true; 
				}
			}catch(Exception e){
			      System.out.println("=pwdSearchUpdate()에러=");
				  System.out.println("==에러라인 385==");
			}finally {
				pool.freeConnection(con, pstmt); 
			}
			return check;
		}
		
		//10. 혹시모를 초기화 - 회원로그인 데이터 삭제
		  public boolean loginReset(){
		   //DB접속
			Connection con = null;
			PreparedStatement pstmt=null;
			boolean Reset = false;//회원삭제유무
			//DB작업(select)

			try
			{
			  //DB접속구문
			  con = pool.getConnection();
			  con.setAutoCommit(false);//시작점

		      String sql="delete from memlogin";
		      pstmt = con.prepareStatement(sql);
			//1->logout 했다. ,0 -> logout실패
			 int LogCheck = pstmt.executeUpdate();//update
		     System.out.println("LogoutCheck="+LogCheck);
			 con.commit();//오라클의 경우

			 if(LogCheck ==1){
				 Reset = true;//데이터수정 성공
			  }
			}
			catch (Exception ex)
			{
		      System.out.println("=loginReset()에러=");
			  System.out.println("==에러라인 467==");
		      System.out.println(ex);
			}finally{	//DB객체를 해제
		      pool.freeConnection(con,pstmt);
			}
		   return Reset;
		  }
		  
		//5.소셜 회원가입 카카오톡
			 public boolean kakaoInsert(U_RegisterDTO regBean){
			 //DB접속
				 Connection con = null;
				 PreparedStatement pstmt=null;    
				 boolean check = false;//회원가입성공유무
				 try
				 {
					 //DB접속구문
					 con = pool.getConnection();
					 //트랜잭션처리
					 con.setAutoCommit(false);//DB작업의시작

				     String sql="insert into member(memid,memname,email,enrolldate,deletedate) values(?,?,?,?,?)";

					 pstmt = con.prepareStatement(sql);
				     pstmt.setString(1,regBean.getMemid());
					 pstmt.setString(2,regBean.getMemname());
					 pstmt.setString(3,regBean.getEmail());
					 pstmt.setTimestamp(4,regBean.getEnrolldate());
					 pstmt.setTimestamp(5,regBean.getDeletedate());
				     //1->insert갯수,0->삽입실패
					 int count = pstmt.executeUpdate();//insert
				     System.out.println("count="+count);
					 con.commit();//오라클의 경우

					 if(count > 0){
						 check = true;//데이터입력 성공
					  }
					}
					catch (Exception ex)
					{
				      System.out.println("=kakaoInsert()에러=");
					  System.out.println("==에러라인 242==");
				      System.out.println(ex);
					}finally{	//DB객체를 해제
				      pool.freeConnection(con,pstmt);
				 }
				 return check;
			}
		  
	  //관리자->전체회원을 모두 열람(검색)
	  
	  
	  
	  
	  
	  
	  
	}
