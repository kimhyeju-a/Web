package kr.ac.kopo.qna.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.qna.dao.QnaDAO;
import kr.ac.kopo.qna.vo.QnaVO;

public class QnaListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaDAO dao = new QnaDAO();
		List<QnaVO> list = dao.selectQna();
		
		request.setAttribute("list", list);
		
		//게시판 타이틀 옆에 new를 띄우기 위함
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR, -12); //12시간전
        String nowday = format.format(cal.getTime());
        request.setAttribute("nowday",nowday);
		return "/jsp/qna/qnaList.jsp";
	}
	
}
