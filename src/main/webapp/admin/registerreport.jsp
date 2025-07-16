<%@include file="../connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Report</title>
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
        h3, h2 {
            font-family: 'Arial', sans-serif;
            text-transform: uppercase;
            margin: 0;
        }
        h3 {
            color: #000000;
            font-size: 30px;
        }
        h2 {
            color: #333333;
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
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
        .total-count {
            font-size: 18px;
            color: #333;
            font-weight: bold;
            text-align: right;
            margin-bottom: 10px;
        }
        button {
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
        button:hover {
            background-color: #218838;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        button:active {
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
                margin-bottom: 30px; /* Adjust spacing for print */
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

        <% 
        String n, a, c, g, con, e;
        int totalCount = 0;
        try {
            PreparedStatement pst = cn.prepareStatement("SELECT * FROM register");
            ResultSet rs = pst.executeQuery();
        %>
        <div id="printableArea">
            <table class="table">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Gender</th>
                        <th>Contact No</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    int srNo = 1;
                    while (rs.next()) {
                        n = rs.getString("name");
                        a = rs.getString("address");
                        c = rs.getString("city");
                        g = rs.getString("gender");
                        con = rs.getString("contact");
                        e = rs.getString("emailid");
                        totalCount++;
                    %>
                    <tr>
                        <td><%=srNo++%></td>
                        <td><%=n%></td>
                        <td><%=a%></td>
                        <td><%=c%></td>
                        <td><%=g%></td>
                        <td><%=con%></td>
                        <td><%=e%></td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
            <div class="total-count">Total Registered Users: <%=totalCount%></div>
        </div>
        <button onclick="printReport()" class="btn btn-secondary no-print mt-4">Download PDF</button>
        <% 
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
