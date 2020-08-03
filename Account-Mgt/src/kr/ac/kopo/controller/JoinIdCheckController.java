package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.member.dao.MemberDAO;

public class JoinIdCheckController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		boolean idCheck = dao.idCheck(id);
		request.setAttribute("check", idCheck);
		
		return "/join/idCheck.jsp";
	}
}
