package servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;

@WebServlet("/CustomerOneSearch")
public class CustomerOneSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String id = (String) request.getParameter("customerId");
		System.out.println(id);
		
			CustomerDAO customerdao = new CustomerDAO();
			CustomerVO customer = customerdao.getCustomer(id);

			request.setAttribute("customer", customer);
			//System.out.println(customer);

			RequestDispatcher rd = request.getRequestDispatcher("Form/CustomerForm/customerOneSearch.jsp");
			rd.forward(request, response);
		
	}
}
