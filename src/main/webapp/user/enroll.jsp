<%@ page import="java.sql.*" %>
<%@ include file="../connection.jsp" %>
<%
int id = 0, price = 0;
String name = "", cat = "", image = "", description = "", duration = "", counselorName = "", sessionTime = "";

// Fetch request parameters safely
String idParam = request.getParameter("id");
String priceParam = request.getParameter("price");
if (idParam != null && !idParam.isEmpty()) {
    id = Integer.parseInt(idParam);
}
if (priceParam != null && !priceParam.isEmpty()) {
    price = Integer.parseInt(priceParam);
}
name = request.getParameter("name");
cat = request.getParameter("category");
description = request.getParameter("description");
duration = request.getParameter("duration");
counselorName = request.getParameter("counselorName");

// Fetch session details from the database
try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addcounseling WHERE id = ?");
    pst.setInt(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        cat = rs.getString("category");
        image = rs.getString("courseimg");
        description = rs.getString("description");
        duration = rs.getString("duration");
        counselorName = rs.getString("counselorName"); // Fetching counselorName
    }
} catch (Exception ex) {
    out.println("<script>alert('Error fetching session details: " + ex.getMessage() + "');</script>");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .order-container { max-width: 600px; margin: 50px auto; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); }
        .order-container h1 { margin-bottom: 20px; font-size: 2rem; color: #343a40; }
        .text-center img { border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); }
        .btn-primary { background-color: #007bff; border: none; }
        .btn-primary:hover { background-color: #0056b3; }
    </style>
</head>
<body>
<div class="order-container">
    <h1 class="text-center">Session Details</h1>
    <div class="row">
        <form id="frmreg" method="post" name="myform" class="col-12">
            <div class="text-center">
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" class="img-fluid" width="250" height="300" alt="Course Image">
            </div>
            <br>
            <b>Session Name:</b>
            <input type="text" class="form-control" name="name" value="<%= name %>" readonly>
            <b>Counselor Name:</b>
            <input type="text" class="form-control" name="counselorName" value="<%= counselorName %>" readonly>
            <b>Category:</b>
            <input type="text" class="form-control" name="cat" value="<%= cat %>" readonly>
            <b>Description:</b>
            <textarea class="form-control" name="description" rows="4" readonly><%= description %></textarea>
            <b>Charges:</b>
            <input type="text" class="form-control" name="price" value="<%= price %>" readonly>
            <b>Duration:</b>
            <input type="text" class="form-control" name="duration" value="<%= duration %>" readonly>
            <b>Enrollment Date:</b>
            <input type="date" class="form-control" name="enrollmentDate" required>
            <b>Session Time:</b>
            <select class="form-control" name="sessionTime" required>
                <option value="time">Select Time for Session</option>
                <option value="10:00 AM - 10:45 AM">10:00 AM - 10:45 AM</option>
                <option value="10:45 AM - 11:30 AM">10:45 AM - 11:30 AM</option>
                <option value="11:30 AM - 12:15 PM">11:30 AM - 12:15 PM</option>
                <option value="12:15 PM - 1:00 PM">12:15 PM - 1:00 PM</option>
                <option value="1:00 PM - 1:45 PM">1:00 PM - 1:45 PM</option>
                <option value="1:45 PM - 2:30 PM">1:45 PM - 2:30 PM</option>
                <option value="2:30 PM - 3:15 PM">2:30 PM - 3:15 PM</option>
                <option value="3:15 PM - 4:00 PM">3:15 PM - 4:00 PM</option>
                <option value="4:00 PM - 4:45 PM">4:00 PM - 4:45 PM</option>
            </select>
            <div class="text-center">
                <button type="submit" class="btn btn-primary" name="btnBuy">Conform and Book Now</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<%
if (request.getParameter("btnBuy") != null) {
    String u = (String) session.getAttribute("email");
    if (u == null) {
        out.println("<script>alert('Please log in first.');window.location='login.jsp';</script>");
        return;
    }

    String enrollmentDate = request.getParameter("enrollmentDate");
    sessionTime = request.getParameter("sessionTime"); // Added sessionTime assignment

    if (enrollmentDate == null || enrollmentDate.isEmpty() || sessionTime == null || sessionTime.isEmpty()) {
        out.println("<script>alert('Enrollment date and session time are required.');history.back();</script>");
        return;
    }

    String query = "INSERT INTO booksession (email, session_name, id, price, category, duration, description, counselor_name, enrollment_date, session_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        PreparedStatement pst = cn.prepareStatement(query);
        pst.setString(1, u);  // Email from session
        pst.setString(2, name);  // Session name
        pst.setInt(3, id);  // Session ID
        pst.setInt(4, price);  // Price
        pst.setString(5, cat);  // Category
        pst.setString(6, duration);  // Duration
        pst.setString(7, description);  // Description
        pst.setString(8, counselorName); // Counselor Name
        pst.setString(9, enrollmentDate);  // Enrollment date
        pst.setString(10, sessionTime);  // Session time

        pst.executeUpdate();
        out.println("<script>alert('Session added to Your Profile successfully.');window.location='viewenroll.jsp';</script>");
    } catch (Exception ex) {
        out.println("<script>alert('Error adding session to cart: " + ex.getMessage() + "');</script>");
    }
}
%>
</body>
</html>
