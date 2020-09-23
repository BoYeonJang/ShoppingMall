package servlet.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;

@WebServlet("/updateCustomer")
public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CustomerVO customer = new CustomerVO();
		customer.setId(request.getParameter("customerId"));
		customer.setPassword(request.getParameter("customerPassword"));
		customer.setName (request.getParameter("customerName"));
		customer.setGender(request.getParameter("customerGender"));
		customer.setTel(request.getParameter("customerTel"));
		customer.setAddress(request.getParameter("customerAddress"));
		customer.setEmail(request.getParameter("customerEmail"));

		CustomerDAO customerdao = new CustomerDAO();
		if (customerdao.updateCustomer(customer)) {
			response.sendRedirect("customerOneSearch");
		} else {
			response.sendRedirect("updateFormCustomer?customerid=" + customer.getId());
		}
	}

}
