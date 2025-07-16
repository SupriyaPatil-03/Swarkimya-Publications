<%@include file="../connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enrollment Report</title>
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
            <div id="header" style="text-align: center; margin-bottom: 20px;">
                <p style="margin: 0;">Plot no.24, Market yard, Rawivar Peth, Radhika Road, Satara, India, Maharashtra</p>
                <p style="margin: 0;">Email: swarkimayapublications2017@gmail.com</p>
                <p style="margin: 0;">Phone: 075071 52567</p>
            </div>
            <!-- Form to filter by date range -->
            <form method="post">
                <div class="form-row">
                    <input type="date" name="startDate" class="form-control" placeholder="Start Date" required>
                    <input type="date" name="endDate" class="form-control" placeholder="End Date" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
            </form>

            <% 
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            int totalCount = 0;

            if (request.getMethod().equalsIgnoreCase("post") && startDate != null && endDate != null) {
                try {
                    PreparedStatement pst = cn.prepareStatement("SELECT * FROM admission WHERE enrollment_date BETWEEN ? AND ?");
                    pst.setString(1, startDate);
                    pst.setString(2, endDate);
                    ResultSet rs = pst.executeQuery();
            %>
            <div id="printableArea" class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sr No.</th>
                            <th>Name</th>
                            <th>Course</th>
                            <th>Duration</th>
                            <th>Charges</th>
                            <th>Enrollment Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int srNo = 1;
                        while (rs.next()) {
                            String name = rs.getString("child_name");
                            String course = rs.getString("course_name");
                            String duration = rs.getString("duration");
                            String charges = rs.getString("charges");
                            String enrollmentDate = rs.getString("enrollment_date");
                            totalCount++;
                        %>
                        <tr>
                            <td><%=srNo++%></td>
                            <td><%=name%></td>
                            <td><%=course%></td>
                            <td><%=duration%></td>
                            <td><%=charges%></td>
                            <td><%=enrollmentDate%></td>
                        </tr>
                        <% 
                        }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6" class="total-count">Total Enrollments: <%=totalCount%></td>
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
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
