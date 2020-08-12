package kr.ac.kopo.framework;

import java.util.HashMap;
import java.util.Map;

/*
	Model : JSP에서 사용할 데이터 저장 객체 ( request 공유 영여에 등록)
	View : 포워드 시킬 JSP 주소 or  리다이렉트 시킬 가상주소 정보 저장
 */
public class ModelAndView {
	private String view;
	private Map<String, Object> model;
	
	
	public ModelAndView() {
		model = new HashMap<>();
	}


	public ModelAndView(String view) {
		this(); // 모델 객체도 만들어야 하므로 
		this.view = view;
	}


	public String getView() {
		return view;
	}


	public void setView(String view) {
		this.view = view;
	}


	public Map<String, Object> getModel() {
		return model;
	}


	public void setModel(Map<String, Object> model) {
		this.model = model;
	}
	
	public void addAttribute(String key, Object value) {
		model.put(key, value);
	}
}
