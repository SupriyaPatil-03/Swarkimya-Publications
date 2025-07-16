<%@ include file="../connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datewise Payment Report</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        h3 {
            color: #000000;
            font-size: 30px;
        }
        .table {
            border-collapse: collapse;
            width: 100%;
            background-color: #ffffff;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .table th, .table td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: center;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            font-size: 18px;
            color: #d9534f;
        }
        button {
            background-color: #1dccc9;
            color: black;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #17b5b0;
        }
        form {
            max-width: 1200px;
            margin: auto;
        }
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }
        input[type="date"] {
            border: 2px solid #1dccc9;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h3>Swarkimya Publications</h3>
        </div>
        <div id="header" style="text-align: center; margin-bottom: 20px;">
            <p>Plot no.24, Market yard, Rawivar Peth, Radhika Road, Satara, India, Maharashtra</p>
            <p>Email: swarkimayapublications2017@gmail.com | Phone: 075071 52567</p>
        </div>

        <!-- Date Filter Form -->
        <form method="post">
            <div class="form-row">
                <div class="col">
                    <label for="fromDate" class="form-label">From Date:</label>
                    <input type="date" name="fromDate" id="fromDate" class="form-control" required>
                </div>
                <div class="col">
                    <label for="toDate" class="form-label">To Date:</label>
                    <input type="date" name="toDate" id="toDate" class="form-control" required>
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
            </div>
        </form>

        <!-- Datewise Report -->
        <% 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            try {
                PreparedStatement pst = cn.prepareStatement("SELECT enrollment_date, email, price FROM booksession WHERE enrollment_date BETWEEN ? AND ?");
                pst.setString(1, fromDate);
                pst.setString(2, toDate);
                ResultSet rs = pst.executeQuery();
        %>
        <div id="resultsArea">
            <table class="table">
                <thead>
                    <tr>
                        <th>Enrollment Date</th>
                        <th>Email</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    boolean hasResults = false;
                    while (rs.next()) {
                        hasResults = true;
                    %>
                    <tr>
                        <td><%= rs.getString("enrollment_date") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getInt("price") %></td>
                    </tr>
                    <% 
                    }
                    if (!hasResults) {
                    %>
                    <tr>
                        <td colspan="3" class="no-data">No records found for the selected date range.</td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
        </div>
        <% 
            } catch (Exception ex) {
                out.println("<script>alert('Error: " + ex.getMessage() + "');</script>");
            }
        }
        %>
    </div>
</body>
</html>
