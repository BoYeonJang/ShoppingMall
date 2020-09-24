package servlet.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;

@WebServlet("/CustomerUpdateFormServlet")
public class CustomerUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("customerId");
		CustomerDAO customerdao = new CustomerDAO();
		CustomerVO customer = customerdao.getCustomerLogin(id);

		request.setAttribute("customerInfo", customer);

		RequestDispatcher rd = request.getRequestDispatcher("Form/CustomerForm/customerUpdateForm.jsp");
		rd.forward(request, response);
	}

}
