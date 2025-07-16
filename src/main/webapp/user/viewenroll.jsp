<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>

<head>
    <style>
        .row {
            display: flex;
            justify-content: center;
            margin: 20px;
        }

        .table {
            width: 90%;
            max-width: 1200px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead {
            background-color: #007bff;
            color: white;
            text-align: center;
            font-weight: bold;
        }

        .table thead th {
            padding: 15px;
        }

        .table tbody td {
            padding: 15px;
            text-align: center;
            vertical-align: middle;
            border-bottom: 1px solid #ddd;
        }

        .table tbody img {
            border-radius: 5px;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .table tbody img:hover {
            transform: scale(1.05);
        }

        .table tbody a {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }

        .table tbody a:hover {
            color: darkred;
            text-decoration: underline;
        }

        .table tbody tr:last-child {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin: 20px 0;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            text-decoration: none;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #f8f9fa;
        }
    </style>
</head>

<h1 align="center">Your Counseling Sessions</h1>
<div align="center">
    <img src="images/30.webp" width="1000" height="300" alt="Cart Image">
</div>
<div class="row">
    <table class="table">
       <thead>
    <tr>
        <th>Session ID</th>
        <th>Image</th>
        <th>Session Name</th>
        <th>Counselor</th>
        <th>Category</th>
        <th>Course Information</th>
        <th>Duration</th>
        <th>Charges</th>
        <th>Enrollment Date</th>
        <th>Session Time</th> <!-- Add Session Time column -->
        <th>Actions</th>
    </tr>
</thead>
<tbody>
    <%
        String userEmail = (String) session.getAttribute("email");
        int totalAmount = 0;

        if (userEmail == null) {
            out.println("<script>alert('Please log in first.');window.location='login.jsp';</script>");
            return;
        }

        try {
            // Modify the SQL query to fetch session_time from booksession
            PreparedStatement pst = cn.prepareStatement(
                "SELECT booksession.id, booksession.session_name, booksession.price, booksession.description, booksession.duration, booksession.counselor_name, booksession.enrollment_date, booksession.category, booksession.session_time, addcounseling.courseimg " +
                "FROM booksession JOIN addcounseling ON booksession.id = addcounseling.id WHERE booksession.email = ?"
            );
            pst.setString(1, userEmail);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String sessionName = rs.getString("session_name");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String duration = rs.getString("duration");
                String counselorName = rs.getString("counselor_name");
                String enrollmentDate = rs.getString("enrollment_date");
                int price = rs.getInt("price");
                String image = rs.getString("courseimg");
                String sessionTime = rs.getString("session_time"); // Fetch session time

                totalAmount += price;
    %>
    <tr>
        <td><%= id %></td>
        <td><img src="<%= request.getContextPath() %>/images/<%= image %>" width="150" height="150" alt="Session Image"></td>
        <td><%= sessionName %></td>
        <td><%= counselorName %></td>
        <td><%= category %></td>
        <td><%= description %></td>
        <td><%= duration %></td>
        <td><%= price %></td>
        <td><%= enrollmentDate %></td>
        <td><%= sessionTime %></td> <!-- Display session time -->
        <td><a href="delete1.jsp?email=<%= userEmail %>&id=<%= id %>">Delete</a></td>
    </tr>
    <%
            }

            // Display total amount
    %>
    <tr>
        <td colspan="8"></td>
        <td><b>Total:</b></td>
        <td><b><%= totalAmount %></b></td>
        <td></td>
    </tr>
    <%
        } catch (Exception e) {
            out.println("<tr><td colspan='11'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>
</tbody>

    </table>
    <center>
        <a class="btn btn-primary" href="coursepayment.jsp?amount=<%= totalAmount %>">Conform and proceed to Pay</a>
    </center>
</div>
<%@ include file="footer.jsp" %>
