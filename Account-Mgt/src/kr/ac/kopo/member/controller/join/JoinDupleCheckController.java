package kr.ac.kopo.member.controller.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;

public class JoinDupleCheckController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();
		String type = request.getParameter("type");
		if(type.equals("id")) {
			String id = request.getParameter("id");
			boolean idCheck = dao.idCheck(id);
			request.setAttribute("check", idCheck);
		}else if(type.equals("jumin")) {
			String jumin = request.getParameter("jumin");
			boolean juminCheck = dao.juminCheck(jumin);
			request.setAttribute("juminCheck", juminCheck);
		}
		return "/jsp/join/dupleCheck.jsp";
	}
}
