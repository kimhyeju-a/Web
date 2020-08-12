package kr.ac.kopo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = "*", initParams = {@WebInitParam(name="encoding", value="utf-8")})
public class EncodingFilter implements Filter{
	private FilterConfig config;
	@Override
	public void destroy() {
		System.out.println("filter 소멸....");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("filter작업 수행");
		String encoding = config.getInitParameter("encoding");
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	@Override	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("filter생성....");
		config = filterConfig;
		Filter.super.init(filterConfig);
	}

}



