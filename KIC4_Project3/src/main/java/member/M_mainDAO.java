package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import product.ProductDTO;

public class M_mainDAO {
	//pool객체를 선언
			private DBConnectionMgr pool = null;//풀객체
			private Connection con = null;
			private PreparedStatement pstmt=null;
			private ResultSet rs=null;
			private String sql="";

			public M_mainDAO(){
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
			
			//공통으로 사용할 pdto
			private ProductDTO makepdto() throws Exception {		
				ProductDTO pdto=new ProductDTO();
				pdto.setpID(rs.getInt("pID"));
				pdto.setPname(rs.getString("pname"));
				pdto.setAlcdegree(rs.getInt("alcdegree"));
				pdto.setVolume(rs.getString("volume"));
				pdto.setIngredient(rs.getString("ingredient"));
				pdto.setPcompany(rs.getString("pcompany"));
				pdto.setPprice(rs.getInt("pprice"));
				pdto.setPperson(rs.getString("pperson"));
				pdto.setPcategory(rs.getString("pcategory"));
				pdto.setPdesc(rs.getString("pdesc"));
				pdto.setPstock(rs.getInt("pstock"));
				pdto.setImgpath(rs.getString("imgpath"));
				
				return pdto;		
			}
			
			//상품리스트
			public List<ProductDTO> recommendProduct(int start,int end) {
				
				List<ProductDTO> productList=null;
				StringBuffer sb = new StringBuffer();
				
				try {
					con=pool.getConnection();
					//sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath from (select * from product order by pID desc)) where rnum>=? and rnum<=?";
					sb.append("select * from (select rownum as rnum, pID,pname,alcdegree,volume,");
					sb.append("ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath ");
					sb.append("from (select * from product order by pID desc)) where rnum>=? and rnum<=?");
					sql=sb.toString();
					
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end-1);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						productList=new ArrayList(end);
						do {
							ProductDTO pdto=new ProductDTO();
							pdto=makepdto();
							productList.add(pdto);
						}while(rs.next());
					}			
				}catch(Exception e) {
					System.out.println("getProduct() 에러유발=>"+e);
				}finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return productList;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
}
