<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Welcome Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="./css/styles.css">
  </head>

  <body class="index-page">
    <jsp:include page="header.jsp"/>

    <div class="landing-page-content">
      <h1>Welcome to Moffat Bay Island Marina</h1>
      <p>Your premier destination for a memorable boating experience. Our state-of-the art facilities
        offer spacious slips for boats of all sizes, modern amenities, and a vibrant community of boating enthusiasts.
        Whether you're looking to reserve a slip or explore our marina,
        we've got everything you need to set sail on your next adventure.
        Join us at Moffat Bay Island Marina and embark on a journey like no other.</p>
      <a href="<c:url value='/reservations' />" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">Book Now</a>
    </div>
  </body>
</html>