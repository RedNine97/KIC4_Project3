package action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;

public class L_ProductAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNum=request.getParameter("pageNum");	
		String search=request.getParameter("search");
		String pcategory=request.getParameter("pcategory");		
		String alcdegree=request.getParameter("alcdegree");
		String pprice1=request.getParameter("pprice1");
		String pprice2=request.getParameter("pprice2");
		String pperson=request.getParameter("pperson");
		String sort=request.getParameter("sort");
		
		if(sort==null || sort=="") {
			sort="PID DESC";
		}
		
		if(pprice1==null || pprice1==""){
			pprice1="0";
		}
		if(pprice2==null || pprice2==""){
			pprice2="1000000";
		}

		
		System.out.println("L_ProductAction의 매개변수 확인");
		System.out.println("pageNum=>"+pageNum+",search=>"+search+",pcategory=>"+pcategory+",alcdegree=>"+alcdegree+",pprice1=>"+pprice1+",pprice2=>"+pprice2+",pperson=>"+pperson+",sort=>"+sort);
			
		int count=0;
		List productList=null;
		 
		ProductDAO pdao=new ProductDAO();
		count=pdao.getProductSearchCount(search, pcategory, alcdegree, pprice1,pprice2, pperson);
		
		System.out.println("현재 레코드수(count)=>"+count);
		
		Hashtable<String,Integer> pgList=pdao.pageList(pageNum, count);
		 
		 if (count > 0){
			 System.out.println(pgList.get("startRow")+","+pgList.get("endRow"));
			 productList=pdao.getProductList(pgList.get("startRow"),pgList.get("pageSize"),search,pcategory,alcdegree,pprice1,pprice2,pperson,sort);
			 System.out.println("L_ProductAction의 productList=>"+productList);
		 }else {
			 productList=Collections.EMPTY_LIST;
		 }
		 
		 int x=0;
		 x=pdao.checkManager();
		 
		 //2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용(request)
		 request.setAttribute("search", search);
		 request.setAttribute("pcategory", pcategory);
		 request.setAttribute("alcdegree", alcdegree);
		 request.setAttribute("pprice1", pprice1);
		 request.setAttribute("pprice2", pprice2);
		 request.setAttribute("pperson", pperson);
		 request.setAttribute("sort", sort);
		 request.setAttribute("pgList", pgList);
		 request.setAttribute("productList", productList);
		 request.setAttribute("checkManager", x);
		 
		 return "/L_Product.jsp";
	}

}
