/**
 * account 를 이용할 때 쓰는 함수
 */

/**
 * 은행에 따른 - 자동설정
 * @param obj
 * @returns 
 */
function autoHypen(obj){
	var temp = obj.value;
	obj.value = temp.replace(/[^0-9\-]*$/g, "");
	
	console.log('temp : ' + temp)
	console.log('obj.value : ' + obj.value)
	
	
	var number = temp.replace(/[^0-9]/g, '');
	var account = ''
		
	var bankName = $('.select-bank  option:selected').text()
	console.log(bankName)
	//하나은행 3-6-5
	if(bankName == '하나은행'){
		$(obj).attr("maxlength","16");
		if(number.length < 4){
			return number
		} else if (number.length < 10) {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3);
		} else {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3,6);
			account += "-";
			account += number.substr(9);
		}
		console.log("hana : "  + account)
	}
	//신한은행 3-3-6
	else if (bankName == "신한은행"){
		$(obj).attr("maxlength","14");
		if(number.length < 4){
			return number
		} else if (number.length < 7) {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3);
		} else {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3,3);
			account += "-";
			account += number.substr(6);
		}
	} 
	//국민은행 6-2-6
	else if (bankName == "국민은행"){
		$(obj).attr("maxlength","16");
		if(number.length < 7){
			return number
		} else if (number.length < 9) {
			account += number.substr(0,6);
			account += "-";
			account += number.substr(6);
		} else {
			account += number.substr(0,6);
			account += "-";
			account += number.substr(6,2);
			account += "-";
			account += number.substr(8);
		}
	} 
	//우리은행 4-3-6
	else if (bankName == "우리은행"){
		$(obj).attr("maxlength","15");
		if(number.length < 5){
			return number
		} else if (number.length < 8) {
			account += number.substr(0,4);
			account += "-";
			account += number.substr(4);
		} else {
			account += number.substr(0,4);
			account += "-";
			account += number.substr(4,3);
			account += "-";
			account += number.substr(7);
		}
	} 
	//기업은행 3-6-2-3
	else if (bankName == "기업은행"){
		$(obj).attr("maxlength","17");
		if(number.length < 3){
			return number
		} else if (number.length < 10) {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3);
		} else if (number.length < 12){
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3,6);
			account += "-";
			account += number.substr(9);
		} else {
			account += number.substr(0,3);
			account += "-";
			account += number.substr(3,6);
			account += "-";
			account += number.substr(9,2);
			account += "-";
			account += number.substr(11);
		}
	}
	
	$(obj).val(account);
}

function trimDiff(obj){
	var temp = $(obj).val();
	$(obj).val(temp.replace(/[^0-9 \-]*$/g, ""));
}