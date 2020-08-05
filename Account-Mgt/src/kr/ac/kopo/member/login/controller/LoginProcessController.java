package kr.ac.kopo.member.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		MemberVO member = null;
		String id = request.getParameter("id");
		String url = request.getContextPath();
		boolean idCheck;
		String params = "";
		String msg = "";
		// 카카오 계정인 경우에만
		if (id.startsWith("@k")) {
			System.out.println("카카오계정입니다");
			
			member = new MemberVO();
			idCheck = dao.idCheck(request.getParameter("id"));
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			member.setId(id);
			member.setEmail(email);
			member.setName(name);
			session.setAttribute("kakaoVO", member);
			// 아이디가 없는경우 세션에 등록 후, join.jsp로 보낸다.
			System.out.println("idCheck : " +idCheck);
			if (!idCheck) {
				url += "/jsp/join/joinForm.jsp";
			}else {
				session.setAttribute("userVO",member);
				System.out.println("url :" + url);
			}
		} else {
			System.out.println("일반계정입니다.");
			
			String password = request.getParameter("password");
			System.out.println("id : " + id + ",password : " + password);
			params = "";
			member = new MemberVO();
			member.setId(id);
			member.setPassword(password);

			// DB에서 사용자 check
			dao = new MemberDAO();

			// 반환값이 null 이면 로그인 실패
			// 반환값이 LoginVO 객체라면 로그인 성공
			MemberVO userVO = dao.login(member);
			msg = "";
			if (userVO == null) {
				msg = "로그인을 실패하였습니다.";
				url += "/login.do";
				System.out.println("URL : "+url);
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
			params = "msg=" + msg;
		}
		return "redirect :" + url +"?" + params;
	}
}
