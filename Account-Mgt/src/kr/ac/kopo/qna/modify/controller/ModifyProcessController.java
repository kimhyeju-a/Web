package kr.ac.kopo.qna.modify.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class ModifyProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		QnaVO qna = new QnaVO();
		
		int no = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(no);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		qna.setBoardNo(no);
		qna.setTitle(title);
		qna.setContent(content);
		QnaDAO dao = new QnaDAO();
		dao.modifyQna(qna);
		
		String url = request.getContextPath() + "/detail.do?no=" + no;
		return "redirect :" + url;
	}
	
}
