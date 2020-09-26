package servlet.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.OrderDetailDAO;
import shopping.vo.OrderDetailVO;

/**
 * Servlet implementation class orderDetailDeleteServlet
 */
@WebServlet("/delOrderDetail")
public class orderDetailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrderDetailDAO dao = new OrderDetailDAO();
		OrderDetailVO vo = new OrderDetailVO();
		
		String userId=request.getParameter("uid");
		String productId=request.getParameter("pid");
		vo.setProductId(productId);
		vo.setUserId(userId);
		dao.deleteOrderDetail(vo);
		
		request.setAttribute("detail", vo);
		RequestDispatcher rd = request.getRequestDispatcher("Form/OrderForm/orderDetailForm.jsp");
		rd.forward(request, response);
	}

}
