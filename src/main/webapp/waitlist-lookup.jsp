<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.moffatbay.utils.ConfigLoader" %>
<%
    String baseURL = ConfigLoader.getProperty("base.url");
    if (!baseURL.isEmpty()) {
        baseURL += "/";
    }
%>
<style>
    body.index-page::before {
        background: url('<%= baseURL %>images/landing-page-background-image.jpg') no-repeat center center fixed;
    }
</style>
<!DOCTYPE html>
<html>
<head>
    <title>Waitlist Look Up</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp" />
<div class="coming-soon-content">
    <h1>Waitlist Look Up</h1>
    <p>Coming Soon...</p>
</div>
</body>
</html>
