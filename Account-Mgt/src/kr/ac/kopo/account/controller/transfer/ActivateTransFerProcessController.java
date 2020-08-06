package kr.ac.kopo.account.controller.transfer;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class ActivateTransFerProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member = (MemberVO)session.getAttribute("userVO");
		
		
		String msg = "";
		String url = "";
		
		int fromAccount = Integer.parseInt(request.getParameter("fromAccount"));
		int money = Integer.parseInt(request.getParameter("balance"));
		String toAccountBank = request.getParameter("toAccountBank");
		String toAccountNumber = request.getParameter("toAccountNumber");
		
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.selectByNo(fromAccount);
		
		int toAccount = dao.checkAccountNumber(toAccountBank, toAccountNumber);
		
		if(dao.acivateTransFer(fromAccount, toAccount, money, account)) {
			msg += "계좌이체가 정상 처리되었습니다";
			url += request.getContextPath() + "/selectAccount.do?userNo=" + member.getMemberNo()+"&msg=";
		}else {
			msg += "계좌이체가 실패하였습니다. 다시 시도해주세요";
			url += request.getContextPath() + "/transfer.do?msg=";
		}
		
		msg = URLEncoder.encode(msg, "utf-8");
		
		return "redirect :" + url + msg;
	}

}
