package servlet.order;


import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.OrderDAO;
import shopping.vo.OrderVO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/Form/OrderForm/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
	
		
		OrderVO ov = new OrderVO();
		OrderDAO dao = new OrderDAO();
		//오늘 날짜 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String today = sdf.format(c1.getTime());
        
        String p = request.getParameter("price");
        if (p == null) {
        	p= "0";
        }
        int price=Integer.parseInt(p);
        
        String userId=request.getParameter("userId");
        String method = request.getParameter("method");
		ov.setUserId(userId);
		ov.setAddress(request.getParameter("add"));
		ov.setOrderDate(today);
		ov.setPayMethod(method);
		ov.setTotalPrice(price);
		int orderNUmber = dao.getOrderNumber();
		ov.setOrderNumber(orderNUmber);
		
		dao.addOrder(ov);
		
		
		
		Cookie cookie = new Cookie(URLEncoder.encode("userId","utf-8"), userId);
		cookie.setPath("/");
		//cookie.setMaxAge(60*60*24*365);
		cookie.setMaxAge(-1); //브라우저가 유지되는 동안
		
		Cookie cookie2 = new Cookie(URLEncoder.encode("orderNumber","utf-8"), Integer.toString(orderNUmber));
		cookie.setPath("/");
		//cookie.setMaxAge(60*60*24*365);
		cookie.setMaxAge(-1); //브라우저가 유지되는 동안
		
		//응답객체에 포함시킨다.
		response.addCookie(cookie);
		response.addCookie(cookie2);
		if(method.equals("계좌이체"))
			response.sendRedirect("orderAccComplete.jsp");
		else if(method.equals("카카오페이"))
			response.sendRedirect("orderKakaoComplete.jsp");
	}

}
