package kr.ac.kopo.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class Test implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String password = request.getParameter("password");
		String id = request.getParameter("id");
		System.out.println(id);
		System.out.println(password);
		return null;
	}
	
}
