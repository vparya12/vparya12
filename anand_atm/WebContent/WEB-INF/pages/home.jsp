<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ved</title>
</head>
<body>
	<center>
		<form:form method="POST" action="/anand_atm/login" modelAttribute="loginObj">
			<spring:bind path="loginObj">
				<c:forEach items="${status.errorMessage}" var="error">
					Error:<c:out value="${error}"></c:out>
				</c:forEach>
			</spring:bind>
			<spring:bind path="loginObj.username">
				<input type="text" name="${status.expression}" value="${status.value}"/>
			</spring:bind>
			<spring:bind path="loginObj.password">
				<input type="text" name="${status.expression}" value="${status.value}"/>
			</spring:bind>
				<input type="reset" value="Reset"/>
				<input type="submit" value="Login"/>
		</form:form>
	</center>
</body>
</html>