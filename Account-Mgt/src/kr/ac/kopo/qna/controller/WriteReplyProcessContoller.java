package kr.ac.kopo.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class WriteReplyProcessContoller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		int no = Integer.parseInt(request.getParameter("no"));

		QnaVO qna = new QnaVO();
		QnaVO parentQna = new QnaVO();
		QnaDAO dao = new QnaDAO();
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		qna.setWriter(writer);
		qna.setTitle(title);
		qna.setContent(content);

		// group_order와 depth를 얻어온다.
		parentQna = dao.selectDepthGroupOrder(no);
		// 부모글과 같은 그룹을 가지고 있는 게시물의 group_order 값을 +1 한다.
		dao.updateGroupOrder(parentQna);
		dao.insertReplyQna(qna, parentQna);
		int seqNo = dao.selectSequenceNo() - 1;
		String url = request.getContextPath() + "/detail.do?no=" + seqNo;
		return "redirect :" + url;
	}

}
