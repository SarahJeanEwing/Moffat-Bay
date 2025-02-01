<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.moffatbay.utils.ConfigLoader" %>
<%
    String baseURL = ConfigLoader.getProperty("base.url");
    if (baseURL == null ) {
        baseURL = "/";
    } else {
        baseURL += "/";
    }
%>
<style>
    body.registration-page::before {
        background: url('<%= baseURL %>images/registration-page-background-image.jpg') no-repeat center center fixed;
    }
</style>

<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="registration-page">
<jsp:include page="header.jsp"/>
<div class="registration-form">
    <h1>Register</h1>
    <form action="registration" method="post">
        <input type="email" name="email" placeholder="Email" required/>
        <input type="text" name="firstName" placeholder="First Name" required/>
        <input type="text" name="lastName" placeholder="Last Name" required/>
        <input type="text" name="telephone" placeholder="Telephone" required/>
        <input type="text" name="boatName" placeholder="Boat Name" required/>
        <input type="number" name="boatLength" placeholder="Boat Length" required/>
        <input type="password" name="password" placeholder="Password" required/>
        <button type="submit">Register</button>
    </form>
    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>
</div>
</body>
</html>