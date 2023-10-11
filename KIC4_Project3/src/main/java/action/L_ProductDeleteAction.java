package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductDTO;

public class L_ProductDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	    
		int pID=Integer.parseInt(request.getParameter("pID"));//게시물번호
		
		ProductDAO pdao=new ProductDAO();
		ProductDTO product=pdao.getProductUpdate(pID);
		
		request.setAttribute("pID", pID);
		request.setAttribute("product", product);
		
		return "/L_ProductDelete.jsp";
	}

}
