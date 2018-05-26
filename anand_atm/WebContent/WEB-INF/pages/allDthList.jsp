<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<c:if test="${dthNumber!=null}">
<c:out value="Successfully added dth number : ${dthNumber}"></c:out>
</c:if>
<c:if test="${dthList!=null}">
<table border="1px">
<tr align="left">
<th>User_Name</th>
<th>DTH_Number</th>
<th>Service_Provider</th>
<th>Mobile_Number</th>
<th>Alternate_Number</th>
<th>Validity</th>
<th>Payment</th>
<th>Recharged_On</th>
<th>Recharged_Amount</th>
</tr>

	<c:forEach items="${dthList}" var="dth"><tr>
		<td><c:out value="${dth.userName}"></c:out></td>
		<td><c:out value="${dth.dthNumber}"></c:out></td>
		<td><c:out value="${dth.network}"></c:out></td>
		<td><c:out value="${dth.mobileNumber}"></c:out></td>
		<td><c:out value="${dth.alternativeNumber}"></c:out></td>
		<td><c:out value="${dth.validDays}"></c:out></td>
		<td><c:out value="${dth.payment}"></c:out></td>
		<td><c:out value="${dth.lastRecharedDate}"></c:out></td>
		<td><c:out value="${dth.lastRechargedAmount}"></c:out></td>
	</c:forEach>
</table>	
</c:if>
<a href="/anand_atm/dth/">New DTH</a>
</center>
</body>
</html>