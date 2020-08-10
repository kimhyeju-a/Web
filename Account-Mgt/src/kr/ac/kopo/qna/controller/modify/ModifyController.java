package kr.ac.kopo.qna.controller.modify;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class ModifyController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("userVO");
		String password = request.getParameter("password");
		int no = Integer.parseInt(request.getParameter("no"));
		int memberNo = member.getMemberNo();
		String url = request.getContextPath();
		MemberDAO dao = new MemberDAO();
		boolean modifyPasswordBool = dao.passwordCheck(password, memberNo);
		String msg = "";
		if(modifyPasswordBool) {
			url += "/modifyForm.do?no=" + no;
			return "redirect :" + url;
		}
		msg = "비밀번호를 확인해주세요";
		msg = URLEncoder.encode(msg, "utf-8");
		return "redirect :" + url + "/detail.do?no=" + no + "&msg=" + msg;
	}
	
}
