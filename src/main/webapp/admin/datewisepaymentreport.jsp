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
            background-color: #f8f9fa; /* Changed to match the second snippet */
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
            table-layout: auto;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .table th, .table td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            color: #d9534f;
        }
        button {
            background-color: #1dccc9; /* Updated to match the second snippet */
            color: black;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #17b5b0;
        }
        button:active {
            background-color: #15a09d;
        }
        /* General form styling */
        form {
            max-width: 1200px; /* Add max width for alignment */
            margin: auto;
        }
        /* Flex container for aligning input fields and button */
        .form-row {
            display: flex;
            align-items: flex-end; /* Align items at the bottom */
            gap: 20px; /* Space between the elements */
            margin-bottom: 15px; /* Add margin below the form row */
        }
        /* Style for input fields */
        input[type="date"] {
            border: 2px solid #1dccc9; /* Updated border color */
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            width: 80%; /* Full width within the flex container */
        }
        input[type="date"]:focus {
            border-color: #0b9f9c;
            outline: none;
        }
        @media print {
            .no-print {
                display: none;
            }
            .table {
                width: 100%;
                font-size: 14px;
            }
            .table td, .table th {
                padding: 8px;
                word-wrap: break-word;
            }
            @page {
                size: auto;
                margin: 10mm;
            }
            .header {
                margin-bottom: 30px; /* Adjust spacing for print */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h3><img src="images/logo2.png" alt="Logo" style="height: 40px; margin-right: 5px;">
            Swarkimya Publications</h3>
        </div>
         
        <div id="header" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <div style="flex: 2; text-align: center;">
                <p style="margin: 0;">Plot no.24, Market yard, Rawivar Peth, Radhika Road, Satara, India, Maharashtra</p>
                <p style="margin: 0;">Email: swarkimayapublications2017@gmail.com </p>
                <p style="margin: 0;">Phone: 075071 52567</p>
            </div>
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

        <!-- Date-wise Payment Report Section -->
        <% 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            String amount, email, orderDate, paymentMethod, address;

            try {
                PreparedStatement pst = cn.prepareStatement(
                    "SELECT o.odt, o.email, o.amount, p.method, p.address " +
                    "FROM ordermst o JOIN payment p ON o.ordno = p.ordno " +
                    "WHERE o.odt BETWEEN ? AND ?");
                pst.setString(1, fromDate);
                pst.setString(2, toDate);
                ResultSet rs = pst.executeQuery();
%>
        <div id="resultsArea">
            <table class="table mb-3">
                <thead>
                    <tr>
                        <th>Order Date</th>
                        <th>Email</th>
                        <th>Amount</th>
                        <th>Payment Method</th>
                        <th>Address</th>                    
                    </tr>
                </thead>
                <tbody>
                    <% 
                    boolean hasResults = false; // Track if there are results
                    while (rs.next()) {
                        hasResults = true;
                        orderDate = rs.getString("odt");
                        email = rs.getString("email");
                        amount = rs.getString("amount");
                        paymentMethod = rs.getString("method");
                        address = rs.getString("address");
                    %>
                    <tr>
                        <td><%=orderDate%></td>
                        <td><%=email%></td>
                        <td><%=amount%></td>
                        <td><%=paymentMethod%></td>
                        <td><%=address%></td>
                    </tr>
                    <% 
                    }
                    if (!hasResults) {
                    %>
                    <tr>
                        <td colspan="5" class="no-data">No records found for the selected date range.</td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
        </div>
        <% 
            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }
        }
        %>
    </div>
</body>
</html>
