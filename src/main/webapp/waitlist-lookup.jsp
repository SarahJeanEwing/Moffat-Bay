<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Waitlist Look Up</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp" />

<!-- Main Container -->
<div class="waitlist-container">
    <h1>Marina Slip Waitlist</h1>

    <!-- Slip Categories -->
    <div class="waitlist-box">
        <div class="slip-item">
            <div class="circle">5</div>
            <p>26' Slip</p>
        </div>
        <div class="slip-item">
            <div class="circle">1</div>
            <p>40' Slip</p>
        </div>
        <div class="slip-item">
            <div class="circle">2</div>
            <p>50' Slip</p>
        </div>
    </div>

    <p class="subtext">Customers in Line</p>
</div>

</body>
</html>