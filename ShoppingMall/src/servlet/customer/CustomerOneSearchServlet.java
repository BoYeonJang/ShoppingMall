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

@WebServlet("/customerOneSearch")
public class CustomerOneSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean loginFlag = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("loginFlag".equals(cookie.getName())) {
					loginFlag = true;
					break;
				}
			}
		}
		
		String id = (String)request.getAttribute("id");
		if (loginFlag) {
			CustomerDAO customerdao = new CustomerDAO();
			CustomerVO customer = customerdao.getCustomer(id);

			request.setAttribute("customerOneSearch", customer);

			RequestDispatcher rd = request.getRequestDispatcher("Form/CustomerForm/customerOneSearch.jsp");
			rd.forward(request, response);
		} else {
			// 로그인하지 않은 사용자 일 때
			RequestDispatcher rd = request.getRequestDispatcher("Form/CustomerForm/error.jsp");
			rd.forward(request, response);
		}
	}
}
