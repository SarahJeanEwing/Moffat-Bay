<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:url var="contextPath" value="/" />
    <base href="${contextPath}" />
    <title>About Us</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">


</head>
<body class="about-us-page">
    <jsp:include page="./header.jsp" />

    <div>
        <!-- About Us Section -->
        <div class="about-container">
            <h1>About Us</h1>
            <p>Moffat Bay Island Marina is a premier destination for long-term boat rentals. 
               We are dedicated to providing a secure and reliable space for boaters seeking a safe harbor. 
               Our goal is to offer a seamless docking experience while supporting the boating community 
               with dependable service and accessibility.</p>

            <p><strong>Marina monthly cost:</strong> $10 per foot + $10 for electric power.<br>
               For example, a 34 ft boat would cost $350 a month.</p>

            <p><em>This section is a draft; the content of the "About Us" page should be per customer’s request.</em></p>
        </div>

        <!-- Contact Us Section -->
        <div class="contact-container">
            <!-- Contact Form -->
            <div class="contact-form">
                <h2>Contact Us!</h2>

                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" placeholder="Your Name">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Your Email">

                <label for="callback">Call Back #:</label>
                <input type="text" id="callback" name="callback" placeholder="Your Phone Number">

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" placeholder="Your Message"></textarea>

                <button type="submit">Submit</button>
            </div>

            <!-- Contact Info -->
            <div class="contact-info">
                <h2>Contact Information</h2>
                <p><strong>Email:</strong> MBM@marinabusiness.com</p>
                <p><strong>Contact:</strong> 509-555-5555</p>
                <p><strong>P.O. Box:</strong> 1234</p>
                <p><strong>Location:</strong> Joviedsa Island, WA</p>
            </div>
        </div>
    </div>
</body>
</html>