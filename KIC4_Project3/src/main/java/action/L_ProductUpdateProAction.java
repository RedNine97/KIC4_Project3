package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductDTO;

public class L_ProductUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		ProductDTO pdto=new ProductDTO();
		
		pdto.setpID(Integer.parseInt(request.getParameter("pID")));
	    pdto.setPname(request.getParameter("pname"));
	    pdto.setAlcdegree(Integer.parseInt(request.getParameter("alcdegree")));
	    pdto.setVolume(request.getParameter("volume"));
	    pdto.setIngredient(request.getParameter("ingredient"));
	    pdto.setPcompany(request.getParameter("pcompany"));
	    pdto.setPprice(Integer.parseInt(request.getParameter("pprice")));
	    pdto.setPperson(request.getParameter("pperson"));
	    pdto.setPcategory(request.getParameter("pcategory"));
	    pdto.setPdesc(request.getParameter("pdesc"));
	    pdto.setPstock(Integer.parseInt(request.getParameter("pstock")));
	    pdto.setImgpath(request.getParameter("imgpath"));
	    
	    ProductDAO pdao=new ProductDAO();
	    pdao.productUpdate(pdto);
			    
		return "/L_ProductUpdatePro.jsp";
	}

}
