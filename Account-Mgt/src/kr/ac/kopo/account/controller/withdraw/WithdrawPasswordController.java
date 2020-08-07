package kr.ac.kopo.account.controller.withdraw;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class WithdrawPasswordController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String msg = "";
		int accountNo = Integer.parseInt(request.getParameter("accountNo"));
		String password = request.getParameter("password");
		int balance = Integer.parseInt(request.getParameter("balance"));
		AccountVO vo = new AccountVO();
		String url = request.getContextPath();
		AccountDAO dao = new AccountDAO();
		AccountVO passwordCheck = dao.passwordCheck(accountNo, password);
		System.out.println(passwordCheck +"===================================");
		if(passwordCheck != null) {
			url = "redirect :" + request.getContextPath() + "/withdrawProcess.do?accountNo=" + accountNo + "&balance=" + balance;
			System.out.println(url +"===================================");
			return url;
		}
		msg = "패스워드가 맞지 않습니다. 다시 시도해주세요.";
		msg = URLEncoder.encode(msg, "utf-8");
		System.out.println(url +"===================================");
		return "redirect :" + request.getContextPath() + "/withdraw.do?msg=" + msg;
	}
	
}
