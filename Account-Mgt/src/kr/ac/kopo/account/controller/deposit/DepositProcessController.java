package kr.ac.kopo.account.controller.deposit;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class DepositProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member = (MemberVO)session.getAttribute("userVO");
		
		String bankName = request.getParameter("bankName");
		String accountNumber = request.getParameter("accountNumber");
		int money = Integer.parseInt(request.getParameter("balance"));
		String msg = "";
		String url = "";
		AccountDAO dao = new AccountDAO();
		int acconutNo = dao.checkAccountNumber(bankName, accountNumber);
		
		if(acconutNo == 0) {
			url += request.getContextPath() + "/depositForm.do?msg=";
			msg += "계좌가 존재하지 않습니다. 확인 후 다시 시도 바랍니다.";
			msg = URLEncoder.encode(msg, "utf-8");
			return "redirect :" + url + msg;
		}else {
			boolean deposit = dao.deposit(acconutNo, money);
			if(deposit) {
				msg += accountNumber+" 계좌로 " + money +"원을 입금했습니다.";
				url = request.getContextPath() + "/selectAccount.do?userNo=" + member.getMemberNo()+"&msg=";
			}else {
				msg += "업무가 취소되었습니다. 다시 시도해주세요.";
				url = request.getContextPath() + "/depositForm.do?msg="; 
			}
		}
		msg = URLEncoder.encode(msg, "utf-8");
		
		return "redirect :" + url + msg;
	}

}
