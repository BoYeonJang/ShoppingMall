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
 * Servlet implementation class noticeBoardJacketList
 */
@WebServlet("/NoticeBoardJacketListServlet")
public class NoticeBoardJacketListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardVO> noticeBoardJacketList = dao.getNoticeListWithCategory("자켓");
		
		request.setAttribute("noticeBoardJacketList", noticeBoardJacketList);
		RequestDispatcher rd = request.getRequestDispatcher("Form/NoticeBoardForm/NoticeBoardJacketList.jsp");
		rd.forward(request, response);
	}
}
