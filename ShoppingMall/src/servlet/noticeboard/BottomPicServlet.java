package servlet.noticeboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.ProductDAO;
import shopping.vo.ProductVO;

/**
 * Servlet implementation class BottomPicServlet
 */
@WebServlet("/BottomPicServlet")
public class BottomPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("noticeTitle"); 
		System.out.println(productName);
		//int noticeNo = Integer.parseInt(no);
	
		ProductDAO dao = new ProductDAO();
		ProductVO product = dao.getProduct(productName);
		System.out.println(product);
		
		request.setAttribute("product", product);
		RequestDispatcher rd = request.getRequestDispatcher("Form/ProductForm/BottomPic.jsp");
		rd.forward(request, response);
		
	}

}
