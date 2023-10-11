package action;

import javax.servlet.ServletRequest;

//login.jsp에서 작업한 자바코드는 LoginAction에서 처리한다.
//login.jsp는 결과를 뿌려주는 프론트 역할만 한다. 
//자바코드에 관련된 메서드를 호출한다던지 이런 부분들은 LoginAction컨트롤러가 한다. (명령어처리클래스)

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.J_GoodsDAO;
import product.J_GoodsDTO;


public class J_GoodsDetailAction implements CommandAction {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		System.out.println("pid=>"+pid);
		//int pid=1;
		J_GoodsDTO goodsbean=new J_GoodsDTO();
		J_GoodsDAO dbpro=new J_GoodsDAO();
		goodsbean=dbpro.getGoods(pid);
		request.setAttribute("goodsbean", goodsbean);
		return "/P_productDetails.jsp";
	}

}