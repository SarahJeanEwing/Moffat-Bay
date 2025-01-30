<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <title>Check Slip Availability</title>
    <style>
        body {
            margin: 0;
            padding-top: 80px; /*Adjust for header padding */
            background: url('images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .content-box {
            background-color: rgba(0, 128, 0, 0.8);/*the green box
*/
            width: 80%;
            margin: 0 auto;
            padding: 30px;
            border-radius: 10px;
            color: #fff;
        }
        .content-box h1 {
            text-align: center;
            font-size: 36px;
            margin-top: 0;
        }
        .content-box p {
            font-size: 18px;
            line-height: 1.6;
            text-align: center;
        }
        .price-box {
            background-color: rgba(255, 255, 255, 0.9);
            color: #000;
            padding: 20px;
            margin-top: 30px;
            border-radius: 5px;
        }
        .price-box h2 {
            text-align: center;
            margin-top: 0;
        }
        .price-box ul {
            list-style-type: none;
            padding: 0;
        }
        .price-box li {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body class="registration-page">
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="content-box">
        <h1>Check Slip Availability!</h1>
        <p>Our slips come in three sizes with optional power hook-up. Find the perfect fit for your vessel and enjoy seamless access to power whenever you need it.</p>
        <div class="price-box">
            <h2>Slip Sizes and Pricing</h2>
            <ul>
                <li>Small Slip (26ft) - $x00/month</li>
                <li>Medium Slip (40ft) - $x00/month</li>
                <li>Large Slip (50ft) - $x00/month</li>
            </ul>
            <p>Optional Power Hook-Up: Additional $x0/month</p>
        </div>
    </div>
</body>
</html>
