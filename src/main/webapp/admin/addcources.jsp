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
<h1 align=center>Add Class Courses</h1>
<form action="upload3.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>
        
<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="id">Course ID:</label>
        <input id="id" type="text" name="id" class="form-control" placeholder="Enter Course ID"><br>
    </div>
    <div class="form-group">
        <label for="name">Course Name:</label>
        <input id="name" type="text" name="name" class="form-control" placeholder="Enter Course Name"><br>
    </div>
    <div class="form-group">
        <label for="instructor">Instructor Name:</label>
        <input id="instructor" type="text" name="instructor" class="form-control" placeholder="Enter Instructor Name"><br>
    </div>
    <div class="form-group">
        <label for="dr">Course Duration:</label>
        <input id="dr" type="text" name="dr" class="form-control" placeholder="Enter Course Duration"><br>
    </div>
    <div class="form-group">
        <label for="startdate">Start Date:</label>
        <input id="startdate" type="date" name="startdate" class="form-control"><br>
    </div>
    <div class="form-group">
        <label for="enddate">End Date:</label>
        <input id="enddate" type="date" name="enddate" class="form-control"><br>
    </div>
    <div class="form-group">
        <label for="price">Course Charges:</label>
        <input id="price" type="text" name="price" class="form-control" placeholder="Enter Course Charges"><br>
    </div>
    <div class="form-group">
        <label for="des">Course Description:</label>
        <input id="des" type="text" name="des" class="form-control" placeholder="Enter Course Description"><br>
    </div>
    <div class="form-group">
        <label for="cat">Category:</label>
        <select name="type" class="form-control">
            <option>--select Category--</option>
            <option value="Handwriting Course">Handwriting Course</option>
        </select>
    </div>
    <br>
    <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Submit</button>
    <button type="reset" class="btn btn-danger">Reset</button>
</form>
</center>

<%
if(request.getParameter("btnsub") != null){
    String id, name, instructor, price, cat, fn, des, dr, startDate, endDate;
    id = request.getParameter("id");
    name = request.getParameter("name");
    instructor = request.getParameter("instructor");
    price = request.getParameter("price");
    cat = request.getParameter("type");
    fn = (String) session.getAttribute("filepath");
    des = request.getParameter("des");
    dr = request.getParameter("dr");
    startDate = request.getParameter("startdate");
    endDate = request.getParameter("enddate");

    try {
        String q = "INSERT INTO addcourses(id, name, instructor, price, category, courseimg, description, duration, startdate, enddate) " +
                   "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, instructor);
        pst.setString(4, price);
        pst.setString(5, cat);
        pst.setString(6, fn);
        pst.setString(7, des);
        pst.setString(8, dr);
        pst.setString(9, startDate);
        pst.setString(10, endDate);
        pst.executeUpdate();
        out.println("<script>alert('Course added Successfully');window.location='../course.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
<center>
<br>
<div class="col-sm-8">
<h1 align=center>Handwriting Courses</h1>
<table class=table>
<thead>
<tr>
<th>Course Id</th><th>Course Name</th><th>Instructor</th><th>Category</th><th>Charges</th><th>Description</th><th>Duration</th><th>Start Date</th><th>End Date</th><th>Image</th><th>Actions</th>
</tr>
</thead>
<tbody>
<%
try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addcourses");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String instructor = rs.getString("instructor");
        String price = rs.getString("price");
        String cat = rs.getString("category");
        String image = rs.getString("courseimg");
        String des = rs.getString("description");
        String dr = rs.getString("duration");
        String startDate = rs.getString("startdate");
        String endDate = rs.getString("enddate");
%>
<tr>
<td><%=id%></td><td><%=name%></td><td><%=instructor%></td><td><%=cat%></td><td><%=price%></td><td><%=des%></td><td><%=dr%></td><td><%=startDate%></td><td><%=endDate%></td>
<td><img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" width="150" height="150"></td>
<td><a href="delete1.jsp?id=<%=id%>">Delete</a>  <a href="up3.jsp?id=<%=id%>">Update</a></td>
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
