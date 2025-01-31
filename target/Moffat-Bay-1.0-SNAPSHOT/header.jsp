<%--
  Created by IntelliJ IDEA.
  User: shado
  Date: 1/30/2025
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Moffat Bay</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

        <link rel="stylesheet" href="./css/styles.css">
    </head>
    <body>
        <header>
            <nav class="horizontal-menu">
                <a href="<c:url value='/home' />">
                    <img src="./images/moffat-bay-logo.png"
                         alt="Moffat Bay Island Marina logo"
                         class="header-logo">
                </a>
                <ul>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/home' />">Home</a>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/about' />">About</a>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/reservations' />">Reservations</a>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/reservation_lookup' />">My Reservation</a>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/waitlist' />">Waitlist</a>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                    <a href="<c:url value='/my_account' />">My Account</a>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/login' />">Login</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="mdl-button mdl-js-button mdl-button--raised">
                        <a href="<c:url value='/reservations' />">Book Now</a>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
