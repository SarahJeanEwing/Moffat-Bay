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
    <h1>Slip Reservation</h1>
    <!-- Content Box -->
    <div class="content-box">
        <h2>Check Slip Availability!</h2>
        <p>Our slips come in three sizes with optional power hook-up. Find the perfect fit for your vessel and enjoy seamless access to power whenever you need it.</p>
        
        <!-- Reserve Now Button -->
        <a href="reservations.jsp" class="reserve-button">Reserve Now</a>
        
        <!-- Price Box -->
        <div class="price-box">
            <h2>Slip Sizes and Pricing</h2>
            <ul>
                <li>Small Slip (26ft)</li>
                <li>Medium Slip (40ft)</li>
                <li>Large Slip (50ft)</li>
            </ul>
            <p>Optional Power Hook-Up: Additional $10/month</p>
            <p><strong>Marina monthly cost:</strong><br>$10 per boat foot + $10 for electric power.
                For example, a 34 ft boat would cost $350 a month.</p>
        
</div>
</body>
</html>


