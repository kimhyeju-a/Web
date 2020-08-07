package kr.ac.kopo.account.controller.insert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;

public class AccountDupleCheckController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		AccountDAO dao = new AccountDAO();
		String type = request.getParameter("type");
		if(type.equals("accountNumber")) {
			String accountNumber = request.getParameter("accountNumber");
			boolean accountNumberCheck = dao.accountNumberCheck(accountNumber);
			request.setAttribute("accountNumberCheck", accountNumberCheck);
		}
		return "/jsp/account/insertAccount/dupleAccountCheck.jsp";
	}

}
