<%@page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>

<%
int amt = 0;
if (request.getParameter("amount") != null) {
    amt = Integer.parseInt(request.getParameter("amount"));
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Details</title>
    <style>
        h1.text-center {
            text-align: center;
            margin-top: 20px;
        }

        .row {
            display: flex;
            justify-content: center;
        }

        form#frmeg {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            width: 400px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            color: white;
        }

        button#btncod {
            background-color: #007bff;
        }

        button#btncod:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1 class="text-center">Payment Details</h1>
<div class="row">
    <form id="frmeg" method="post" name="myForm">
        <div class="form-group">
            <label><b>Total Amount:</b></label>
            <input type="text" class="form-control" name="amount" value="<%= amt %>" readonly>
        </div>

        <div class="form-group">
            <label><b>Payment Method:</b></label>
            <p>Offline Payment</p>
        </div>

        <!-- Cash on Delivery Button -->
        <button type="submit" id="btncod" name="btncod">Next</button>
    </form>
</div>

<%
if (request.getParameter("btncod") != null) {
    String u = (String) session.getAttribute("email");
    if (u == null) {
        out.println("<script>alert('Please log in first.');window.location='login.jsp';</script>");
        return;
    }

    String paymentMethod = "Cash on Delivery";
    int amount = Integer.parseInt(request.getParameter("amount"));

    // Get current date
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("d-M-yyyy");
    String orderDate = formatter.format(date);

    try {
        cn.setAutoCommit(false);

        PreparedStatement pst = cn.prepareStatement("INSERT INTO cpayment (amount, method, email, order_date) VALUES (?, ?, ?, ?)");
        pst.setInt(1, amount);
        pst.setString(2, paymentMethod);
        pst.setString(3, u);
        pst.setString(4, orderDate);  // Add this line to include the order date

        cn.commit();

        out.println("<script>alert('Thank You for Booking!Payment can be made at the center.');window.location='index.jsp';</script>");
    } catch (Exception ex) {
        cn.rollback();
        out.println("<script>alert('Error occurred: " + ex.getMessage() + "');</script>");
    }
}
%>

</body>
</html>

<%@include file="footer.jsp" %>
