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
 * Servlet implementation class NoticeBoardBottomListServlet
 */
@WebServlet("/NoticeBoardBottomListServlet")
public class NoticeBoardBottomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardVO> noticeBoardBottomList = dao.getNoticeListWithCategory("하의");
		
		request.setAttribute("noticeBoardBottomList", noticeBoardBottomList);
		RequestDispatcher rd = request.getRequestDispatcher("Form/NoticeBoardForm/NoticeBoardBottomList.jsp");
		rd.forward(request, response);
	}

}
