package kr.ac.kopo.controller;

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
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
}
