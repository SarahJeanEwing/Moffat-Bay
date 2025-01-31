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
    body.about-us-page::before {
        background: url('<%= baseURL %>images/about-us-background-image.jpg') no-repeat center center fixed;
    }
</style>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="about-us-page">
<jsp:include page="header.jsp"/>
<div class="coming-soon-content">
    <h1>About Us</h1>
    <p>Coming Soon...</p>
</div>
</body>
</html>

