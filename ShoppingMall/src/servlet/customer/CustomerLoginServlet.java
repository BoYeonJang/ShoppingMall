package servlet.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.CustomerDAO;
import shopping.vo.CustomerVO;

@WebServlet("/login")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 로그인
		// 1. 클라이언트가 보낸 값을 얻어온다.
		// HttpServletRequest 모든 요청에 대한 추상화된 객체.
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 2. DB에 id에 해당하는 member가 존재하는지 알아본다.
		CustomerDAO customerdao = new CustomerDAO();
		CustomerVO customer = customerdao.getCustomer(id);
		request.setAttribute("customer", customer);

		RequestDispatcher rd = request.getRequestDispatcher("Form/CustomerForm/customerOneSearch.jsp");
		rd.forward(request, response);
		
		

	}

}