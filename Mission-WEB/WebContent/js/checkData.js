/**
 * form 관련 기능 파일 
 */

/**
 * form 필수항목을 체크하기 위함
 * @param obj text의 이름
 * @param msg alert에 띄울 메시지 
 * @returns
 */
function isNull(obj, msg) {
	if (obj.value == '') {
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}
