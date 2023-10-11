package product;

import java.sql.*;  //DB연결
import java.util.*;  //검색된 데이터를 담아서 웹에 뿌리려면 Connection 객체가 필요하다. => Vector, ArrayList ,,

import member.DBConnectionMgr;
import product.J_CartDTO;
import product.J_GoodsDTO;

/*
 * DAO?
 * 웹상에서 호출할 메서드를 작성하는것이다. DB가 연결된 후 호출할 수 있다. (has a 관계)
 */



public class J_CartDAO {
	
	//has a 관계 만들기
	
	//1.멤버변수에 연결할 클래스의 객체를 먼저 선언하라.
	private DBConnectionMgr pool=null; 
	//DBConnectionMgr 객체를 통해야지만 DB 접속해서 Connection객체를 얻어올 수 있다. 
	//getConnection() 컨넥션을 얻어오는 메서드, freeConnection() 메모리 해제
	
	//1-1)공통으로 DB에 접속할 경우, 멤버변수가 필요하다.
	private Connection con=null;  
	private PreparedStatement pstmt=null;  //sql 실행목적으로 필요
	private ResultSet rs=null;  //select때문에 필요
	private String sql="";  //실행시킬 sql문장을 저장할 목적으로 만들었다.
	
	
	
	public J_CartDAO() {  //생성자는 클래스이름과 같다.
		//DBConnectionMgr을 못얻어오면 DB연결이 안되는것이므로 예외처리한다. DB연결은 기본적으로 예외처리한다.
		try {
			pool=DBConnectionMgr.getInstance();  //MemberDAO의 생성자를 호출하면 pool 객체를 얻어올수있다.
			System.out.println("pool=>"+pool);
		} catch(Exception e) {
			System.out.println("DB연결 실패 => "+e);  //e.toString()
		}		
	}
	//장바구니 넣기
	public int insertCart(J_CartDTO cart) {//(장바구니에 담기)
		
			System.out.println("insertCart트라이");
			
			//int num=cart.getNum();
			int cartno=0;
			int return_insert=0;
		try {
			
			con=pool.getConnection();
			sql="select max(cartno) from cart";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//데이터가 들어있는 경우(게시물O)
				cartno=rs.getInt(1)+1; //최댓값+1, max는 필드명이 아니기 때문에 인덱스 번호로 지정할 수 있음. 
			}else {//데이터가 들어있지 않은 경우(게시물X)=>0=>게시물 번호를 넣어줘야함(신규)
				cartno=1;
			}
			//insert cart
			sql="insert into cart(cartno,pid,amonut,cartprice,memid) values(?,?,?,?,?)";
			//; //지금까지 가지고 있는 게시물 번호의 최대값을 구함
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cartno);//웹에서 이미 저장된 상태
			pstmt.setInt(2, cart.getPid());
			pstmt.setInt(3, cart.getAmount());
			pstmt.setInt(4, cart.getCartprice());
			pstmt.setString(5, cart.getMemid());
//			rs=pstmt.executeQuery();
			//실행
			//pstmt.executeUpdate();
			return_insert=pstmt.executeUpdate();
			
			System.out.println("insertCart() 에러발생=>"+return_insert);
			
			
		}catch(Exception e) {
			System.out.println("insertCart() 에러발생=>"+e);
		}finally{
			pool.freeConnection(con, pstmt, rs); //보통 insert면 rs가 없지만 sql구문을 여러개 넣을거라서 필요
			

		}
		return return_insert;
	}
	
	//장바구니 업데이트
			public int updateCart(J_CartDTO cart) {
				int x=-1; //게시물의 등록성공유무
				try {
							con = pool.getConnection();
							sql = "update cart set amount where cartno=?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, cart.getCartno());
							//pstmt.setInt(2, cart.amount);
							int update = pstmt.executeUpdate();
							System.out.println("장바구니 등록 성공유무(update)=>" + update);
							x=1;//등록성공
					
				}catch(Exception e) {
					System.out.println("updateCart() 에러발생=>"+e);
				}finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return x;
			}	
	//장바구니 삭제
		public int deleteCart(int cartno) {
			int x=-1; //게시물의 삭제성공유무
			try {
						con = pool.getConnection();
						sql = "delete from cart where cartno=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, cartno);
						
					//	pstmt.executeUpdate();
						int delete = pstmt.executeUpdate();
						System.out.println("장바구니 삭제 성공유무(delete)=>" + delete);
						x=1;//삭제 성공
				
			}catch(Exception e) {
				System.out.println("deleteCart() 에러발생=>"+e);
			}finally {
				pool.freeConnection(con, pstmt);
			}
			return x;
		}	
	
		// getCartList()
		public List getCartList(String memid) {
			List cartList = new ArrayList();

			try {
				con = pool.getConnection();
				// 3 sql
				sql="select * from cart where memid=? ";
				pstmt.setString(1, memid);
				pstmt=con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					J_CartDTO gBean = new J_CartDTO();
					gBean = new J_CartDTO();
					gBean.setCartno(rs.getInt("cartno"));
					gBean.setPid(rs.getInt("pid"));
					gBean.setMemid(rs.getString("memid"));
					gBean.setCartprice(rs.getInt("cartprice"));
					gBean.setAmount(rs.getInt("amount"));

					/*
					 * pstmt.setInt(1,gBean.getCount()); pstmt.setString(2,gBean.getPid());
					 * pstmt.setInt(3,gBean.getPrice());
					 */

					cartList.add(gBean);
					//pstmt.executeUpdate();
				}
		    }catch(Exception e) {
		    	System.out.println("getGoodsList()에러유발=>"+e);
		    }finally {
		    	pool.freeConnection(con, pstmt, rs);
		    }
			return cartList;
		}
	
	
	
	
	}
	
	
	
	

