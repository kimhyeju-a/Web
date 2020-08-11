package kr.ac.kopo.account.controller.history;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.history.dao.HistoryDAO;
import kr.ac.kopo.history.vo.HistoryVO;

public class AccountHistoryController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int accountNo = Integer.parseInt(request.getParameter("accountNo"));
		HistoryDAO dao = new HistoryDAO();
		List<HistoryVO> history = dao.selectHistoryList(accountNo);
		
		request.setAttribute("list", history);
		
		return "/jsp/account/history/history.jsp";
	}

}
