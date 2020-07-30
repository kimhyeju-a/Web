package kr.ac.kopo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.login.vo.LoginVO;

public class LogoutController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
		String msg = userVO.getId() + "님이 로그아웃하셨습니다.";
		String url = request.getContextPath();
		session.invalidate();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/login/logout.jsp";
	}
	
}
