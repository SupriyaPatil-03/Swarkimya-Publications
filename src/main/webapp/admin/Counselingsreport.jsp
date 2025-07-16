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
            background-color: #f0f4f7;
            font-family: 'Arial', sans-serif;
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
            font-family: 'Arial', sans-serif;
            color: #000000;
            font-size: 30px;
            text-transform: uppercase;
        }
        .form-row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            gap: 10px;
        }
        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .btn-primary {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        .table {
            border-collapse: collapse;
            width: 80%;
            font-size: 16px;
            margin: 0 auto;
            border: 2px solid black;
        }
        .table th, .table td {
            border: 1px solid black;
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
        .btn-secondary {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin: 20px auto;
            display: block;
        }
        .btn-secondary:hover {
            background-color: #218838;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
    <script>
        function printReport() {
            var printContent = document.getElementById('printableArea').innerHTML;
            var originalContent = document.body.innerHTML;
            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>
</head>
<body>
     <div class="container">
        <div id="printableArea">
        <div class="header">
            <h3><img src="images/logo2.png" alt="Logo" style="height: 40px; margin-right: 5px;">
                Swarkimya Publications</h3>
            </div>
            <div id="header" style="text-align: center; margin-bottom: 20px;">
                <p style="margin: 0;">Plot no.24, Market yard, Rawivar Peth, Radhika Road, Satara, India, Maharashtra</p>
                <p style="margin: 0;">Email: swarkimayapublications2017@gmail.com</p>
                <p style="margin: 0;">Phone: 075071 52567</p>
            </div>
            <!-- Date Filter Form -->
            <form method="post">
                <div class="form-row">
                    <input type="date" name="fromDate" class="form-control" placeholder="From Date" required>
                    <input type="date" name="toDate" class="form-control" placeholder="To Date" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
            </form>

            <!-- Report Table -->
            <% 
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            boolean hasResults = false;

            if (request.getMethod().equalsIgnoreCase("post") && fromDate != null && toDate != null) {
                try {
                    PreparedStatement pst = cn.prepareStatement("SELECT enrollment_date, email, price FROM booksession WHERE enrollment_date BETWEEN ? AND ?");
                    pst.setString(1, fromDate);
                    pst.setString(2, toDate);
                    ResultSet rs = pst.executeQuery();
            %>
            <div class="table-container">
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
            <button onclick="printReport()" class="btn btn-secondary no-print">Download PDF</button>
            <% 
                } catch (Exception ex) {
                    out.println("<script>alert('Error: " + ex.getMessage() + "');</script>");
                }
            }
            %>
        </div>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
