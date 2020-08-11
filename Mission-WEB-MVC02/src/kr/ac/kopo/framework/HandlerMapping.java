package kr.ac.kopo.framework;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.framework.annotaion.RequestMapping;

/*
 * key : 요청 uri
 * value : controller + method
 */

public class HandlerMapping {
	
	private Map<String, CtrlAndMethod> mappings;
	public HandlerMapping(String ctrlNames) throws Exception {
		/*
			ctrlNames에는 kr.ac.kopo.board.controller.BoardController | kr.ac.kopo.login.controller.LoginController형태로 값이 날라오고 있을 것이다.
		 */
		mappings = new HashMap<>();
		
		String[] ctrls = ctrlNames.split("\\|");
		
		for(String ctrl : ctrls) {
//			System.out.println(ctrl);
			
			Class<?> clz = Class.forName(ctrl.trim());
			Object target = clz.newInstance();
//			boardController에 어떤 메소드를 뽑아야 하는가
			Method[] methods = clz.getMethods();
			for(Method method : methods) {
//				System.out.println(method);
//			수많은 method 들 중에, RequestMapping 어노테이션을 가지고 있는 애들만 뽑아오고 싶다.
				RequestMapping reqAnno = method.getAnnotation(RequestMapping.class);
//				System.out.println("reqAnno : " + reqAnno);
				
				if(reqAnno != null) {
					String uri = reqAnno.value();
					CtrlAndMethod cam = new CtrlAndMethod(target, method);
					mappings.put(uri, cam);
				}
			}
			
		}
		
	}
	
	public CtrlAndMethod getCtrlAndMethod(String uri) {
		return mappings.get(uri);
	}

}
