<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .receipt {
            border: 1px dashed #4CAF50;
            padding: 20px;
            margin-top: 20px;
        }

        .receipt-item {
            margin: 10px 0;
            font-size: 16px;
        }

        .receipt-item span {
            font-weight: bold;
        }

        .thank-you {
            text-align: center;
            margin: 30px 0;
            font-size: 18px;
            color: #333;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
        }

        .footer a {
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 12px 25px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .footer a:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Confirmation</h1>

        <%
            // Check if the user is logged in
            String email = (String) session.getAttribute("email");
            if (email == null) {
                out.println("<script>alert('Please log in first.');window.location='login.jsp';</script>");
                return;
            }

            try {
                // Query to get payment details for the user
                String query = "SELECT * FROM cpayment WHERE email = ? ORDER BY id DESC LIMIT 1";
                PreparedStatement pstmt = cn.prepareStatement(query);
                pstmt.setString(1, email);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String method = rs.getString("method");
                    double amount = rs.getDouble("amount");
                    Date paymentDate = rs.getDate("order_date");
        %>

        <div class="receipt">
            <p class="receipt-item"><span>Payment ID:</span> <%= id %></p>
            <p class="receipt-item"><span>Email:</span> <%= email %></p>
            <p class="receipt-item"><span>Payment Method:</span> <%= method %></p>
            <p class="receipt-item"><span>Amount Paid:</span> ₹<%= amount %></p>
            <p class="receipt-item"><span>Payment Date:</span> <%= paymentDate %></p>
        </div>

        <p class="thank-you">Thank you for your payment! Your transaction has been successfully processed. <br>
            We look forward to serving you again at Swarkimya Publications.</p>

        <div class="footer">
            <a href="index.jsp">Return to Home</a>
        </div>

        <%
                } else {
                    out.println("<p>No payment records found.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</body>
</html>
