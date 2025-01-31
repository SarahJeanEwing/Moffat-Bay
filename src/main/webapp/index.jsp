<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.moffatbay.utils.ConfigLoader" %>
<%
  String baseURL = ConfigLoader.getProperty("base.url");
  if (!baseURL.isEmpty()) {
    baseURL += "/";
  }
%>
<style>
  body.index-page::before {
    background: url('<%= baseURL %>images/landing-page-background-image.jpg') no-repeat center center fixed;
  }
</style>

<!DOCTYPE html>
<html>
<head>
  <title>Welcome Page</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
  <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body class="index-page">
<jsp:include page="header.jsp"/>

<div class="landing-page-content">
  <p>Welcome to Moffat Bay Island Marina, your premier destination for a memorable boating experience. Our state-of-the-art facilities offer spacious slips for boats of all sizes, modern amenities, and a vibrant community of boating enthusiasts. Whether you're looking to reserve a slip or explore our marina, we've got everything you need to set sail on your next adventure. Join us at Moffat Bay Island Marina and embark on a journey like no other.</p>
  <a href="<c:url value='/reservations' />" class="book-now-button">Book Now</a>

</div>
</body>
</html>