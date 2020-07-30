package kr.ac.kopo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.login.dao.LoginDAO;
import kr.ac.kopo.login.vo.LoginVO;

public class LoginProcessController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		String msg = "";
		String url = "";
		if(userVO == null) {
			//로그인 실패
			msg = "로그인을 실패하였습니다\\n로그인  페이지로 이동합니다";
			url = request.getContextPath() + "/login.do"; 
			//얘는 forward, include, xml 이 아니므로 /가 localhost:9999다음부터 시작한다.
		} else {
			//로그인 성공
			msg = "로그인 성공하였습니다.";
			url = request.getContextPath();
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/login/loginProcess.jsp";
	}
}
