<%@include file="../connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Report</title>
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
        h3, h4 {
            font-family: 'Arial', sans-serif;
            text-transform: uppercase;
            margin: 0;
        }
        h3 {
            color: #000000;
            font-size: 30px;
        }
        h4 {
            color: #333333;
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
        }
        .form-row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            gap: 10px;
        }
        .form-select {
            width: 250px;
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
            width: 80%; /* Set table width to 80% */
            table-layout: auto;
            font-size: 16px;
            margin-bottom: 20px;
            margin-left: auto; /* Center align table */
            margin-right: auto; /* Center align table */
            border: 2px solid black; /* Set table border color to black */
        }
        .table th, .table td {
            border: 1px solid black; /* Set table cell border to black */
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .total-count {
            font-size: 18px;
            color: #333;
            font-weight: bold;
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
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            display: block;
            margin: 0 auto;
        }
        .btn-secondary:hover {
            background-color: #218838;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .btn-secondary:active {
            background-color: #1e7e34;
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
                margin-bottom: 30px;
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
        
         
        <div id="header" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
               
                <div style="flex: 2; text-align: center;">
                  
                    <p style="margin: 0;">Plot no.24,Market yard, Rawivar Peth, Radhika Road, Satara, India, Maharashtra</p>
                    <p style="margin: 0;">Email: swarkimayapublications2017@gmail.com </p>
                    <p style="margin: 0;">Phone: 075071 52567</p>
                </div>
            </div>

        <!-- Form to filter by category -->
        <form method="post">
            <div class="form-row">
                <select name="category" id="category" class="form-select" required>
                    <option value="">-- Select Category --</option>
                    <option value="All">All Books</option>
                    <option value="First Standard">First Standard</option>
                    <option value="Second Standard">Second Standard</option>
                    <option value="Third Standard">Third Standard</option>
                    <option value="Fourth Standard">Fourth Standard</option>
                </select>
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </form>

        <% 
        String categoryFilter = request.getParameter("category");
        String id, name, price, category, image;
        int totalCount = 0;

        if (request.getMethod().equalsIgnoreCase("post") && categoryFilter != null) {
            try {
                PreparedStatement pst;
                if ("All".equals(categoryFilter)) {
                    pst = cn.prepareStatement("SELECT * FROM addbooks");
                } else {
                    pst = cn.prepareStatement("SELECT * FROM addbooks WHERE category = ?");
                    pst.setString(1, categoryFilter);
                }
                ResultSet rs = pst.executeQuery();
        %>
        <div id="printableArea" class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Books Image</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    int srNo = 1;
                    while (rs.next()) {
                        name = rs.getString("name");
                        price = rs.getString("price");
                        category = rs.getString("category");
                        image = rs.getString("productimg");
                        totalCount++;
                    %>
                    <tr>
                        <td><%=srNo++%></td>
                        <td><%=name%></td>
                        <td><%=price%></td>
                        <td><%=category%></td>
                        <td><img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" width="50" height="50"></td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
                <!-- Total Count Row -->
                <tfoot>
                    <tr>
                        <td colspan="5" class="total-count">Total Books: <%=totalCount%></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <button onclick="printReport()" class="btn btn-secondary no-print mt-4">Download PDF</button>
        <% 
            } catch (Exception ex) {
                out.println(ex);
            }
        }
        %>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
