package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet{
	private HandlerMapping mappings;

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String propLoc = config.getInitParameter("propLocation");
		mappings = new HandlerMapping(propLoc);
		//System.out.println("mapping객체를 만들었습니다.");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		try {
			Controller control = mappings.getController(uri);
			if(control != null) {
				String callPage = control.handleRequest(request, response);
				if(callPage.startsWith("redirect :")) {
					response.sendRedirect(callPage.substring("redirect :".length()));
				} else {
					System.out.println("여기안들어옴?");
					RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
					dispatcher.forward(request, response);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
}
