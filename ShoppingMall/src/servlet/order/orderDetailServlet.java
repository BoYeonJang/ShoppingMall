package servlet.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.OrderDetailDAO;
import shopping.dao.ProductDAO;
import shopping.vo.OrderDetailVO;
import shopping.vo.ProductVO;

/**
 * Servlet implementation class orderDetailServlet
 */
@WebServlet("/orderDetail")
public class orderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String userId=request.getParameter("userId");
		String pid=request.getParameter("productId");
		String count=request.getParameter("count");
		String size=request.getParameter("size");
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo= pdao.getProductWithId(pid);
		int price = 0;
		int cnt = 0;
		cnt =Integer.parseInt(count);
		price = cnt * pvo.getProductPrice();
		
		OrderDetailVO vo = new OrderDetailVO();
		OrderDetailDAO dao = new OrderDetailDAO();
		vo.setProductId(pid);
		vo.setProductCount(cnt);
		vo.setProductOption(size);
		vo.setProductPrice(pvo.getProductPrice());
		vo.setPrice(price);
		
		dao.addOrderDetail(vo);
		
		request.setAttribute("userId", userId);
		request.setAttribute("detail", vo);
		response.sendRedirect("orderDetailForm.jsp");
	}

}
