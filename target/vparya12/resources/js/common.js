var prefix = '/vparya12';

var dthNumberFlag = false;
var mobileNumberFlag = false;
var networkFlag = false;
var userNameFlag = false;
var altNumberFlag = false;
var amountFlag = false;
var validityFlag = false;
var paymentFlag = false;

function checkNumber(data){
	var reg = /^\d+$/;
	if(data==null || data==""){
		return false;
	}else{
		if(reg.test(data)){
			return true;
		}else{
			return false;
		}
	}
}

function checkAlphabets(){
	var reg = /^[a-zA-Z]*$/;
	var data = $("#network").val();
	if(reg.test(data)){
		return true;
	}else{
		return false;
	}
}

function countDigits(data){
	if(data.length==10){
		return true;
	}else{
		return false;
	}
}

function validateDthNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(checkNumber(data)){
		if(data.length==16){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			dthNumberFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}

function validateMobileNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(checkNumber(data)){
		if(countDigits(data)){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			mobileNumberFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}
function validateNetwork(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0){
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}else{
		if(checkAlphabets()){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			networkFlag= true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
}
function validateAltNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0 || data==0){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		altNumberFlag = true;
	}else{
		if(checkNumber(data)){
			if(countDigits(data)){
				$("#"+imgId).attr("src","./resources/img/checked.gif");
				altNumberFlag = true;
			}else{
				$("#"+imgId).attr("src","./resources/img/unchecked.gif");
				return false;
			}
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
}
function validateUserName(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0){
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}else{
		if(checkAlphabets()){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			userNameFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
}
function validateAmount(value,imgId,object){
	var data = $("#"+value).val();
	if( checkNumber(data)){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		amountFlag = true;
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}
function validateValidity(value,imgId,object){
	var data = $("#"+value).val();
	if( checkNumber(data)){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		validityFlag = true;
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}

//To close New Mobile Form
var closeOpenForm = function(formId,divId,object){
	$("#"+formId+" form img").attr("src","");
	$("#resetButton").click();
	$("#"+divId).css("display","none");
}

//To Open Form
var openNewForm = function(){
	$("#newOverlay").css("display","block");
}

var openLoginPage = function(){
	$("#loginOverlay").css("display","block");
	return false;
}

var openSignupPage = function(){
	$("#signupOverlay").css("display","block");
	return false;
}

function formSubmit(){
	document.getElementById("logoutForm").submit();
}