<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Stylesheet -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value="/resources/images/icons/favicon.ico"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/animate/animate.css" />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/select2/select2.min.css" />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css" />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/util.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />">
<!--===============================================================================================-->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">

<!-- Script -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/common.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/session.js"/>"></script>
<%-- <script type="text/javascript" src="<c:url value="/resources/js/dth.js"/>"></script> --%>
<title>Tracker</title>
</head>
<body>
<!-- Overlay -->
<c:if test="${not empty login}">
<div id="loginOverlay">
	<div id="loginForm" class="text-center">
	<h3>Login</h3>	
	<hr>
		<%@include file="html/loginForm.html" %>
	</div>
</div>
</c:if>
<c:if test="${not empty signup}">
<div id="signupOverlay">
	<div id="signupForm" class="text-center">	
		<h3>Signup</h3>
		<hr>
		<%@include file="html/signupForm.html" %>
	</div>
</div>
</c:if>
<!-- Header -->
<div>
	<div id="header" class="navbar-fixed-top text-center text-primary"><p>Anand	Center</p></div>
	<div class="text-right navbar-fixed-top text-primary" id="loggedUser">
		<c:url value="J_Spring_Security_Logout" var="logoutUrl"/>
		<form method="Post" action="${logoutUrl}" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
		</form>
		<c:if test="${pageContext.request.userPrincipal.name!=null}">
			Welcome : ${pageContext.request.userPrincipal.name} |
			<a href="javascript:formSubmit()">Logout</a>
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name==null}">
			<a href="/vparya12/login">Login</a>
			<a href="/vparya12/signup">Register</a>
		</c:if>
	</div>
</div>
<!-- Heading 2 -->
<div class="text-center" id="container">
	<div class="success"><c:if test="${not empty msg}"> ${msg} </c:if> </div>
<!-- Data -->
	<!-- DTH Data -->
	<div class="text-center" id="dataBox" style="display:initial;">
		<div>
			<img class="imgDthButton" src="<c:url value="/resources/img/dth.PNG" />" width="7%" onclick="location.href='/vparya12/dths'"/>
		</div>
		<div class="text-center dataBox">
		<!-- ===========================================Dth======================================== -->
			<div class="table100 ver5 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">Customer Id</th>
								<th class="cell100 column2">DTH Number</th>
								<th class="cell100 column3">Mobile Number</th>
								<th class="cell100 column4">Name</th>
								<th class="cell100 column5">Network</th>
								<th class="cell100 column6">Last R. Date</th>
								<th class="cell100 column7">Next R. Date</th>
								<th class="cell100 column8">Amount</th>
								<th class="cell100 column9">Days Left</th>
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body js-pscroll">
					<table id="dthTable">
						<tbody>
							<c:forEach items="${dthList}" var="dth">
								<tr class="row100 body">
									<%@include file="html/dthDataList.html" %>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile Data -->
	<div class="text-center" id="dataBox" style="display:initial;">
		<div>
			<img class="imgMobileButton" src="<c:url value="/resources/img/mobile.PNG" />" width="4%" onclick="location.href='/vparya12/mobiles'"/>
		</div>
		<div class="text-center dataBox">
		<!-- ===========================================Mobile======================================== -->
			<div class="table100 ver5 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">Customer Id</th>
								<th class="cell100 column3">Mobile Number</th>
								<th class="cell100 column4">Name</th>
								<th class="cell100 column5">Network</th>
								<th class="cell100 column6">Last R. Date</th>
								<th class="cell100 column7">Next R. Date</th>
								<th class="cell100 column8">Amount</th>
								<th class="cell100 column9">Days Left</th>
							</tr>
						</thead>
					</table>
				</div>
	
				<div class="table100-body js-pscroll">
					<table id="mobileTable">
						<tbody>
							<c:forEach items="${mobileList}" var="mobile">
							<tr class="row100 body">
								<%@include file="html/mobileDataList.html" %>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Fooetr -->
<div id="footer" class="navbar-fixed-bottom text-center">
&copy; Ved Prakash Arya</div>
<!--===============================================================================================-->	
	<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js" />"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js" />"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/select2/select2.min.js" />"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/js/main.js" />"></script>
<script src="<c:url value="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"/>"></script>
<script>
	$('.js-pscroll').each(function(){
		var ps = new PerfectScrollbar(this);

		$(window).on('resize', function(){
			ps.update();
		})
	});
</script>
</body>
</html>