<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Account</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>
<div class="coming-soon-content">
    <h1>My Account</h1>
    <p>Under Construction...</p>

    <c:if test="${not empty user}">
        <p>First Name: ${user.firstName}</p>
        <p>Last Name: ${user.lastName}</p>
        <p>Email: ${user.email}</p>
        <p>Telephone: ${user.telephone}</p>
        <p>Boat Name: ${user.boatName}</p>
        <p>Boat Length: ${user.boatLength}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/logout" method="post">
        <button type="submit" class="btn">Log Out</button>
    </form>
</div>
</body>
</html>
