package servlet.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StartShoppingServlet
 */
@WebServlet("/StartShoppingServlet")
public class StartShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		
		request.setAttribute("customerId", customerId);
		RequestDispatcher rd = request.getRequestDispatcher("header/NewHeader.jsp");  
		// forwarding 할 때는 파일 위치만 찾는거니까 자신의 위치에서부터 찾는것
		// redirect 할 때는 전체 url 링크로 보내줘야 하니까 절대경로로부터 
		//새롭게 로그인 상태로 다시 메인화면으로 (로그아웃으로 바뀌어 있고 누르면 다시 로그인)
		rd.forward(request, response);
	}

}
