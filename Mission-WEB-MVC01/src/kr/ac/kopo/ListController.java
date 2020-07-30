package kr.ac.kopo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class ListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectBoard();
		
		//공유영역에 list를 등록시킨다. 요청을 frontControl -> ListController ->FrontControl -> jsp
		request.setAttribute("list", list);
		
		/* return "/Mission-WEB-MVC01/board/list.jsp"; //에러가 나는 코드 */
		return "/board/list.jsp";	
	}
}
