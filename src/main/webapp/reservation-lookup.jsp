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

        <form action="${pageContext.request.contextPath}/reservation-lookup" method="post">
            <!-- Reservation Input -->
            <div class="input-group">
                <label for="reservation_id">Email Address or Reservation Number:</label>
                <input type="text" id="reservation_id" name="reservation_id" required>
            </div>

            <button type="submit" class="btn">Search</button>
        </form>
    </div>
</div>

</body>
</html>