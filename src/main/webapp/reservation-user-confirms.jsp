<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Confirmation</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="reservation-info-page">
<jsp:include page="header.jsp" />

<!-- Content Box -->
<div class="content-box">
    <h2>Reservation Confirmation</h2>
    <p>Slip Size: ${slipSize}</p>
    <p>Date Chosen: ${dateChosen}</p>
    <form action="${pageContext.request.contextPath}/reservation-confirmation" method="post">
        <input type="hidden" name="slipSize" value="${slipSize}">
        <input type="hidden" name="dateChosen" value="${dateChosen}">
        <button type="submit" name="action" value="confirm">Confirm</button>
        <button type="submit" name="action" value="cancel">Cancel</button>
    </form>
</div>
</body>
</html>
