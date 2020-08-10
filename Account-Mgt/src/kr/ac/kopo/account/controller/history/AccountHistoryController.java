package kr.ac.kopo.account.controller.history;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class AccountHistoryController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("test", "test");
		return "/jsp/account/history/history.jsp";
	}

}
