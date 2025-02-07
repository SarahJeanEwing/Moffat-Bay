<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log In</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="login-page">
<!-- Include Header -->
<jsp:include page="header.jsp"/>

<!-- Wrapper for login container -->
<div class="login-wrapper">
    <!-- Login Form -->
    <div class="login-container">
        <h1>Log In</h1>

        <!-- Display Error Message (if any) -->
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <!-- Email Input -->
            <div class="input-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <!-- Password Input -->
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn">Log In</button>
        </form>

        <!-- Link to Registration -->
        <p>New User? <a href="${pageContext.request.contextPath}/registration">Register Here</a></p>
    </div>
</div>
</body>
</html>
