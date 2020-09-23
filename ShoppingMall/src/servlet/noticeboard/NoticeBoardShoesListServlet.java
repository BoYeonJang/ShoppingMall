package servlet.noticeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.NoticeBoardDAO;
import shopping.vo.NoticeBoardVO;

/**
 * Servlet implementation class noticeBoardShoesList
 */
@WebServlet("/NoticeBoardShoesListServlet")
public class NoticeBoardShoesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardVO> noticeBoardShoesList = dao.getNoticeListWithCategory("신발");
		
		request.setAttribute("noticeBoardShoesList", noticeBoardShoesList);
		RequestDispatcher rd = request.getRequestDispatcher("Form/NoticeBoardForm/NoticeBoardShoesList.jsp");
		rd.forward(request, response);
	}

}
