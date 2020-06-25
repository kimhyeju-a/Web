package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamMethodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String[] hobbies = request.getParameterValues("hobby");
		
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>화면에띄우기 </title>");
		out.println("</head>");
		out.println("<body>");
		out.println("===============================<br>");
		out.println("name : " + name);
		out.println("<br>===============================<br>hobby : ");
		for(String hobby : hobbies) {
			out.println(hobby + " , ");
		}
		
		out.println("<br>===============================<br>");
		out.println("</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
//		System.out.println("name : " + name);
//		for(String hobby : hobbies) {
//			System.out.print("hobby : " + hobby + " , ");
//		}
	}

}
