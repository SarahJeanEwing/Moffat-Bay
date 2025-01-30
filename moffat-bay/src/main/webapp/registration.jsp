<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <title>Check Slip Availability</title>
    <title>Reserve Your Slip</title>
    <style>
        body {
            margin: 0;
            padding-top: 80px; /* for header */
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            width: 90%;
            margin: 0 auto;
        }
        .left-side, .right-side {
            flex: 1;
            margin: 10px;
        }
        /* Left Side Styles */
        .price-box {
            background-color: rgba(255, 255, 255, 0.9);
            color: #000;
            padding: 20px;
            margin-bottom: 20px;
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
        .map-image img {
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        /* Right Side Styles */
        .content-box {
            background-color: rgba(0, 128, 0, 0.8); /*green box */
            color: #fff;
            padding: 20px;
            border-radius: 10px;
        }
        .content-box h1 {
            text-align: center;
            margin-top: 0;
        }
        .content-box label {
            display: block;
            margin-top: 15px;
        }
        .content-box input[type="text"],
        .content-box select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: none;
            border-radius: 5px;
        }
        .content-box button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #fff;
            color: #006400;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .content-box button:hover {
            background-color: #e0e0e0;
        }
        .additional-info {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #000;
            padding: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body class="registration-page">
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
<div class="container">
        <div class="left-side">
            <!-- Pricing Box -->
            <div class="price-box">
                <h2>Slip Sizes and Pricing</h2>
                <ul>
                    <li>Small Slip (26ft) - $x00/month</li>
                    <li>Medium Slip (40ft) - $x00/month</li>
                    <li>Large Slip (50ft) - $x00/month</li>
                </ul>
                <p>Optional Power Hook-Up: Additional $x0/month</p>
            </div>

            <!-- Map Image -->
            <div class="map-image">
                <img src="images/map.jpg" alt="Marina Map" style="width:100%; border-radius: 10px;">
            </div>
        </div>

        <div class="right-side">
            <div class="content-box">
                <h1>Reserve Your Slip</h1>

                <form action="UserInputServlet" method="post">
                    <!-- Input for Boat Name -->
                    <label for="boatName">Boat Name:</label>
                    <input type="text" id="boatName" name="boatName" required>

                    <!-- Dropdown with 3 Choices -->
                    <label for="slipSize">Select Slip Size:</label>
                    <select id="slipSize" name="slipSize" required>
                        <option value="" disabled selected>Select Boat Size</option>
                        <option value="Small Slip (26ft)">25 feet or smaller</option>
                        <option value="Medium Slip (40ft)">Between 26 and 39 feet</option>
                        <option value="Large Slip (50ft)">Between 40 and 49 feet</option>
                    </select>

                    <!-- Button to Proceed to Next Page -->
                    <button type="submit">Submit</button>
                </form>

                <!-- Additional Info Text -->
                <div class="additional-info">
                    <!-- add text here later -->
                    <p></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
