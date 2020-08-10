package kr.ac.kopo.qna.controller.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class WriteProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		
		QnaVO qna = new QnaVO();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writerId = request.getParameter("writerId");
		qna.setWriterNo(member.getMemberNo());
		qna.setTitle(title);
		qna.setContent(content);
		
		QnaDAO dao = new QnaDAO();
		dao.insertOriQna(qna);
		
		int seqNo = dao.selectSequenceNo() - 1;
		String url = request.getContextPath() + "/detail.do?no=" + seqNo + "&id=" + writerId;
		return "redirect :" + url;
	}
	
}
