<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Waitlist Look Up</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp" />

<!-- Main Container -->
<div class="waitlist-container">
    <h1>Marina Slip Waitlist</h1>

    <!-- Slip Categories -->
    <div class="waitlist-box">
        <!-- Loop through the customersInLineMap to display waitlist information -->
        <c:forEach var="entry" items="${customersInLineMap}">
            <div class="slip-item">
                <div class="circle">${entry.value}</div>
                <p>${entry.key}' Slip</p>
            </div>
        </c:forEach>
    </div>

    <p class="subtext">Customers in Line</p>

    <!-- Display Error Message if Any -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
</div>

</body>
</html>
