<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <c:if test="${not empty sessionScope.message}">
            <p style="color: red;">${sessionScope.message}</p>
            <c:remove var="message" scope="session" />
        </c:if>

        <form action="slip-reservation" method="post">
            <!-- Boat Name (Disabled but Visible) -->
            <div class="input-group">
                <label for="boatName">Boat Name:</label>
                <input type="text" id="boatName" name="boatName" value="${user.boatName}" disabled>
            </div>

            <!-- Boat Length (Disabled but Visible) -->
            <div class="input-group">
                <label for="boatLength">Boat Length (in feet):</label>
                <input type="text" id="boatLength" name="boatLength" value="${user.boatLength}" disabled>
                <input type="hidden" id="hiddenBoatLength" name="hiddenBoatLength" value="${user.boatLength}">
            </div>

            <!-- Check-in Date -->
            <div class="input-group">
                <label for="checkInDate">Check-in Date:</label>
                <input type="date" id="checkInDate" name="checkInDate"
                       value="${sessionScope.prevCheckinDate}" required>
            </div>

            <!-- Check-out Date -->
            <div class="input-group">
                <label for="checkOutDate">Check-out Date:</label>
                <input type="date" id="checkOutDate" name="checkOutDate"
                       value="${sessionScope.prevCheckoutDate}" required>
            </div>

            <!-- Requires Power? (Yes/No) -->
            <div class="input-group">
                <label>Requires Power? (Extra Charge)</label>
                <div class="radio-group">
                    <label for="powerYes">
                        <input type="radio" id="powerYes" name="requiresPower" value="yes"
                               <c:if test="${sessionScope.prevRequiresPower == 'yes'}">checked</c:if>> Yes
                    </label>

                    <label for="powerNo">
                        <input type="radio" id="powerNo" name="requiresPower" value="no"
                               <c:if test="${sessionScope.prevRequiresPower == 'no' || empty sessionScope.prevRequiresPower}">checked</c:if>> No
                    </label>
                </div>
            </div>

            <button type="submit" class="btn">Reserve Slip</button>
        </form>
    </div>
</div>

</body>
</html>
