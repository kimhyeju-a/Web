package kr.ac.kopo.account.controller.deposit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class DepositFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member = (MemberVO)session.getAttribute("userVO");
		
		AccountDAO dao = new AccountDAO();
		List<AccountVO> list = dao.selectAccountList(member.getMemberNo());
		
		request.setAttribute("list", list);
		
		return "/jsp/account/deposit/depositForm.jsp";
	}

}
