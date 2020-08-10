package kr.ac.kopo.qna.controller.list;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class DetailController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		QnaDAO dao = new QnaDAO();
		
		String type = request.getParameter("type");
		if(type != null && type.equals("list")) {
			dao.incrementViewCnt(no);
		}
		
		QnaVO qna = dao.selectByNo(no);
		
		request.setAttribute("board", qna);
		request.setAttribute("newLine", "\r\n");
		return "/jsp/qna/detail.jsp";
	}
	
}
