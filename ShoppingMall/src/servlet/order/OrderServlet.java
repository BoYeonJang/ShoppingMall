package servlet.order;


import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.OrderDAO;
import shopping.dao.OrderDetailDAO;
import shopping.vo.OrderDetailVO;
import shopping.vo.OrderVO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cnt="";
		String pprice="";
		String pname="";
		
		cnt=request.getParameter("cnt");
		pprice=request.getParameter("pprice");
		pname=request.getParameter("pname");
		
		System.out.println(cnt);
		
		OrderDetailDAO odao = new OrderDetailDAO();
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
        
        System.out.println(method);
		ov.setUserId(userId);
		ov.setAddress(request.getParameter("add"));
		ov.setOrderDate(today);
		ov.setPayMethod(method);
		ov.setTotalPrice(price);
		int orderNUmber = dao.getOrderNumber();
		ov.setOrderNumber(orderNUmber);
		String msg="";
		msg=request.getParameter("message");
		ov.setMsg(msg);
		dao.addOrder(ov);
		List<OrderDetailVO>lvo= odao.getOrderDetailList(userId);
		odao.deleteOrderDetailAll(userId);
		
		
		
		request.setAttribute("orderNumber", orderNUmber);
		request.setAttribute("userId", userId);
		
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("pprice", pprice);
		request.setAttribute("pname", pname);
		//응답객체에 포함시킨다.
		if(lvo!=null)
			request.setAttribute("lvo", lvo);
		RequestDispatcher rd = request.getRequestDispatcher("Form/OrderForm/orderComplete.jsp");
		rd.forward(request, response);
	}

}
