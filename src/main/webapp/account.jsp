<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Account</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>
<jsp:useBean id="user" scope="session" type="com.moffatbay.beans.Customer"/>
<div class="account-container">
    <h1>My Account</h1>

    <div class="details-container">
        <div class="details-section">
            <h2>Personal Information</h2>
            <p>First Name: ${user.firstName}</p>
            <p>Last Name: ${user.lastName}</p>
            <p>Email: ${user.email}</p>
            <p>Telephone: ${user.telephone}</p>
            <p>Boat Name: ${user.boatName}</p>
            <p>Boat Length: ${user.boatLength} feet</p>
            <div class="btn-container">
                <form action="${pageContext.request.contextPath}/logout" method="post">
                    <button type="submit" class="btn">Log Out</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
