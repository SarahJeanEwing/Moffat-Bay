<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <h1>Welcome!</h1>
    <p>If you see this page, your setup is working correctly.</p>
</body>
</html>
