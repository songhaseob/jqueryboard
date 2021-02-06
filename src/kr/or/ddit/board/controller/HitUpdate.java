package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;


@WebServlet("/HitUpdate.do")
public class HitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		IBoardService service = BoardServiceImpl.getService();
		
		int cnt = service.hitUpdate(seq);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("board/result.jsp").forward(request, response);
	
	}

}
