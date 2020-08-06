package kr.ac.kopo.account.controller.modify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class ModifyAccountProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member = (MemberVO)session.getAttribute("userVO");
		
		String alias = request.getParameter("alias");
		int accountNo = Integer.parseInt(request.getParameter("accountNo"));
		AccountDAO dao = new AccountDAO();
		dao.updateAlias(alias,accountNo);
		
		return "redirect :" + request.getContextPath() + "/selectAccount.do?userNo=" + member.getMemberNo();
	}

}
