<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | Test Java Back-end</title>
    <link rel="shortcut icon" href="<c:url value='/templates/favicon.ico'/>" type="image/x-icon">
    <link href="https://fonts.googleapis.com/icon?family=Poppins:display=swap|Material+Icons+Outlined" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
	<div class="app">
		<security:authorize access="isAnonymous()">
	    	Welcome
	    </security:authorize>
	    <security:authorize access="isAuthenticated()">
	    	Hello <%=SecurityUtils.getPrincipal().getFullName() %>
	    </security:authorize>
	</div>
</body>
</html>