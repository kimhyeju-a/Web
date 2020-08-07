package kr.ac.kopo.map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class mapController implements Controller{
@Override
public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	return "/jsp/map/map.jsp";
}
}
