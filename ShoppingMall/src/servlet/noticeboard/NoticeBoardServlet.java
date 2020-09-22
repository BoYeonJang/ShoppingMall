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

@WebServlet("/NoticeBoardServlet")
public class NoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardVO> noticeBoardList = dao.getNoticeList();
		
		request.setAttribute("noticeBoardList", noticeBoardList);
		RequestDispatcher rd = request.getRequestDispatcher("Form/NoticBoardForm/NoticeBoardList.jsp");
		rd.forward(request, response);
	}

}
