package kr.ac.kopo.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;

public class WriteReplyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		System.out.println("WriteReplyController no : " + no);
		//부모의 번호를 세션에 등록시킨다.
		HttpSession session = request.getSession();
		session.setAttribute("parentNo", no);

		return "/jsp/qna/writeForm.jsp";
	}

}
