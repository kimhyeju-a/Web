package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

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
				
				mappings.put(key.toString(), control);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}
