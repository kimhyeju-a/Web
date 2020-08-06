package kr.ac.kopo.account.controller.select;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class SelectAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		AccountDAO dao = new AccountDAO();
		List<AccountVO> list = dao.selectAccountList(userNo);
		
		request.setAttribute("list", list);
		
		return "/jsp/account/selectAccount/selectAccount.jsp";
	}

}
