<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anand</title>
</head>
<body>
<center>
<form:form method="POST" action="/anand_atm/saveMobile" modelAttribute="mobileObj">
<pre>
<spring:bind path="mobileObj">
<c:forEach items="${statis.errorMessage}" var="error">
	Error:<c:out value="${error}"></c:out>
</c:forEach>
</spring:bind>
<spring:bind path="mobileObj.mobileNumber">
	Mobile Number<span id="requiredastrick">*</span> :<input type="text" name="${status.expression}" value="${status.value}">
</spring:bind>
<spring:bind path="mobileObj.alternativeNumber">
	Alternative Number :<input type="text" name="${status.expression}" value="${status.value}">
</spring:bind>
<spring:bind path="mobileObj.network">
	Network<span id="requiredastrick">*</span> :<input type="text" name="${status.expression}" value="${status.value}">
</spring:bind>
<spring:bind path="mobileObj.userName">
	User Name<span id="requiredastrick">*</span> :<input type="text" name="${status.expression}" value="${status.value}">
</spring:bind>
<spring:bind path="mobileObj.validDays">
	Validity<span id="requiredastrick">*</span> :<input type="text" name="${status.expression}" value="${status.value}"> Days
</spring:bind>
 <spring:bind path="mobileObj.rechargeAmount">
	Amount<span id="requiredastrick">*</span> :<input type="text" name="${status.expression}" value="${status.value}">
</spring:bind>
<spring:bind path="mobileObj.payment">
	Payment<span id="requiredastrick">*</span> :<input type="radio" name="${status.expression}" value="true">Yes <input type="radio" name="${status.expression}" value="false">No
 </spring:bind>
 </pre>
 <input type="reset" value="Clear">
<input type="submit" value="Save">
</form:form>

</center>
</body>
</html>