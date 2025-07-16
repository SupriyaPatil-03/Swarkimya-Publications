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
    <!-- Add your CSS here -->
    <style>
        /* Center the Payment Details section */
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
            width: 350px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Styling the form input fields */
        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .form-control {
            border-radius: 0 5px 5px 0;
            padding: 10px;
            border: 1px solid #ced4da;
            width: 100%;
        }

        textarea.form-control {
            resize: none;
            height: 80px;
        }

        /* Buttons styling */
        button#btnsub {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            width: 100%;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button#btnsub:hover {
            background-color: #0056b3;
        }

        button#btnres {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            width: 100%;
            border-radius: 5px;
        }

        button#btnres:hover {
            background-color: #c82333;
        }

        h5 {
            margin: 0;
            font-size: 16px;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h1 class="text-center">Payment Details</h1>
<div class="row">
    <form id="frmeg" method="post" name="myForm">
        <div class="form-group">
            <b>Total amount:</b>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                <input id="Flavour" type="text" class="form-control" name="amount" placeholder="Amount" value="<%= amt %>" required readonly>
            </div>
        </div>
        <br>

        <div class="form-group">
    <b>Address:</b>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
        <textarea name="address" class="form-control" placeholder="Enter delivery address" required><%= request.getParameter("address") != null ? request.getParameter("address") : "" %></textarea>
    </div>
</div>


        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-shopping-cart"></i></span>
                <h5>Only Cash On Delivery Available</h5>
            </div>
        </div>
        <br>

        <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Place Order</button>
        <button type="reset" class="btn btn-danger" id="btnres">Cancel</button>
    </form>
</div>

<%@ include file="footer.jsp" %>

<%
if (request.getParameter("btnsub") != null) {
    String u = (String) session.getAttribute("email");

    // Check if user is logged in
    if (u == null) {
        out.println("<script>alert('User not logged in. Please log in first.');window.location='login.jsp'</script>");
        return;
    }

    String paymentMethod = "Cash on Delivery";
    int amount = Integer.parseInt(request.getParameter("amount"));
    String address = request.getParameter("address");  // Address captured from the form

    // Get current date
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("d-M-yyyy");
    String orderDate = formatter.format(date);

    try {
        // Start database transaction
        cn.setAutoCommit(false);

        // Insert into ordermst table
        PreparedStatement pst = cn.prepareStatement("INSERT INTO ordermst (odt, email, amount) VALUES (?, ?, ?)");
        pst.setString(1, orderDate);
        pst.setString(2, u);
        pst.setInt(3, amount);
        pst.executeUpdate();

        // Retrieve the last inserted order number (ordno)
        int ono = 0;
        PreparedStatement pst1 = cn.prepareStatement("SELECT max(ordno) from ordermst");
        ResultSet rs = pst1.executeQuery();
        if (rs.next()) {
            ono = rs.getInt(1);
        }

        // Insert order details for each item in the cart (buy table)
        PreparedStatement pst2 = cn.prepareStatement("SELECT * FROM cart WHERE email=?");
        pst2.setString(1, u);
        ResultSet rs1 = pst2.executeQuery();
        while (rs1.next()) {
            String id = rs1.getString("id");
            String quantity = rs1.getString("quantity");
            PreparedStatement pst3 = cn.prepareStatement("INSERT INTO orderdet (ordno, id, quantity) VALUES (?, ?, ?)");
            pst3.setInt(1, ono);
            pst3.setString(2, id);
            pst3.setString(3, quantity);
            pst3.executeUpdate();
        }

        // Clear the cart after placing the order
        PreparedStatement pst4 = cn.prepareStatement("DELETE FROM cart WHERE email=?");
        pst4.setString(1, u);
        pst4.executeUpdate();

        // Insert into payment table
        PreparedStatement pst5 = cn.prepareStatement("INSERT INTO payment (amount, method, address, email, ordno) VALUES (?, ?, ?, ?, ?)");
        pst5.setInt(1, amount);
        pst5.setString(2, paymentMethod);
        pst5.setString(3, address);  // Ensure the address is stored
        pst5.setString(4, u);
        pst5.setInt(5, ono);
        pst5.executeUpdate();

        // Commit transaction
        cn.commit();

        out.println("<script>alert('Thank You For Ordering');window.location='delivery.jsp?ono=" + ono + "'</script>");
    } catch (Exception ex) {
        // Rollback in case of error
        cn.rollback();
        out.println("<script>alert('Error occurred: " + ex.getMessage() + "');</script>");
    }
}
%>

</body>
</html>