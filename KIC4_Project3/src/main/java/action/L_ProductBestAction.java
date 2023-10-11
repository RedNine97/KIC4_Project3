package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;

public class L_ProductBestAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		 List productList=null;//화면에 출력할 레코드를 저장할 변수
		 
		 ProductDAO pdao=new ProductDAO();
		 productList=pdao.getBestProduct(1,20);

		 request.setAttribute("productList", productList);
		 
		return "/L_ProductBest.jsp";
	}

}
