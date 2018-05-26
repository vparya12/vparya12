<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<title>Ved</title>
</head>
<body>
Hello <a href="/anand_atm/mobiles">MobileList</a><br>
<a href="/anand_atm/dths">DTHList</a>
<div class="mainContainer">
<!-- Mobile Container -->
	<div id="mobile" class="outerContainer">
	Mobile:<a href="/anand_atm/mobile">Click Here for Mobile</a>
	</div>
	<div id="divider">Divide</div>
<!-- 	DTH container -->
	<div id="dth" class="outerContainer">
	DTH: <a href="/anand_atm/dth">Click Here for DTH</a>
	</div>
</div>
</body>
</html>