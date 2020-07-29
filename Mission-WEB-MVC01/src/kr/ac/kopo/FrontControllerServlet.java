package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		System.out.println("요청 URI : " + uri);
		String callPage = "";
		try {
			switch(uri) {
			case "/list.do" :
				ListController list = new ListController();
				// 응답하려고 하는 대상의 주소가 callPage 가 안다. callPage를 이용해 forword 를 한다.
				// 자바에서는 액션포워드를 쓸 수 없다. servlet자체에서 forword를 할 수 있는 것 : request
				callPage = list.handleRequest(request, response);
				break;
			case "/write.do" :
				WriteController write = new WriteController();
				callPage = write.handleRequest(request, response);
				break;
			}
			
			if(callPage != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
}
