package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductDTO;

public class L_ProductFilterAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int pcategory=Integer.parseInt(request.getParameter("pcategory"));
		
		ProductDAO pdao=new ProductDAO();
		ProductDTO product=pdao.getProductUpdate(pcategory);
		
		request.setAttribute("pcategory", pcategory);
		request.setAttribute("product", product);
		
		return "/L_ProductFilter2.jsp";
	}

}
