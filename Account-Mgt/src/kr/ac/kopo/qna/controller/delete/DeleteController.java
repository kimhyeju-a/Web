package kr.ac.kopo.qna.controller.delete;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;

public class DeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		String url = "";
		int no = Integer.parseInt(request.getParameter("no"));
		QnaDAO dao = new QnaDAO();
		boolean bool = dao.deleteQna(no);
		if(bool) {
			msg = "정상 삭제되었습니다.";
			url = "/qnaList.do?msg=";
		}else {
			msg = "삭제가 되지 않았습니다. 다시 시도부탁드립니다.";
			url = "/detail.do?no=" + no + "&msg=";
		}
		
		msg = URLEncoder.encode(msg, "utf-8");
		
		return url + msg;
	}

}
