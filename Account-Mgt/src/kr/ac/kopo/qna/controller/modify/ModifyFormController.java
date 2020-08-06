package kr.ac.kopo.qna.controller.modify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class ModifyFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		QnaDAO dao = new QnaDAO();
		QnaVO qna = dao.selectByNo(no);
		request.setAttribute("board", qna);
		request.setAttribute("newLine", "\r\n");
		return "/jsp/qna/modifyForm.jsp";
	}
	
}
