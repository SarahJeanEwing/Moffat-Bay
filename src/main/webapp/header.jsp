<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Application Title</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
<header>
    <nav class="horizontal-menu">
        <a href="<c:url value='/home' />">
            <img src="<c:url value='/images/moffat-bay-logo.png' />" alt="Moffat Bay Island Marina Logo" class="header-logo">
        </a>
        <ul>
            <li><a href="<c:url value='/home' />">Home</a></li>
            <li><a href="<c:url value='/about' />">About Us</a></li>
            <li><a href="<c:url value='/reservations-info' />">Slip Reservation</a></li>
            <li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="<c:url value='/my_reservation' />">My Reservation</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/reservation_lookup' />">Reservation Lookup</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li><a href="<c:url value='/waitlist' />">Waitlist</a></li>
            <li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="<c:url value='/my_account' />">My Account</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/login' />">Log In</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </nav>
</header>
</body>
</html>