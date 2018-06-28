<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Chetak</title>
</head>
<body>
Title; ${title}
Message: ${message}

<c:url value="J_Spring_Security_Logout" var="logoutUrl"/>
<form method="Post" action="${logoutUrl}" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
</form>

<script type="text/javascript">
	function formSubmit(){
		document.getElementById("logoutForm").submit();
	}
</script>
<c:if test="${pageContext.request.userPrincipal.name!=null }">
	Welcome : ${pageContext.request.userPrincipal.name} |
	<a href="javascript:formSubmit()">Logout</a>
	
</c:if>

</body>
</html>