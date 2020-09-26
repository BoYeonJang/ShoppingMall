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
import shopping.dao.ProductDAO;
import shopping.vo.NoticeBoardVO;
import shopping.vo.ProductVO;


@WebServlet("/NoticeBoardTopListServlet")
public class NoticeBoardTopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardVO> noticeBoardTopList = dao.getNoticeListWithCategory("상의");
		//System.out.println(noticeBoardTopList);
		
		request.setAttribute("noticeBoardTopList", noticeBoardTopList);
		RequestDispatcher rd = request.getRequestDispatcher("Form/NoticeBoardForm/NoticeBoardTopList.jsp");
		rd.forward(request, response);
	}

}
