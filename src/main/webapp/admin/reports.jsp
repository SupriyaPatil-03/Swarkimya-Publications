<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Report Links</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef; /* Light gray background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font */
        }
        .container {
            margin-top: 50px;
            max-width: 600px; /* Centered container */
        }
        .nav-links {
            display: flex;
            flex-direction: column;
            align-items: center; /* Center-align the links */
            gap: 10px;
        }
        .nav-links a {
            color: #ffffff; /* White text color */
            background-color: #007bff; /* Primary blue color */
            width: 100%; /* Full width within container */
            max-width: 300px; /* Max width for larger screens */
            padding: 12px 20px;
            border-radius: 8px; /* Slightly rounded corners */
            text-decoration: none;
            font-size: 18px;
            text-align: center; /* Center the text */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .nav-links a:hover {
            background-color: #0056b3; /* Darker blue for hover effect */
            transform: scale(1.02); /* Slight zoom effect on hover */
        }
        .nav-links a:active {
            background-color: #004080; /* Even darker blue for active state */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Reports</h1>
        <div class="nav-links">
            <a href="Counselingsreport.jsp" target="contentFrame">Counseling Sessions Bookings</a>
            <a href="admissionreport.jsp" target="contentFrame">Admission Report</a>
            <a href="addbooksreport.jsp" target="contentFrame">All Books Report</a>
            <a href="contactreport.jsp" target="contentFrame">contact Report</a>
            <a href="registerreport.jsp" target="contentFrame">Registration Report</a>      
            <a href="feedreport.jsp" target="contentFrame">Feedback Report</a>
        </div>
    </div>
</body>
</html>
<%@include file="footer.jsp"%>
