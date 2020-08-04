package kr.ac.kopo.member.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class JoinProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO member = new MemberVO();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setJumin(request.getParameter("jumin"));
		member.setPhoneNo(request.getParameter("tel"));
		
		
		MemberDAO dao = new MemberDAO();
		dao.insertMember(member);
		
		String msg = "회원가입에 성공하였습니다.\\n로그인페이지로 이동합니다.";
		String url = request.getContextPath() + "/login.do";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/join/joinProcess.jsp";
	}

	
}
