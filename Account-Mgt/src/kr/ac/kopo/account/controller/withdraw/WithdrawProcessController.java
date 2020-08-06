package kr.ac.kopo.account.controller.withdraw;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class WithdrawProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member = (MemberVO) session.getAttribute("userVO");

		int accountNo = Integer.parseInt(request.getParameter("accountNo"));
		int money = Integer.parseInt(request.getParameter("balance"));
		String msg = "";
		String url = "";
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.selectByNo(accountNo);

		int withdraw = dao.withdraw(accountNo, money, account);
		if (withdraw == 2) {
			msg += "잔액 : " + account.getBalance() + ", 출금액 : " + money + " 잔액이 부족합니다.";
			url = request.getContextPath() + "/withdraw.do?msg=";
		} else if (withdraw == 0) {
			msg += "업무가 취소되었습니다. 다시 시도해주세요";
			url = request.getContextPath() + "/withdraw.do?msg=";
		} else {
			msg += "정상처리되었습니다.";
			url = request.getContextPath() + "/selectAccount.do?userNo=" + member.getMemberNo() + "&msg=";
		}
		msg = URLEncoder.encode(msg, "utf-8");

		return "redirect :" + url + msg;
	}

}
