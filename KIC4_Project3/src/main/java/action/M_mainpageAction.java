package action;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.M_mainDAO;
import product.ProductDAO;

public class M_mainpageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Random random = new Random();// 랜덤 객체 생성
		random.setSeed(System.currentTimeMillis());//규칙적인 랜덤을 방지
		List beProduct=null;//화면에 출력할 레코드를 저장할 변수
		
		M_mainDAO pdao=new M_mainDAO();
		ProductDAO pdao2=new ProductDAO();
		
		int a=random.nextInt(47);
		
		List reProduct=pdao.recommendProduct(a+1,a+13);//추천 상품
		beProduct=pdao2.getBestProduct(1,8);
		
		request.setAttribute("reProduct", reProduct);
		request.setAttribute("beProduct", beProduct);
		
		return "/M_mainpage.jsp";
	}

}
