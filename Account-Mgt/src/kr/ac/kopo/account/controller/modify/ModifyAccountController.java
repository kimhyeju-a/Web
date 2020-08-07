package kr.ac.kopo.account.controller.modify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class ModifyAccountController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("accountNo"));
		AccountDAO dao = new AccountDAO();
		
		AccountVO account = dao.selectByNo(no);
		request.setAttribute("account", account);
		
		return "/jsp/account/selectAccount/modifyAccountAlias.jsp";
	}
	 
}
