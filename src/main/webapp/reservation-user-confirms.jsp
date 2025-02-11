<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Confirmation</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="reservation-confirmation-page">
<jsp:include page="header.jsp" />
<jsp:useBean id="user" scope="session" type="com.moffatbay.beans.Customer" />
<jsp:useBean id="reservation" scope="session" type="com.moffatbay.beans.Reservation" />

<h1>Reservation Confirmation</h1>

<c:choose>
    <c:when test="${sessionScope.reservationStatus == 'exists'}">
        <div class="green-box">
            <p>A reservation already exists within this date range.</p>
            <form action="slip-reservation" method="get">
                <button type="submit">Go Back</button>
            </form>
        </div>
    </c:when>
    <c:when test="${sessionScope.reservationStatus == 'available'}">
        <div class="green-box">
            <h2>Your reservation details:</h2>
            <p><strong>Slip ID:</strong> ${sessionScope.reservation.slipId}</p>
            <p><strong>Check-in Date:</strong> ${sessionScope.reservation.checkinDate}</p>
            <p><strong>Check-out Date:</strong> ${sessionScope.reservation.checkoutDate}</p>
            <p><strong>Power:</strong> <c:out value="${sessionScope.reservation.power ? 'Yes' : 'No'}" /></p>
            <p><strong>Total Cost per month:</strong> $<c:out value="${sessionScope.cost}" /></p>

            <form action="reservation-confirmation" method="post">
                <input type="hidden" name="action" value="confirm">
                <button type="submit">Confirm Reservation</button>
            </form>
            <form action="reservation-confirmation" method="post">
                <input type="hidden" name="action" value="cancel">
                <button type="submit">Cancel</button>
            </form>
        </div>
    </c:when>
    <c:when test="${sessionScope.reservationStatus == 'waitlist'}">
        <div class="green-box">
            <h2>No available slips found.</h2>
            <form action="join-waitlist" method="post">
                <input type="hidden" name="boat_size" value="${user.boatLength}">
                <input type="hidden" name="checkInDate" value="${param.checkInDate}">
                <input type="hidden" name="checkOutDate" value="${param.checkOutDate}">
                <button type="submit">Join Waitlist</button>
            </form>
        </div>
    </c:when>
</c:choose>
</body>
</html>
