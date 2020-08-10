package kr.ac.kopo.member.controller.join;

import java.net.URLEncoder;

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
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setJumin(request.getParameter("jumin"));
		member.setPhoneNo(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));

		MemberDAO dao = new MemberDAO();
		dao.insertMember(member);

		String msg = "회원가입에 성공하였습니다. 로그인페이지로 이동합니다.";
		String url = request.getContextPath() + "/login.do";
		msg = URLEncoder.encode(msg, "utf-8");
		return "redirect :" + url + "?msg=" + msg;
	}

}
