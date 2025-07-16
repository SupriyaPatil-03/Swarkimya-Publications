<%@page import="java.sql.*"%>
<%@include file="../connection.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .order-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .order-container h3 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #343a40;
        }
        .form-control {
            margin-bottom: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .text-center img {
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container">
  <div class="order-container" id="orderDetails">
    <h3 class="text-center">Enrollment Details</h3>
    
    <p><b>Child Name:</b> <%= request.getParameter("nm") %></p>
    <p><b>Date of Birth:</b> <%= request.getParameter("startDate") %></p>
    <p><b>Gender:</b> <%= request.getParameter("gender") %></p>
    <p><b>Age:</b> <%= request.getParameter("age") %></p>
    <p><b>Address:</b> <%= request.getParameter("addr") %></p>
    <p><b>Selected Course:</b> <%= request.getParameter("ct") %></p>
    <p><b>Course:</b> <%= request.getParameter("course") %></p>
    <p><b>Duration:</b> <%= request.getParameter("duration") %></p>
    <p><b>Charges:</b> <%= request.getParameter("charges") %></p>
    <p><b>Enrollment Date:</b> <%= request.getParameter("enrollmentDate") %></p>
    <p><b>Parent Name:</b> <%= request.getParameter("nm1") %></p>
    <p><b>Relation to Child:</b> <%= request.getParameter("rel") %></p>
    <p><b>Contact Number:</b> <%= request.getParameter("contact") %></p>
    <p><b>Email:</b> <%= request.getParameter("email") %></p>
    <p><b>Parent Address:</b> <%= request.getParameter("add") %></p>

    <div class="mt-4">
        <button class="btn btn-success" onclick="downloadPDF()">
            Download PDF
        </button>
        <button class="btn btn-primary" onclick="window.location.href='index.jsp'">
            Confirm and Proceed 
        </button>
    </div>
  </div>
</div>

<%
try {
    PreparedStatement pst = cn.prepareStatement("INSERT INTO admission VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1, request.getParameter("nm"));
    pst.setString(2, request.getParameter("startDate"));
    pst.setString(3, request.getParameter("gender"));
    pst.setString(4, request.getParameter("age"));
    pst.setString(5, request.getParameter("addr"));
    pst.setString(6, request.getParameter("ct"));
    pst.setString(7, request.getParameter("course"));
    pst.setString(8, request.getParameter("duration"));
    pst.setString(9, request.getParameter("charges"));
    pst.setString(10, request.getParameter("enrollmentDate"));
    pst.setString(11, request.getParameter("nm1"));
    pst.setString(12, request.getParameter("rel"));
    pst.setString(13, request.getParameter("contact"));
    pst.setString(14, request.getParameter("email"));
    pst.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<script>
    function downloadPDF() {
        var printContent = document.getElementById('orderDetails').innerHTML;
        var originalContent = document.body.innerHTML;
        document.body.innerHTML = printContent;
        window.print();
        document.body.innerHTML = originalContent;
    }
</script>

</body>
</html>
