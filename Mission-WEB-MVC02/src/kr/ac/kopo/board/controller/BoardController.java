package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.annotaion.RequestMapping;

public class BoardController {
	
	@RequestMapping(value="/board/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		/* System.out.println("BoardController list() 호출 "); */
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAllBoard();
		/*
			dispatcherServlet에게 공유영역에 올리는 것을 맡김
			return할때 주소뿐만아니라 공유영역에 등록시키려는 객체가 필요하다. 
			그 객체를 model[공유영역에 등록시키고자 하는 객체들의 집합]&view[redirect, forword시킬 주소]
			모델앤뷰클래스를 만든다. 맵객체가 필요하다.
		 */
		request.setAttribute("boardList", list);
		return "/jsp/board/list.jsp";
	}
	
	@RequestMapping("/board/write.do")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("BoardController write() 호출");
		return "";
	}
}
