package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id = request.getParameter("id");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("  <head>");
		out.println("  		<title>메소드 호출결과 </title>");
		out.println("  </head>");
		out.println("  <body>");
		out.println("======================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println("======================================<br>");
		out.println("파아미터(id) : " + id + "<br>");
		out.println("요청방식 : " + method + "<br>");
		out.println("URI : " + uri + "<br>");
		out.println("URL : " + url + "<br>");
		out.println("======================================<br>");
		out.println("  </body>");
		out.println("</html>");

		out.flush();
		out.close();
		/*
		 * System.out.println("메소드 : " + method); System.out.println("uri: " + uri);
		 * System.out.println("url: " + url); System.out.println("ID: " + id);
		 */
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String method = request.getMethod();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id = request.getParameter("id");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("  <head>");
		out.println("  		<title>메소드 호출결과 </title>");
		out.println("  </head>");
		out.println("  <body>");
		out.println("======================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println("======================================<br>");
		out.println("파아미터(id) : " + id + "<br>");
		out.println("요청방식 : " + method + "<br>");
		out.println("URI : " + uri + "<br>");
		out.println("URL : " + url + "<br>");
		out.println("======================================<br>");
		out.println("  </body>");
		out.println("</html>");

		out.flush();
		out.close();
	}

//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String method = request.getMethod();
//		System.out.println("요청방식 : " + method);
//	}

}
