<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Lookup</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>
<jsp:useBean id="reservation" scope="session" type="com.moffatbay.beans.Reservation"/>

<c:choose>
    <c:when test="${empty user}">
        <div class="account-container single">
            <div class="details-section">
                <h2>User Not Logged In</h2>
                <p>Please log in to view your reservation details.</p>
                <form action="${pageContext.request.contextPath}/login.jsp" method="post">
                    <button type="submit" class="btn-cancel">Login</button>
                </form>
            </div>
        </div>
    </c:when>
    <c:otherwise>
    <div class="account-container <c:if test='${empty reservation}'>single</c:if>">
        <h1>My Reservation</h1>
        <div class="details-container">
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
            <c:if test="${empty reservation}">
                <div class="details-section">
                    <h2>No Reservation Found</h2>
                    <form action="${pageContext.request.contextPath}/reservations-info.jsp" method="post">
                        <button type="submit" class="btn-cancel">Reservations</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    </c:otherwise>
</c:choose>

</body>
</html>