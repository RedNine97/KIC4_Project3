package product;

import java.sql.*;  //DB연결
import java.util.*;  //검색된 데이터를 담아서 웹에 뿌리려면 Connection 객체가 필요하다. => Vector, ArrayList ,,

import product.J_CartDTO;
import product.J_GoodsDTO;
import member.DBConnectionMgr;


/*
 * DAO?
 * 웹상에서 호출할 메서드를 작성하는것이다. DB가 연결된 후 호출할 수 있다. (has a 관계)
 */



public class J_GoodsDAO {
	
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
	
	
	
	public J_GoodsDAO() {  //생성자는 클래스이름과 같다.
		//DBConnectionMgr을 못얻어오면 DB연결이 안되는것이므로 예외처리한다. DB연결은 기본적으로 예외처리한다.
		try {
			pool=DBConnectionMgr.getInstance();  //MemberDAO의 생성자를 호출하면 pool 객체를 얻어올수있다.
			System.out.println("pool=>"+pool);
		} catch(Exception e) {
			System.out.println("DB연결 실패 => "+e);  //e.toString()
		}		
	}

	// getGoodsList()
	public List getGoodsList(String item) {
		List goodsList = new ArrayList();

		try {
			con = pool.getConnection();
			// 3 sql
			sql="select * from product ";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				J_GoodsDTO gBean = new J_GoodsDTO();
				gBean = new J_GoodsDTO();
				gBean.setPid(rs.getInt("pid"));
				gBean.setPname(rs.getString("pname"));
				gBean.setAlcdegree(rs.getString("alcdegree"));
				gBean.setVolume(rs.getString("volume"));
				gBean.setIngredient(rs.getString("ingredient"));
				gBean.setPcompany(rs.getString("pcompany"));
				gBean.setPperson(rs.getString("pperson"));
				gBean.setPcategory(rs.getString("pcategory"));
				gBean.setPprice(rs.getInt("pprice"));
				gBean.setPdesc(rs.getString("pdesc"));
				gBean.setPstock(rs.getInt("pstock"));
				gBean.setImgpath(rs.getString("imgpath"));
				/*
				 * pstmt.setInt(1,gBean.getCount()); pstmt.setString(2,gBean.getPid());
				 * pstmt.setInt(3,gBean.getPrice());
				 */

				goodsList.add(gBean);
				//pstmt.executeUpdate();
			}
	    }catch(Exception e) {
	    	System.out.println("getGoodsList()에러유발=>"+e);
	    }finally {
	    	pool.freeConnection(con, pstmt, rs);
	    }
		return goodsList;
	}

	// getGoods(num)
	public J_GoodsDTO getGoods(int pid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		J_GoodsDTO gBean = null;
		try {
			con = pool.getConnection();
			sql = "select * from product where pid=?";
			// 테이블명 임시로 test로 만들어둠 포린키설정되있어서
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				gBean = new J_GoodsDTO();
				gBean.setPid(rs.getInt("pid"));
				gBean.setPname(rs.getString("pname"));
				gBean.setAlcdegree(rs.getString("alcdegree"));
				gBean.setVolume(rs.getString("volume"));
				gBean.setIngredient(rs.getString("ingredient"));
				gBean.setPcompany(rs.getString("pcompany"));
				gBean.setPperson(rs.getString("pperson"));
				gBean.setPcategory(rs.getString("pcategory"));
				gBean.setPprice(rs.getInt("pprice"));
				gBean.setPdesc(rs.getString("pdesc"));
				gBean.setPstock(rs.getInt("pstock"));
				gBean.setImgpath(rs.getString("imgpath"));
				
				System.out.println("pid=>"+pid);
			}
	    }catch(Exception e) {
	    	System.out.println("getGoodsList()에러유발=>"+e);
	    }finally {
	    	pool.freeConnection(con, pstmt, rs);
	    }
		return gBean;
	}
	
	}
	
	
	
	

