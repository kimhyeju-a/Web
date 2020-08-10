package kr.ac.kopo.member.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class MyPageModifyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("userVO");
		String msg = "";
		String url = "";
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String password = request.getParameter("password");
		member.setName(name);
		member.setEmail(email);
		member.setPhoneNo(tel);
		int memberNo = member.getMemberNo();
		
		MemberDAO dao = new MemberDAO();
		if(dao.passwordCheck(password, memberNo)) {
			if(dao.modifyMember(member)) {
				msg = "회원정보 수정이 완료되었습니다.";
				System.out.println(memberNo);
			}else {
				msg = "회원정보 수정에 실패하였습니다.";
			}
		}else {
			msg = "비밀번호가 맞지 않습니다.";
		}
		System.out.println(msg);
		request.setAttribute("msg", msg);
		member = dao.selectOneMebmer(memberNo);
		session.setAttribute("userVO", member);
		url = "/mypage.do";
		return url;
	}

}
