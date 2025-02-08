<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Slip Reservation</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp" />
<!-- Content Box -->
<div class="content-box">
    <h2>Check Slip Availability!</h2>
    <p>Our slips come in three sizes with optional power hook-up.<br>Find the perfect fit for your vessel and enjoy seamless access to power whenever you need it.</p>

    <!-- Reserve Now Button -->
    <a href="<c:url value='/reserve-now' />" class="reserve-button">Reserve Now</a>

    <!-- Price Box -->
    <div class="price-box">
        <div class="price-columns">
            <div class="price-column">
                <h2>Slip Sizes</h2>
                <ul>
                    <li>Small Slip (26ft)</li>
                    <li>Medium Slip (40ft)</li>
                    <li>Large Slip (50ft)</li>
                </ul>
            </div>
            <div class="price-column">
                <h2>Marina Monthly Cost</h2>
                <p>$10 per boat foot + optional $10 for electric power.<br>
                    For example, a 34 ft boat would cost $350 a month.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
