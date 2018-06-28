
// to fetch all mobiledata but currently not in used
var openMobile = function() {
        $.ajax({
        type: 'GET',
        url:  prefix + '/mobiles',
        dataType: 'json',
        timeout: 100000,
        async: true,
        success: function(result) {
            alert(result.data);
            window.location.href="mobileData.jsp";
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        },
        done: function(e){
        	alert("Done!");
        }
   });
}

// To call save new Mobile Controller
var saveNewMobile = function(){
	if(mobileNumberFlag && networkFlag && userNameFlag && altNumberFlag && amountFlag && validityFlag){
		var mobileData ={};
		mobileData["mobileNumber"]=$("#mobileNumber").val();
		mobileData["network"]=$("#network").val();
		mobileData["alternativeNumber"]=$("#altNumber").val();
		mobileData["userName"]=$("#userName").val();
		mobileData["validDays"]=$("#validity").val();
		mobileData["payment"]=$('input[name=payment]:checked').val();
		mobileData["rechargeAmount"]=$("#amount").val();
		$.ajax({
			type: 'POST',
			url:  prefix + '/saveMobile',
			data: JSON.stringify(mobileData),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			timeout: 100000,
			async: true,
			success: function(result) {
				$("#overlay").css("display","none");
				$(".success").text(result.data);
				window.location.reload(false); 
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.status + ' ' + jqXHR.responseText);
			},
			done: function(e){
				alert("Done!");
			}
	   });
	}else{
		alert("Please fill the form properly.")
	}
	
}

//To call Update Controller
var updateMobile = function(){
		var mobileData ={};
		mobileData["mobileNumber"]=$("#editMobileNumber").val();
		mobileData["network"]=$("#editNetwork").val();
		mobileData["alternativeNumber"]=$("#editAltNumber").val();
		mobileData["userName"]=$("#editUserName").val();
		mobileData["validDays"]=$("#editValidity").val();
		mobileData["payment"]=$('input[name=editPayment]:checked').val();
		mobileData["lastRechargedAmount"]=$("#editAmount").val();
		var id = $("#editId").val();
		mobileData["id"] = id.substr(3,(id.length));
		$.ajax({
			type: 'POST',
			url:  prefix + '/updateMobile',
			data: JSON.stringify(mobileData),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			timeout: 100000,
			async: true,
			success: function(result) {
				$("#editOverlay").css("display","none");
				$(".success").text(result.data);
				window.location.reload(false); 
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.status + ' ' + jqXHR.responseText);
			},
			done: function(e){
				alert("Done!");
			}
	   });
}

//To call recharge Controller
var rechargeMobile = function(){
	var mobileData = {};
	mobileData["validDays"]=$("#editValidity").val();
	mobileData["payment"]=$('input[name=editPayment]:checked').val();
	mobileData["rechargeAmount"]=$("#editAmount").val();
	var id = $("#editId").val();
	mobileData["id"] = id.substr(3,(id.length));
	
	$ajax({
		type: 'POST',
		url: prefix + '/rechargeMobile',
		data: JSON.stringify(mobileData),
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
		timeout: 100000,
		async: true,
		success: function(result){
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.status + ' ' + jqXHR.responseText);
		},
		done: function(e){
			alert("Done!");
		}
	});
}

$(document).ready(function(){
	$("#mobileTable tbody tr").click(function(event){
		$(event.target).closest("tr").each(function(){
			var id = $(this).find(".column1").text();
			var mobileNumber = $(this).find(".column3").text();
			var userName = $(this).find(".column4").text();
			var network = $(this).find(".column5").text();
			var altNumber = $(this).find(".column6").text();
			var last = $(this).find(".column7").text();
			var next = $(this).find(".column8").text();
			var amount = $(this).find(".column9").text();
			var validity = $(this).find(".column10").text();
			var paid = $(this).find(".column11").text();
			//puting value
    		 $("#editId").val(id);
      		 $("#editMobileNumber").val(mobileNumber);
      		 $("#editNetwork").val(network);
      		 $("#editUserName").val(userName);
      		 $("#editAltNumber").val(altNumber);
      		 $("#editAmount").val(amount);
      		 $("#editValidity").val(validity);
      		if(paid){
      			 $("#radioYes").prop("checked",true);
      		 }else{
      			 $("#radioNo").prop("checked",true);
      		 }
			$("#editOverlay").css("display","block");
		})
	});
});