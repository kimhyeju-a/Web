/**
 * ajax와 관련된 함수 정의
 */


let httpRequest = null;
function getXMLHttpRequest(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest()
	}
	if(window.ActiveXObject){
		return new ActiveXOject("Microsoft.XMLHTTP");
	}
	return null;
}
/**
 * sendProcess
 * @param method Get or Post
 * @param url 이동할 url
 * @param param 값을 넘길 파라미터
 * @param callback 콜백함수
 * @returns
 */
function sendProcess(method, url, param, callbackFunc) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callbackFunc;
	httpRequest.open(method, url + '?' + param, true);
	httpRequest.send(null);
}
	