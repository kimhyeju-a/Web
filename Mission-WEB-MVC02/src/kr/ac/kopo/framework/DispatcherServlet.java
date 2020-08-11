package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "controllers", value = "kr.ac.kopo.board.controller.BoardController"
															+ "|kr.ac.kopo.member.controller.MemberController")
		})
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HandlerMapping mappings;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		String ctrlNames = config.getInitParameter("controllers");
		System.out.println(ctrlNames);
		try {
			mappings = new HandlerMapping(ctrlNames);
		}catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		/* /Mission-WEB-MVC02/login.do 형태로 나온다. ==> ContextPath 만큼 잘라낸다. */
		
//		System.out.println("url : " + uri); 
		uri = uri.substring(request.getContextPath().length());
		System.out.println("url : " + uri);
		
		/* uri 의 값을 가지고 어느 컨트롤러로 가야되는지 안다 */
		CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
		String view = "";
		try {
			if(cam == null) {
				throw new Exception("요청 URL은 존재하지 않습니다.");
			}
			/* 
				메소드를 실행시켜볼까효
				동적으로 메소드를 실행할 수 있도록 한다.  
			*/
			Object target = cam.getTarget();
			Method method = cam.getMethod();
			/*
				메소드가 매개변수가 없다면 method.invoke(target)으로만 써도 된다.
				RequestMapping 어노테이션을 가지고 있는 메소드들은 모두 Request, Response 매개변수를 가지고 있어야 한다.
			 */
			view = (String)method.invoke(target, request, response);
		} catch (Exception e) {
			response.setContentType("html/text; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());

//			추후 에러메시지 화면 따로 구성..........
		}
		/*
				주소 매핑(?) 포워드를 한다.
		 */
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
