<%@ page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>
<%
int id = 0;
int price = 0;
String name = "";
String cat = "";
String image = "";

if (request.getParameter("id") != null) {
    id = Integer.parseInt(request.getParameter("id"));
    price = Integer.parseInt(request.getParameter("price"));
    name = request.getParameter("name");
    cat = request.getParameter("category");
}

try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addbooks WHERE id = ?");
    pst.setInt(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        cat = rs.getString("category");
        image = rs.getString("productimg");
    }
} catch (Exception ex) {
    out.println(ex);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .order-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .order-container h1 {
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
        .text-center img {
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="order-container">
    <h1 class="text-center">Order Details</h1>
    <div class="row">
        <form id="frmreg" method="post" name="myform" class="col-12">
            <div class="text-center">
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" class="img-fluid" width="250" height="300" alt="Product Image">
            </div>
            <br>
            <b>Name:</b>
            <input id="unm" type="text" class="form-control" name="name" placeholder="Name of product" value="<%= name %>" required readonly>
            <br>
            <b>Category:</b>
            <input id="cat" type="text" class="form-control" name="cat" placeholder="Product category" value="<%= cat %>" required readonly>
            <br>
            <b>Price:</b>
            <input id="price" type="text" class="form-control" name="price" placeholder="Price of product" value="<%= price %>" required readonly>
            <br>
            <b>Quantity:</b>
            <input id="wt" type="text" onchange="cal()" class="form-control" name="quantity" placeholder="Quantity">
            <br>
            <b>Total Amount:</b>
            <input id="amt" type="text" class="form-control" name="amt" placeholder="0" value="0" required readonly>
            <br>
            <div class="text-center">
                <button type="submit" class="btn btn-primary" name="btnBuy">Add to Cart</button>
            </div>
        </form>
    </div>
</div>

<script>
function cal() {
    var p = document.getElementById("price").value;
    var w = document.getElementById("wt").value;
    var a = p * w;
    document.getElementById("amt").value = a;
}
</script>

<%@ include file="footer.jsp" %>	
<%
if (request.getParameter("btnBuy") != null) {
    // Retrieve email from session
    String u = (String) session.getAttribute("email");  // Ensure it's the same key used during login

    // Check if the user is logged in
    if (u == null) {
        out.println("<script>alert('User not logged in. Please log in first.');window.location='login.jsp'</script>");
        return;  // Stop execution if email is not found in session
    }

    String unm = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    int amt = Integer.parseInt(request.getParameter("amt"));

    String query = "INSERT INTO cart (email, name, id, price, category, quantity, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        PreparedStatement pst = cn.prepareStatement(query);
        pst.setString(1, u);  // Insert the email from the session
        pst.setString(2, unm);  // Insert product name
        pst.setInt(3, id);      // Insert product id
        pst.setInt(4, price);   // Insert product price
        pst.setString(5, cat);  // Insert product category
        pst.setInt(6, quantity);  // Insert quantity
        pst.setInt(7, amt);       // Insert total amount

        pst.executeUpdate();
        out.println("<script>alert('Book added to cart');window.location='viewcart.jsp'</script>");
    } catch (Exception ex) {
        out.println("<script>alert('Error placing order: " + ex.getMessage() + "');</script>");
    }
}
%>



</body>
</html>
