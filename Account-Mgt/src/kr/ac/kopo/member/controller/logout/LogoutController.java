package kr.ac.kopo.member.controller.logout;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		String msg = userVO.getId() + "님 로그아웃하셨습니다.";
	
		session.invalidate();
		
		request.setAttribute("msg", msg);
		return "/main.do";
	}

}
