package kr.ac.kopo.qna.controller.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.vo.QnaVO;
import kr.ac.kopo.qna.dao.QnaDAO;

public class WriteProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		QnaVO qna = new QnaVO();
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writerId = request.getParameter("writerId");
		qna.setWriter(writer);
		qna.setTitle(title);
		qna.setContent(content);
		qna.setWriterId(writerId);
		System.out.println("WriteProcessController : " + writerId);
		QnaDAO dao = new QnaDAO();
		dao.insertOriQna(qna);
		
		
		int seqNo = dao.selectSequenceNo() - 1;
		String url = request.getContextPath() + "/detail.do?no=" + seqNo + "&id=" + writerId;
		return "redirect :" + url;
	}
	
}
