package kr.ac.kopo.qna.modify.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;

public class ModifyController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String password = request.getParameter("password");
		int no = Integer.parseInt(request.getParameter("no"));
		String url = request.getContextPath();
		MemberDAO dao = new MemberDAO();
		boolean modifyPasswordBool = dao.passwordCheck(password);
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
