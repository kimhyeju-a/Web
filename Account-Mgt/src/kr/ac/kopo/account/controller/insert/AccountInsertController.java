package kr.ac.kopo.account.controller.insert;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class AccountInsertController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String bankName = request.getParameter("bankName");
		String accountNumber = request.getParameter("accountNumber");
		int firstDeposit = Integer.parseInt(request.getParameter("firstDeposit"));
		String alias = request.getParameter("alias");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String password = request.getParameter("password");
		String msg = "";
		String url = request.getContextPath();
		
		
		AccountVO account = new AccountVO();
		account.setBankName(bankName);
		account.setAccountNumber(accountNumber);
		account.setBalance(firstDeposit);
		account.setAlias(alias);
		account.setUserNo(userNo);
		account.setAccountPw(password);
		
		AccountDAO dao = new AccountDAO();
		if(dao.newAccountNumber(account) == 1) {
			msg = "계좌등록이 완료되었습니다.";
			url += "/selectAccount.do";
		}else {
			msg = "계좌등록에 실패하였습니다. 다시 등록해주세요";
			url += "/insertAccountForm.do";
		}
		msg = URLEncoder.encode(msg,"utf-8");
		
		return "redirect :" + url +"?msg=" + msg;
	}
	
}
	