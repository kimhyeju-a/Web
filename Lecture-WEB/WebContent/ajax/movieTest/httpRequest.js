/**
 * ajax와 관련된 함수 집합
 */
let httpRequest = null;
function getXMLHttpRequest(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	if(window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function sendProcess(method, url, params, callback) {
	// 1. http Request 를 얻어온다.
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	let httpMethod = method.toUpperCase();
	
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET';
	
	//파라미터 합침
	httpParams = params;
	if(params == null || params == '')
		httpParams = '';
	
	if(typeof(params) == 'object') {
		// json => name=value&name=value
		httpParams ='';
		for(let key in params) {
			console.log(key + ' : ' + params[key])
			if(httpParams != '')
				httpParams += '&';
			httpParams += key + '=' + encodeURIComponent(params[key]);
			console.log(httpParams);
		}
	}
	
	httpUrl = url;
	if(httpMethod == 'GET' && httpParams != ''){
		httpUrl = url + '?' + httpParams;
	} 
	
	httpRequest.open(httpMethod, httpUrl, true);
	
	if(httpMethod == 'POST') {
		httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
	}
	
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}