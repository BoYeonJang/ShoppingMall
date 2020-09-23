package servlet.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.CustomerDAO;

@WebServlet("/deleteCustomer")
public class CustomerDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("customerId");
		CustomerDAO dao = new CustomerDAO();
		System.out.println(dao.deleteCustomer(id));

		response.sendRedirect("index.html");
	}

}
