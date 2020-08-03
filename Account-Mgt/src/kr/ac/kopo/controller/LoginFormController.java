package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginFormController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		MemberVO member = null;
		String id = request.getParameter("id");
		String url = request.getContextPath();
		boolean idCheck;
		System.out.println("id" + id);
		// 카카오 계정인 경우에만
		if (id.startsWith("@k")) {
			member = new MemberVO();
			idCheck = dao.idCheck(request.getParameter("id"));

			String email = request.getParameter("email");
			String name = request.getParameter("name");
			member.setId(id);
			member.setEmail(email);
			member.setName(name);
			session.setAttribute("memberVO", member);

			// 아이디가 있는 경우 세션에 등록 후, index.jsp로 보낸다.
			if (idCheck) {
				System.out.println("어디로갔니" + idCheck);
			} else {
				url += "/join/joinForm.jsp";
				System.out.println("어디로갔니" + idCheck);
			}
		} else {
			String password = request.getParameter("password");
			member = new MemberVO();
			member.setId(id);
			member.setPassword(password);

			// DB에서 사용자 check
			dao = new MemberDAO();

			// 반환값이 null 이면 로그인 실패
			// 반환값이 LoginVO 객체라면 로그인 성공
			MemberVO userVO = dao.login(member);
			String msg = "";
			if (userVO == null) {
				msg = "아이디 또는 패스워드를 잘못입력했습니다.";
				url = "/Mission-WEB/jsp/login/login.jsp";
			} else {
				// 세션 등록
				session.setAttribute("userVO", userVO);
				switch (userVO.getType()) {
				case "s":
				case "S":
					msg = "관리자님 환영합니다.";
					break;
				case "u":
				case "U":
					msg = userVO.getId() + "님 환영합니다.";
					break;
				}
			}
			return "redirect :" + url;
		}
	}
}
