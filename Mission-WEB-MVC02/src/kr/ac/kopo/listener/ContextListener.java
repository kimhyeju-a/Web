package kr.ac.kopo.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.member.dao.MemberDAO;

@WebListener
public class ContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("리스너 종료.");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("리스너 시작");
		
		ServletContext sc = event.getServletContext();
		
		sc.setAttribute("boardDAO", new BoardDAO());
		sc.setAttribute("memberDAO", new MemberDAO());
	}
	
}
