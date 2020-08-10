package kr.ac.kopo.member.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class MyPageDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String msg = "";
		String url = "";
		
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int memberNo = member.getMemberNo();

		String password = request.getParameter("password");

		MemberDAO dao = new MemberDAO();
		if (dao.passwordCheck(password, memberNo)) {
			if (dao.deleteMember(member)) {
				msg = "회원탈퇴가 완료되었습니다.";
				session.invalidate();
				url = "/main.do";
			} else {
				msg = "회원탈퇴에 실패하였습니다.";
				url = "/mypage.do";
			}
		} else {
			msg = "비밀번호가 맞지 않습니다.";
			url = "/mypage.do";
		}
		
		request.setAttribute("msg", msg);
		return url;
	}

}
