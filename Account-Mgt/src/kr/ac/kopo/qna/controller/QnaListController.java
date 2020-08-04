package kr.ac.kopo.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class QnaListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaDAO dao = new QnaDAO();
		List<QnaVO> list = dao.selectQna();
		
		request.setAttribute("list", list);
		
		return "/qna/qnaList.jsp";
	}
	
}
