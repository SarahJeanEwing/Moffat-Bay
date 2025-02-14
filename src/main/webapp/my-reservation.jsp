<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Lookup</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="reservation-lookup-page">

<!--Header -->
<jsp:include page="header.jsp"/>

<!-- Lookup Form -->
<div class="reservation-lookup-wrapper">
    <div class="reservation-lookup-container">
        <!-- Display Reservation Information -->
        <div class="reservation-lookup-results">
            <c:choose>
                <c:when test="${not empty reservations}">
                <h2>Reservation Details</h2>
                <table class="reservation-lookup-results-table">
                    <tr>
                        <th>Reservation ID</th>
                        <th>Slip ID</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Power</th>
                    </tr>
                    <c:forEach var="reservation" items="${reservations}">
                        <tr>
                            <td>${reservation.reservationId}</td>
                            <td>${reservation.slipId}</td>
                            <td>${reservation.checkinDate}</td>
                            <td>${reservation.checkoutDate}</td>
                            <td><c:out value="${reservation.power ? 'Yes' : 'No'}" /></td>
                        </tr>
                    </c:forEach>
                </table>
                </c:when>
                <c:otherwise>
                <p>No reservation found.</p>
                </c:otherwise>
                </c:choose>
        </div>
    </div>
</div>

</body>
</html>