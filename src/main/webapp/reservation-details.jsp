<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>My Reservation</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
</head>

<body class="reservation-page">
<jsp:include page="header.jsp"/>
<jsp:useBean id="reservation" beanName="com.moffatbay.beans.Reservation"/>
<div class="details-container">
    <c:if test="${not empty reservation}">
        <div class="details-section">
            <h1>Reservation Details</h1>
            <p>Reservation ID: ${reservation.id}</p>
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
            <p>Power: ${reservation.power ? 'Yes' : 'No'}</p>
            <div class="cancel-reservation-container">
                <form action="${pageContext.request.contextPath}/cancel-reservation" method="post">
                    <input type="hidden" name="reservationId" value="${reservation.reservationId}">
                    <button type="submit" class="btn-cancel">Cancel Reservation</button>
                </form>
            </div>
        </div>
    </c:if>
</div>

</body>
</html>
