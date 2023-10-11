package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import member.DBConnectionMgr;

public class ProductDAO {
	
	//DB연결
	private DBConnectionMgr pool=null; 
	
	private Connection con=null;  
	private PreparedStatement pstmt=null; 
	private ResultSet rs=null;
	private String sql="";
	
	
	public ProductDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		} catch(Exception e) {
			System.out.println("DB연결 실패 => "+e);
		}		
	}
	
	//관리자인지 확인
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
				managerid=rs.getString("managerid");
			}
			System.out.println("checkManager()의 managerid=>"+managerid);
			
			sql="select * from memlogin";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memid=rs.getString("memid");
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
		return x;
	}
		
	//페이징처리
	public int getProductCount() {
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from product";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getProductCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//페이징처리 계산
	public Hashtable pageList(String pageNum,int count) {
		
		Hashtable<String,Integer> pgList=new Hashtable<String,Integer>();

	    int pageSize=9;
	    int blockSize=5;
	    
	    if(pageNum==null){
	    	pageNum="1";
	    }
	    int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int number=0;
		System.out.println("현재 레코드수(count)=>"+count);
		number=count-(currentPage-1)*pageSize;
		System.out.println("페이지별 number=>"+number);

		int pageCount=count/pageSize+(count%pageSize==0?0:1);
	    int startPage=0;
	    
	    if(currentPage%blockSize!=0){
	    	startPage=currentPage/blockSize*blockSize+1;
	    }else{
	    	startPage=((currentPage/blockSize)-1)*blockSize+1;
	    }
	    int endPage=startPage+blockSize-1;
	    System.out.println("startPage="+startPage+",endPage="+endPage);
	    
	    if(endPage > pageCount) endPage=pageCount;

	    pgList.put("pageSize", pageSize);
	    pgList.put("blockSize", blockSize);
	    pgList.put("currentPage", currentPage);
	    pgList.put("startRow", startRow);
	    pgList.put("endRow",  endRow);
	    pgList.put("count", count);
	    pgList.put("number", number);
	    pgList.put("startPage", startPage);
	    pgList.put("endPage", endPage);
	    pgList.put("pageCount", pageCount);
	     
	    return pgList;
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
		pdto.setCount(rs.getInt("count"));
		
		return pdto;		
	}
	
	//상품리스트
	public List<ProductDTO> getProduct(int start,int end) {
		
		List<ProductDTO> productList=null;
		
		try {
			con=pool.getConnection();
			sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product order by pID desc)) where rnum>=? and rnum<=?";
			System.out.println("getProduct()의 sql=>"+sql);
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, start-1+end);
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
	
	//검색된 레코드 총 갯수 구하기
	private String p="";	
	
	public int getProductSearchCount(String search,String pcategory,String alcdegree,String pprice1,String pprice2, String pperson) {
		
		int x=0;//총레코드갯수를 저장
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			p="between "+pprice1+" and "+pprice2;
			System.out.println("p=>"+p);
			if(search==null || search=="") {//검색어를 입력하지 않은 경우
				
				//전체상품 눌렀을때
				if((pcategory==null || pcategory=="") && (alcdegree==null || alcdegree=="") && (pprice1==null) && (pprice2==null) && (pperson==null || pperson=="")) {
					sql="select count(*) from product";					
				} else if(pcategory==null || pcategory=="") {
					sql="select count(*) from product where (alcdegree "+alcdegree+") and (pperson in("+pperson+")) and (pprice "+p+")";
					if(alcdegree==null || alcdegree=="") {
						sql="select count(*) from product where (pperson in("+pperson+")) and (pprice "+p+")";
						if(pperson==null || pperson=="") {
							sql="select count(*) from product where pprice "+p;
						}
					} else if(pperson==null || pperson=="") {
						sql="select count(*) from product where (alcdegree "+alcdegree+") and (pprice "+p+")";
					}
					
				} else if(alcdegree==null || alcdegree=="") {
					sql="select count(*) from product where (pcategory in("+pcategory+")) and (pperson in("+pperson+")) and (pprice "+p+")";
					if(pperson==null || pperson=="") {
						sql="select count(*) from product where (pcategory in("+pcategory+")) and (pprice "+p+")";
					}
					
				} else if(pperson==null || pperson=="") {
					sql="select count(*) from product where (pcategory in("+pcategory+")) and (alcdegree "+alcdegree+") and (pprice "+p+")";
					
				} else {
					sql="select count(*) from product where (pcategory in("+pcategory+")) and (alcdegree "+alcdegree+") and (pperson in("+pperson+")) and (pprice "+p+")";
				}
				
			} else {
				sql="select count(*) from product where pname like '%"+search+"%'";
			}
			System.out.println("getProductSearchCount 검색sql=>"+sql);
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//변수명=rs.get자료형(필드명 또는 인덱스번호)=>필드명X(그룹함수)
			}
		}catch(Exception e) {
			System.out.println("getProductSearchCount() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//상품 검색기능
	public List<ProductDTO> getProductList(int start, int end, String search, String pcategory, String alcdegree, String pprice1,String pprice2, String pperson, String sort) {
		
		List<ProductDTO> productList=null;
		
		try {
			
			con=pool.getConnection();
			p="between "+pprice1+" and "+pprice2;
			System.out.println("p=>"+p);
			
			if(search==null || search=="") {
				sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product order by "+sort+")) where rnum>=? and rnum<=?";
				
				//전체상품 눌렀을때
				if((pcategory==null || pcategory=="") && (alcdegree==null || alcdegree=="") && (pprice1==null || pprice1=="") && (pprice2==null || pprice2=="") && (pperson==null || pperson=="")) {
					sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product order by "+sort+")) where rnum>=? and rnum<=?";				
				} else if(pcategory==null || pcategory=="") {
					sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (alcdegree "+alcdegree+") and (pperson in("+pperson+")) and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
					if(alcdegree==null || alcdegree=="") {
						sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (pperson in("+pperson+")) and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
						if(pperson==null || pperson=="") {
							sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where pprice "+p+" order by "+sort+")) where rnum>=? and rnum<=?";
						}
					} else if(pperson==null || pperson=="") {
						sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (alcdegree "+alcdegree+") and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
					}
					
				} else if(alcdegree==null || alcdegree=="") {
					sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (pcategory in("+pcategory+")) and (pperson in("+pperson+")) and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
					if(pperson==null || pperson=="") {
						sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (pcategory in("+pcategory+")) and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
					}
					
				} else if(pperson==null || pperson=="") {
					sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (pcategory in("+pcategory+")) and (alcdegree "+alcdegree+") and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
					
				} else {
					sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where (pcategory in("+pcategory+")) and (alcdegree "+alcdegree+") and (pperson in("+pperson+")) and (pprice "+p+") order by "+sort+")) where rnum>=? and rnum<=?";
				}
				
			} else {
				sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product where pname like '%"+search+"%' order by "+sort+")) where rnum>=? and rnum<=?";
			}
			System.out.println("getProductList()의 sql=>"+sql);
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, start-1+end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				productList=new ArrayList(end);
				do {
					ProductDTO pdto=new ProductDTO();
					pdto=makepdto();
					productList.add(pdto);
				}while(rs.next());
			}			
		}catch(Exception e) {
			System.out.println("getProductList() 에러발생"+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return productList;
		
	}
	
	//베스트상품 보기
	public List<ProductDTO> getBestProduct(int start,int end) {
		
		List<ProductDTO> productList=null;
		
		try {
			con=pool.getConnection();
			sql="select * from (select rownum as rnum, pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count from (select * from product order by count desc)) where rnum>="+start+" and rnum<="+end;
			System.out.println("getBestProduct()의 sql=>"+sql);
			
			pstmt=con.prepareStatement(sql);
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
			System.out.println("getBestProduct() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return productList;
	}
	
	
	//상품을 눌렀을때 (상품 상세 페이지로 이동할때) 조회수가 1씩 증가하는 메서드
	public ProductDTO getProductArticle(int pID) {
		ProductDTO article=null;
		try {
			System.out.println("num값=>"+pID);
			con=pool.getConnection();
			sql="update product set count=count+1 where pID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pID);
			int update=pstmt.executeUpdate();
			System.out.println("조회수 증가(sql)=>"+sql);
			System.out.println("조회수 증가유무(update)=>"+update);
			
			sql="select * from product where pID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article=makeArticleFromResult();
				
			}
		}catch(Exception e) {
			System.out.println("getProductArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("article=>"+article);
		
		return article;
	}
	
	private ProductDTO makeArticleFromResult() throws Exception {//getter method
		ProductDTO article=new ProductDTO();

		article.setpID(rs.getInt("pID"));
		article.setPname(rs.getString("pname"));
		article.setAlcdegree(rs.getInt("alcdegree"));
		article.setVolume(rs.getString("volume"));
		article.setIngredient(rs.getString("ingredient"));
		article.setPcompany(rs.getString("pcompany"));
		article.setPprice(rs.getInt("pprice"));
		article.setPperson(rs.getString("pperson"));
		article.setPcategory(rs.getString("pcategory"));
		article.setPdesc(rs.getString("pdesc"));
		article.setPstock(rs.getInt("pstock"));
		article.setImgpath(rs.getString("imgpath"));
		article.setCount(rs.getInt("count")); //default 0
		
		
		return article;
	}
	
	
	//상품등록
	public void productInsert(ProductDTO product) {
		try {
				con=pool.getConnection();
				sql="insert into product(pID,pname,alcdegree,volume,ingredient,pcompany,pprice,pperson,pcategory,pdesc,pstock,imgpath,count) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, product.getpID());//웹에서는 이미 데이터저장된 상태(Setter~)
				pstmt.setString(2, product.getPname());
				pstmt.setInt(3, product.getAlcdegree());
				pstmt.setString(4, product.getVolume());
				pstmt.setString(5, product.getIngredient());
				pstmt.setString(6, product.getPcompany());
				pstmt.setInt(7, product.getPprice());
				pstmt.setString(8, product.getPperson());
				pstmt.setString(9, product.getPcategory());
				pstmt.setString(10, product.getPdesc());
				pstmt.setInt(11, product.getPstock());
				pstmt.setString(12, product.getImgpath());
				pstmt.setInt(13, product.getCount());
				int insert=pstmt.executeUpdate();
				System.out.println("상품등록 성공유무(insert)=>"+insert);
			}catch(Exception e) {
				System.out.println("productInsert() 에러유발=>"+e);
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}
		}

	//수정할 상품을 찾을 메서드
	public ProductDTO getProductUpdate(int pID) {
		
      ProductDTO product=null;
		try {
			con=pool.getConnection();
			sql="select * from product where pID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				 product=makepdto();
			}
		}catch(Exception e) {
			System.out.println("getProductUpdate() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return product;
	}
	
	//상품수정
	public int productUpdate(ProductDTO product) {

		int x = -1;  // 게시물의 수정성공유무

		try {
			con = pool.getConnection();
			sql = "select * from product where pID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product.getpID());
			rs = pstmt.executeQuery();
			if (rs.next()) {// 보여주는 결과가 있다면
					sql = "update product set pID=?,pname=?,alcdegree=?,volume=?,ingredient=?,pcompany=?,pprice=?,pperson=?,pcategory=?,pdesc=?,pstock=?,imgpath=? where pID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, product.getpID());
					pstmt.setString(2, product.getPname());
					pstmt.setInt(3, product.getAlcdegree());
					pstmt.setString(4, product.getVolume());
					pstmt.setString(5, product.getIngredient());
					pstmt.setString(6, product.getPcompany());
					pstmt.setInt(7, product.getPprice());
					pstmt.setString(8, product.getPperson());
					pstmt.setString(9, product.getPcategory());
					pstmt.setString(10, product.getPdesc());
					pstmt.setInt(11, product.getPstock());
					pstmt.setString(12, product.getImgpath());
					pstmt.setInt(13, product.getpID());
					int update = pstmt.executeUpdate();
					System.out.println("상품 수정 성공유무(update)=>" + update);
					x = 1;
				}
		} catch (Exception e) {
			System.out.println("productUpdate() 메서드 에러유발=>" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	//상품삭제
	public int productDelete(int pID) {
		
		int x = -1;   //  삭제성공유무		

		try {
			con = pool.getConnection();
			sql = "delete from product where pID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
			int delete= pstmt.executeUpdate();
			System.out.println("상품 삭제 성공유무(delete)=>" + delete);
			x = 1;// 삭제성공유무
		} catch (Exception e) {
			System.out.println("productDelete() 에러유발=>" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
}
