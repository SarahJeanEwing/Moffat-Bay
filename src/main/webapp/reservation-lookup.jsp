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
    <!-- Lookup Form Container -->
    <div class="reservation-lookup-container">
        <h1>Look up Existing Reservations</h1>

        <p>Enter your email or the confirmation # received during booking to view your existing reservation.</p>

        <!-- Display Error Message (if any) -->
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/reservation_lookup" method="post">
            <!-- Reservation Input -->
            <div class="input-group">
                <label for="lookUp">Email Address or Reservation Number:</label>
                <input type="text" id="lookUp" name="lookUp" required>
            </div>

            <button type="submit" class="btn">Search</button>
        </form>

        <!-- Display Reservation Information -->
        <c:if test="${searchPerformed}">
            <c:choose>
                <c:when test="${not empty reservation}">
                    <!-- Output for when searching by reservation ID -->
                    <h2>Reservation Details</h2>
                    <p><strong>Reservation ID:</strong> ${reservation.reservationId}</p>
                    <p><strong>Slip ID:</strong> ${reservation.slipId}</p>
                    <p><strong>Check-in Date:</strong> ${reservation.checkinDate}</p>
                    <p><strong>Check-out Date:</strong> ${reservation.checkoutDate}</p>
                    <p><strong>Power:</strong> <c:out value="${reservation.power ? 'Yes' : 'No'}" /></p>
                </c:when>

                <c:when test="${not empty reservations}">
                    <h2>Reservations</h2>
                    <c:forEach var="reservation" items="${reservations}">
                        <!-- Output for when searching by email address, allows for multiple reservations -->
                        <h3>Reservation ID: ${reservation.reservationId}</h3>
                        <p><strong>Slip ID:</strong> ${reservation.slipId}</p>
                        <p><strong>Check-in Date:</strong> ${reservation.checkinDate}</p>
                        <p><strong>Check-out Date:</strong> ${reservation.checkoutDate}</p>
                        <p><strong>Power:</strong> <c:out value="${reservation.power ? 'Yes' : 'No'}" /></p>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No reservation found.</p>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>
</div>

</body>
</html>
