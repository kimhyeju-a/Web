package kr.ac.kopo;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/* 목적 url mapping
		case "/list.do" :
			control = new ListController();
			break;
		case "/write.do" :
			control = new WriteController();
			break;
 */
public class HandlerMapping {
	
	private Map<String, Controller> mappings = null;
	
	public HandlerMapping(String propLoc) {
		mappings = new HashMap<String, Controller>();
		Properties prop = new Properties();
		try {
			InputStream inStream = new FileInputStream(propLoc);
			prop.load(inStream);
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());
				Class<?> clz = Class.forName(className);
				Controller control = (Controller)clz.newInstance();
				
				System.out.println(className); 
				//className은 인스턴스객체를 알고 있는 것이 아니라 kr.ac.kopo.ListController라는 문자열을 알고있음
				mappings.put(key.toString(), control);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
//	
//	public static void main(String[] args) throws Exception {
//		
////		java.util.Random r = new java.util.Random();
////		int random = r.nextInt(100);
////		System.out.println("random : " + random);
//		/*
//		//java.util.Random를 이용하고 싶다.
//		Class<?> clz = Class.forName("java.util.Random");
//		//인스턴스를 만드는 행동
//		java.util.Random obj = (java.util.Random)clz.newInstance();
//		System.out.println(obj.nextInt(100));
//		*/
//		/*
//		Class<?> clz = Class.forName("kr.ac.kopo.ListController");
//		ListController obj = (ListController)clz.newInstance();
//		obj.handleRequest(null, null);
//		*/
//	}
}
