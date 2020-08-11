package kr.ac.kopo.framework;

import java.lang.reflect.Method;

public class CtrlAndMethod {
	
	private Object target; //어느객체의 메소드를 호출했냐가 중요하다 target은 객체를 말한다. 
	private Method method;
	
	
	public CtrlAndMethod(Object target, Method method) {
		super();
		this.target = target;
		this.method = method;
	}

	public Object getTarget() {
		return target;
	}

	public Method getMethod() {
		return method;
	}
	
}
