package servlet.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import shopping.vo.OrderDetailVO;

/**
 * Servlet implementation class HeaderToDetailServlet
 */
@WebServlet("/HeaderToDetail")
public class HeaderToDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		OrderDetailVO vo = new OrderDetailVO();
		
		request.setAttribute("userId", userId);
		request.setAttribute("detail", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("Form/OrderForm/orderDetailForm.jsp");
		rd.forward(request, response);
	
	}

}
