package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.J_GoodsDAO;
import product.J_GoodsDTO;
import product.ProductDAO;
import product.ProductDTO;

public class L_ProductDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pID=Integer.parseInt(request.getParameter("pID"));
		
		J_GoodsDTO goodsbean=new J_GoodsDTO();
		J_GoodsDAO dbpro=new J_GoodsDAO();
		
		ProductDAO pdao=new ProductDAO();
		ProductDTO product=pdao.getProductArticle(pID);
		
		goodsbean=dbpro.getGoods(pID);
		request.setAttribute("goodsbean", goodsbean);
		request.setAttribute("product", product);
		
		return "/P_productDetails.jsp";
	}

}
