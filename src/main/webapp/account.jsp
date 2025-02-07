<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Account</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>
<jsp:useBean id="user" scope="session" type="com.moffatbay.beans.Customer"/>
<jsp:useBean id="reservation" scope="session" type="com.moffatbay.beans.Reservation"/>
<div class="account-container <c:if test="${empty reservation}">single</c:if>">
    <h1>My Account</h1>

    <div class="details-container">
        <div class="details-section">
            <h2>Personal Information</h2>
            <p>First Name: ${user.firstName}</p>
            <p>Last Name: ${user.lastName}</p>
            <p>Email: ${user.email}</p>
            <p>Telephone: ${user.telephone}</p>
            <p>Boat Name: ${user.boatName}</p>
            <p>Boat Length: ${user.boatLength}</p>
            <div class="btn-container">
                <form action="${pageContext.request.contextPath}/logout" method="post">
                    <button type="submit" class="btn">Log Out</button>
                </form>
            </div>
        </div>

        <c:if test="${not empty reservation}">
            <div class="details-section">
                <h2>Reservation Details</h2>
                <p>Reservation ID: ${reservation.reservationId}</p>
                <p>Slip Number: ${reservation.slipId}</p>
                <p>Check-in Date: ${reservation.checkinDate}</p>
                <p>Check-out Date:
                    <c:choose>
                        <c:when test="${reservation.checkoutDate == null}">
                            TBD
                        </c:when>
                        <c:otherwise>
                            ${reservation.checkoutDate}
                        </c:otherwise>
                    </c:choose>
                </p>
                <c:choose>
                    <c:when test="${reservation.power}">
                        <p>Power: Yes</p>
                    </c:when>
                    <c:otherwise>
                        <p>Power: No</p>
                    </c:otherwise>
                </c:choose>
                <div class="cancel-reservation-container">
                    <form action="${pageContext.request.contextPath}/cancel_reservation" method="post">
                        <input type="hidden" name="reservationId" value="${reservation.reservationId}">
                        <button type="submit" class="btn-cancel">Cancel Reservation</button>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
