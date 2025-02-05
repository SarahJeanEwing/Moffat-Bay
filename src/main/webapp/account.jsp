<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Account</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        .account-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .account-container.single {
            max-width: 500px; /* Adjust width for single section */
        }

        .details-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .details-section {
            flex: 1 1 45%;
            box-sizing: border-box;
            padding: 10px;
            margin-bottom: 20px;
            background: #f9f9f9;
            border-radius: 10px;
        }

        .details-section.single {
            max-width: 400px;
            margin: 0 auto 20px;
        }

        .details-section h2 {
            text-align: center;
        }

        .details-section p {
            margin: 0;
            margin-bottom: 10px;
        }

        .btn-container {
            text-align: center;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .cancel-reservation-container {
            text-align: center;
            margin-top: 10px;
        }

        .btn-cancel {
            padding: 10px 20px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>
<div class="account-container <c:if test="${empty reservation}">single</c:if>">
    <h1>My Account</h1>

    <div class="details-container">
        <div class="details-section">
            <h2>Personal Information</h2>
            <p>First Name: ${user.firstName}</p>
            <p>Last Name: ${user.lastName}</p>
            <p>Email: ${user.email}</p>
            <p>Telephone: ${user.telephone}</p>
            <p>Boat Name: ${user.boatName}</p>
            <p>Boat Length: ${user.boatLength}</p>
            <div class="btn-container">
                <form action="${pageContext.request.contextPath}/logout" method="post">
                    <button type="submit" class="btn">Log Out</button>
                </form>
            </div>
        </div>

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
                <p>Power: ${reservation.power ? 'Yes' : 'No'}</p>
                <div class="cancel-reservation-container">
                    <form action="${pageContext.request.contextPath}/cancel_reservation" method="post">
                        <input type="hidden" name="reservationId" value="${reservation.reservationId}">
                        <button type="submit" class="btn-cancel">Cancel Reservation</button>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
