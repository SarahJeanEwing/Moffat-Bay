<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Slip Reservation</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="reservation-page">

<!-- Include Header -->
<jsp:include page="header.jsp" />

<!-- Wrapper for reservation container -->
<div class="reservation-wrapper">
    <!-- Reservation Form Container -->
    <div class="reservation-container">
        <h1>Slip Reservation</h1>

        <form action="process-slip-reservation" method="post">
            <!-- Boat Name (Disabled but Visible) -->
            <div class="input-group">
                <label for="boatName">Boat Name:</label>
                <input type="text" id="boatName" name="boatName" value="${user.boatName}" disabled>
            </div>

            <!-- Boat Length (Disabled but Visible) -->
            <div class="input-group">
                <label for="boatLength">Boat Length:</label>
                <input type="text" id="boatLength" name="boatLength" value="${user.boatLength}" disabled>
            </div>

            <!-- Check-in Date -->
            <div class="input-group">
                <label for="checkInDate">Check-in Date:</label>
                <input type="date" id="checkInDate" name="checkInDate" required>
            </div>

            <!-- Check-out Date -->
            <div class="input-group">
                <label for="checkOutDate">Check-out Date:</label>
                <input type="date" id="checkOutDate" name="checkOutDate" required>
            </div>

            <!-- Requires Power? (Yes/No) -->
            <div class="input-group">
                <label>Requires Power? (Extra Charge)</label>
                <div class="radio-group">
                    <label for="powerYes">
                        <input type="radio" id="powerYes" name="requiresPower" value="yes"> Yes
                    </label>

                    <label for="powerNo">
                        <input type="radio" id="powerNo" name="requiresPower" value="no" checked> No
                    </label>
                </div>
            </div>

            <button type="submit" class="btn">Reserve Slip</button>
        </form>
    </div>
</div>

</body>
</html>