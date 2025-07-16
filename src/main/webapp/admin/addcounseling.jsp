<%@page import="java.sql.*" %>
<%@include file="../connection.jsp"%>
<%@include file="header.jsp"%>

<style>
* {
    margin: 0;
    padding: 0;
}
form {
    padding: 10px;
    align-items: center;
    justify-content: center;
    background-color: rgba(104, 99, 99, 0.5);
    width: 700px;
    border-radius: 9.5px;
    box-shadow: inset -5px -5px rgba(44,43,43,0.5);
}
h1 {
    color: black;
    font-size: 3rem;
    border-bottom: 4px solid rgba(255, 255, 255, 0.5);
}
.productname, .productprice, .productimage, .productquantity, .productcategories {
    padding: 5px;
    margin: 10px;
    width: 70%;
}
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center; /* Centering text within table cells */
}
.table th {
    background-color: #f2f2f2;
    color: black;
}
.table img {
    border: 2px solid black;
    padding: 5px;
    border-radius: 5px;
}
</style>
<center>
<h1 align=center>Add Counseling</h1>
<form action="upload1.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>
        
<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="id">Counseling ID:</label>
        <input id="id" type="text" name="id" class="form-control" placeholder="Enter ID"><br>
    </div>
    <div class="form-group">
        <label for="counselingName">Counseling Name:</label>
        <input id="counselingName" type="text" name="counselingName" class="form-control" placeholder="Enter Counseling Name"><br>
    </div>
    <div class="form-group">
        <label for="counselorName">Counselor Name:</label>
        <input id="counselorName" type="text" name="counselorName" class="form-control" placeholder="Enter Counselor Name"><br>
    </div>
    <div class="form-group">
        <label for="dr">Counseling Duration:</label>
        <input id="dr" type="text" name="dr" class="form-control" placeholder="Enter Duration"><br>
    </div>
    <div class="form-group">
        <label for="price">Counseling Charges:</label>
        <input id="price" type="text" name="price" class="form-control" placeholder="Enter Charges"><br>
    </div>
    <div class="form-group">
        <label for="des">Counseling Description:</label>
        <input id="des" type="text" name="des" class="form-control" placeholder="Enter Description"><br>
    </div>
    <div class="form-group">
        <label for="cat">Category:</label>
        <select name="type" class="form-control">
            <option>--select Category--</option>
            <option value="Counseling Sessions">Counseling Sessions</option>
        </select>
    </div>
    <br>
    <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Submit</button>
    <button type="reset" class="btn btn-danger">Reset</button>
</form>
</center>

<%
if(request.getParameter("btnsub") != null){
    String id, counselingName, counselorName, price, cat, fn, des, dr;
    id = request.getParameter("id");
    counselingName = request.getParameter("counselingName");
    counselorName = request.getParameter("counselorName");
    price = request.getParameter("price");
    cat = request.getParameter("type");
    fn = (String) session.getAttribute("filepath");
    des = request.getParameter("des");
    dr = request.getParameter("dr");
    try {
        String q = "INSERT INTO addcounseling(id, counselingName, counselorName, price, category, courseimg, description, duration) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, id);
        pst.setString(2, counselingName);
        pst.setString(3, counselorName);
        pst.setString(4, price);
        pst.setString(5, cat);
        pst.setString(6, fn);
        pst.setString(7, des);
        pst.setString(8, dr);
        pst.executeUpdate();
        out.println("<script>alert('Counseling session added successfully');window.location='../counseling.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
<center>
<br>
<div class="col-sm-8">
<h1 align=center>Counseling Sessions</h1>
<table class=table>
<thead>
<tr>
<th>Course ID</th><th>Counseling Name</th><th>Counselor Name</th><th>Category</th><th>Charges</th><th>Description</th><th>Duration</th><th>Image</th><th>Actions</th>
</tr>
</thead>
<tbody>
<%
try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addcounseling");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String id = rs.getString("id");
        String counselingName = rs.getString("counselingName");
        String counselorName = rs.getString("counselorName");
        String price = rs.getString("price");
        String cat = rs.getString("category");
        String image = rs.getString("courseimg");
        String des = rs.getString("description");
        String dr = rs.getString("duration");
%>
<tr>
<td><%=id%></td>
<td><%=counselingName%></td>
<td><%=counselorName%></td>
<td><%=cat%></td>
<td><%=price%></td>
<td><%=des%></td>
<td><%=dr%></td>
<td><img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" width="150" height="150"></td>
<td><a href="delete2.jsp?id=<%=id%>">Delete</a> <a href="up2.jsp?id=<%=id%>">Update</a></td>
</tr>
<%
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
</tbody>
</table>
</div>
</center>
<%@include file="footer.jsp"%>
