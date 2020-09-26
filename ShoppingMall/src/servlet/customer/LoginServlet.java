package servlet.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;


@WebServlet("/LoginServlet") 
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerId = request.getParameter("id");
		String customerPassword = request.getParameter("password");
		
		CustomerDAO dao = new CustomerDAO();
		CustomerVO customer = dao.getCustomer(customerId);
		
		if (customer != null) {
			if (customerPassword.equals(customer.getPassword())) {
//				request.setAttribute("customer", customer);
//				RequestDispatcher rd = request.getRequestDispatcher("StartShoppingServlet");
//				rd.forward(request, response);
				
				HttpSession session= request.getSession();
				session.setAttribute("customerId", customer.getId());
				response.sendRedirect("/ShoppingMall/StartShoppingServlet");
				
			}else {
				response.sendRedirect("/ShoppingMall/Form/NoticeBoardForm/loginError.jsp");
			}
		} else {
			response.sendRedirect("/ShoppingMall/Form/CustomerForm/inputForm.jsp");
		}
		
	}

}
