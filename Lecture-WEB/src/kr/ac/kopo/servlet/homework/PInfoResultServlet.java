package kr.ac.kopo.servlet.homework;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PInfoResultServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String[] mail = request.getParameterValues("mail");
		String job = request.getParameter("job");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title> 혜주's 과제</title");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인 정보 출력</h2><br>");
		out.println("이름 : " + name + "<br>");
		out.println("아이디 : " + id + "<br>");
		out.println("암호 : " + pwd + "<br>");
		out.println("성별 : " + sex + "<br>");
		out.println("공지메일 : " + ((Arrays.asList(mail).contains("공지 메일"))?"받음":"받지않음")+ "<br>");
		out.println("광고메일 : " + ((Arrays.asList(mail).contains("광고 메일"))?"받음":"받지않음") + "<br>");
		out.println("배송 확인 메일 : " + ((Arrays.asList(mail).contains("배송 확인 메일"))?"받음":"받지않음") + "<br>");
		out.println("직업 : " + job + "<br>");
		out.println("</body>");
		out.println("</html>");
		
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("sex : " + sex);
		System.out.println("mail : " + mail);
	}
	
}
