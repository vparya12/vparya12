<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anand</title>
</head>
<body>
<center>
<c:if test="${mobileNumber!=null}">
<c:out value="Successfully added mobile number : ${mobileNumber}"></c:out>
</c:if>
<c:if test="${mobileList!=null}">
<table background="#cccccc" border="1px">
<tr align="left">
<th>User_Name</th>
<th>Mobile_Number</th>
<th>Service_Provider</th>
<th>Alternate_Number</th>
<th>Validity</th>
<th>Payment</th>
<th>Recharged_On</th>
<th>Recharged_Amount</th>
</tr>

	<c:forEach items="${mobileList}" var="mobile"><tr align="left">
		<td><c:out value="${mobile.userName}"></c:out></td>
		<td><c:out value="${mobile.mobileNumber}"></c:out></td>
		<td><c:out value="${mobile.network}"></c:out></td>
		<td><c:out value="${mobile.alternativeNumber}"></c:out></td>
		<td><c:out value="${mobile.validDays}"></c:out></td>
		<td><c:out value="${mobile.payment}"></c:out></td>
		<td><c:out value="${mobile.lastRecharedDate}"></c:out></td>
		<td><c:out value="${mobile.lastRechargedAmount}"></c:out></td>
	</tr></c:forEach>
	</table>
</c:if>
<a href="/anand_atm/mobile/">New Mobile</a>
</center>
</body>
</html>