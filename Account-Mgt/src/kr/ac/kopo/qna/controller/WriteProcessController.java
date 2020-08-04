package kr.ac.kopo.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.vo.QnaVO;
import kr.ac.kopo.qna.dao.QnaDAO;

public class WriteProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaVO qna = new QnaVO();
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		qna.setWriter(writer);
		qna.setTitle(title);
		qna.setContent(content);
		
		QnaDAO dao = new QnaDAO();
		dao.insertOriQna(qna);
		
		return null;
	}
	
}
