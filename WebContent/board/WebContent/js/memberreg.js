/**
 * 
 */

function telcheck123() {
	telvalue = $('#telcode').val().trim();
	if (telvalue.length < 1) {
		alert("인증번호를 입력해주세요");
		return false;
	}
	return true;
}

function telcheck321() {
	telvalue2 = $('#tel').val().trim();
	hpReg = /^[0-9]*$/;
	if (telvalue2.length < 1) {
		alert("전화번호를 입력해주세요");
		return false;
	}else if(!hpReg.test(telvalue2)){
		alert("전화번호를 다시입력 해주세요");
		return false;
	}
		return true;
}


function mailcheck() {
	mailvalue = $('#mailcode').val().trim();

	if (mailvalue.length < 1) {
		alert("인증번호를 입력해주세요")
		return false;
	}
	return true;
}

function idcheck() {
	idvalue = $('#id').val().trim();

	idreg = /^[a-z]+[a-z0-9]{5,19}$/;
	if (!(idreg.test(idvalue))) {
		return false;
	}
	return true;
}

function passcheck() {
	passvalue = $('#pass1').val();

	passReg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,15}$/;
	if (!(passReg.test(passvalue))) {
		return false;
	}
	return true;

}

//function telcheck() {
//	hpValue = $("#tel").val().trim();
//	hpReg = /^[0-9]*$/;
//	if (!hpReg.test(hpValue)) {
//		return false;
//	}
//	return true;
//}

// function nickcheck(){
// nickvalue = $('#nick').val();
//	
// if(nickvalue == null){
// na = "닉네임을 입력해주세요.";
// $("#namespan").html(na).css("color","red");
// return false;
// }else if(nickvalue.lenght > 3){
// na = "닉네임은 3글자 이상입니다.";
// $("#namespan").html(na).css("color","red");
// }
//	
// }

//function regcheck(check) {
//	if (check == "name") {
//		nameValue = $("#name").val().trim();
//
//		nameReg = /^[가-힣]{2,4}$/;
//		if (!nameReg.test(nameValue)) {
//			na = "이름형식오류";
//			$("#namespan").html(na).css("color", "red");
//			return false;
//		} else {
//			na = "사용가능";
//			$("#namespan").html(na).css("color", "green");
//
//		}
//
//	} else if (check == "pwd") {
//
//		// 비밀번호, 공백, 길이, 정규식
//		passValue = $("#pwd").val().trim();
//
//		passReg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,15}$/;
//		if (!passReg.test(passValue)) {
//			pa = "비밀번호 형식오류";
//			$("#passspan").html(pa).css("color", "red");
//			return false;
//
//		} else {
//			pa = "사용가능";
//			$("#passspan").html(pa).css("color", "green");
//
//		}
//	} else if (check == "pwd2") {
//
//		passValue = $("#pwd").val().trim();
//		passValue2 = $("#pwd2").val().trim();
//
//		if (passValue != passValue2) {
//			na = "비밀번호가 일치하지 않습니다.";
//			$("#passspan2").html(na).css("color", "red");
//			return false;
//		} else {
//			na = "비밀번호 일치";
//			$("#passspan2").html(na).css("color", "green");
//		}
//
//	} else if (check == "ph") {// 전화번호 - 공백 정규식
//		hpValue = $("#ph").val().trim();
//		hpReg = /^\d{3}-\d{3,4}-\d{4}$/;
//		if (!hpReg.test(hpValue)) {
//			pa = "전화번호 형식오류";
//			$("#hpspan").html(pa).css("color", "red");
//			return false;
//
//		} else {
//			pa = "사용가능";
//			$("#hpspan").html(pa).css("color", "green");
//
//		}
//
//	} else if (check == "email") {
//		mailValue = $("#email").val().trim();
//		mailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//		if (!mailReg.test(mailValue)) {
//			ma = "이메일 형식오류";
//			$("#mailspan").html(ma).css("color", "red");
//			return false;
//
//		} else {
//			ma = "사용가능";
//			$("#mailspan").html(ma).css("color", "green");
//
//		}
//
//	} else if (check == "bir") {
//		birValue = $("#bir").val().trim();
//		year = parseInt(birValue.substring(0, 4));
//		month = parseInt(birValue.substring(5, 7));
//		day = parseInt(birValue.substring(8, 10));
//		date = new Date(year, month, day);
//		today = new Date();
//
//		if (today.getFullYear() - 10 < date.getFullYear()) {
//			br = "가입불가 나이";
//			$("#birspan").html(br).css("color", "red");
//			return false;
//		} else {
//			br = "확인 완료";
//			$("#birspan").html(br).css("color", "green");
//		}
//
//	} else if (check == "gender") {
//
//		genValue = $("#gender").val().trim();
//
//		if (genValue == "남자" || genValue == "여자") {
//			ge = "확인완료";
//			$("#genderspan").html(ge).css("color", "green");
//		} else {
//			ge = "성별을입력하세요";
//			$("#genderspan").html(ge).css("color", "red");
//			return false;
//		}
//	} else {
//
//		zip = $("#zip").val().trim();
//		add1 = $("#add1").val().trim();
//		add2 = $("#add2").val().trim();
//
//		// zip = $("#modalzip").val().trim();
//		a = 0;
//
//		if (zip == "") {
//			ge = "우편번호를 입력하세요";
//			$("#zipspan").html(ge).css("color", "red");
//			a++;
//		} else {
//			ge = "입력완료";
//			$("#zipspan").html(ge).css("color", "green");
//		}
//
//		if (add1 == "") {
//			ge = "주소를 입력하세요";
//			$("#add1span").html(ge).css("color", "red");
//			a++
//		} else {
//			ge = "입력완료";
//			$("#add1span").html(ge).css("color", "green");
//
//		}
//
//		if (add2 == "") {
//			ge = "상세주소를 입력하세요";
//			$("#add2span").html(ge).css("color", "red");
//			a++
//		} else {
//			ge = "입력완료";
//			$("#add2span").html(ge).css("color", "green");
//		}
//
//		if (a != 0) {
//			return false;
//		}
//
//	}
//
//	return true;
//}