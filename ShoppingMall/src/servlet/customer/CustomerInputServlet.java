package servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;

@WebServlet("/addCustomer")
public class CustomerInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		CustomerDAO customerdao = new CustomerDAO();
		CustomerVO customer = new CustomerVO();

		String Id = request.getParameter("customerId");
		String Password = request.getParameter("customerPassword");
		String Name = request.getParameter("customerName");
		String Gender = request.getParameter("customerGender");
		String Tel = request.getParameter("customerTel");
		String Address = request.getParameter("customerAddress");
		String Email = request.getParameter("customerEmail");

		customer.setId(Id);
		customer.setPassword(Password);
		customer.setName(Name);
		customer.setGender(Gender);
		customer.setTel(Tel);
		customer.setAddress(Address);
		customer.setEmail(Email);

		System.out.println(customerdao.addCustomer(customer));

		response.sendRedirect("Form/CustomerForm/loginForm.jsp");
	}

}
