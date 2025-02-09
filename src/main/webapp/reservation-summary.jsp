<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Summary</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="reservation-confirmation-page">
<jsp:include page="header.jsp" />

<h1>Reservation Summary</h1>

<c:if test="${not empty sessionScope.waitlistMessage}">
    <div class="green-box">
        <p>${sessionScope.waitlistMessage}</p>
    </div>
</c:if>

<c:if test="${not empty sessionScope.reservationMessage}">
    <div class="green-box">
        <p>${sessionScope.reservationMessage}</p>
        <p><strong>Reservation ID:</strong> ${sessionScope.reservationId}</p>
        <p><strong>Slip ID:</strong> ${sessionScope.slipId}</p>
        <p><strong>Check-in Date:</strong> ${sessionScope.checkinDate}</p>
        <p><strong>Check-out Date:</strong> ${sessionScope.checkoutDate}</p>
        <p><strong>Power:</strong> <c:out value="${sessionScope.power ? 'Yes' : 'No'}" /></p>
        <p><strong>Boat Name:</strong> ${sessionScope.boatName}</p>
        <p><strong>Boat Length:</strong> ${sessionScope.boatLength}</p>
        <p><strong>Total Cost per month:</strong> $<c:out value="${sessionScope.cost}" /></p>
    </div>
</c:if>

</body>
</html>
