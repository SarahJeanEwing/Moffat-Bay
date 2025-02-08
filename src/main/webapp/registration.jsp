<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <script>
        function validateForm() {
            var boatLength = document.forms["registrationForm"]["boatLength"].value;
            if (boatLength > 49) {
                document.getElementById("error").innerText = "Boats must be 49 feet or less.";
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="registration-page">
<jsp:include page="header.jsp"/>
<div class="registration-wrapper">
    <div class="registration-container">
        <h1>Register</h1>
        <form name="registrationForm" action="registration" method="post" onsubmit="return validateForm()">
            <input type="email" name="email" placeholder="Email" value="<c:out value='${param.email}'/>" required/>
            <input type="text" name="firstName" placeholder="First Name" value="<c:out value='${param.firstName}'/>" required/>
            <input type="text" name="lastName" placeholder="Last Name" value="<c:out value='${param.lastName}'/>" required/>
            <input type="text" name="telephone" placeholder="Telephone" value="<c:out value='${param.telephone}'/>" required/>
            <input type="text" name="boatName" placeholder="Boat Name" value="<c:out value='${param.boatName}'/>" required/>
            <input type="number" name="boatLength" placeholder="Boat Length" value="<c:out value='${param.boatLength}'/>" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <button type="submit" class="btn">Register</button>
        </form>
        <p id="error" class="error"></p>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
    </div>
</div>
</body>
</html>
