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
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
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

<%
String id = "";
String name = "";
String instructor = "";
String price = "";
String category = "";
String image = "";
String description = "";
String duration = "";
String startDate = "";
String endDate = "";

try {
    id = request.getParameter("id");
    session.setAttribute("id", id);
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addcourses WHERE id=?");
    pst.setString(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        instructor = rs.getString("instructor");
        price = rs.getString("price");
        category = rs.getString("category");
        image = rs.getString("courseimg");
        description = rs.getString("description");
        duration = rs.getString("duration");
        startDate = rs.getString("startdate");
        endDate = rs.getString("enddate");
    }
} catch(Exception ex) {
    out.println(ex);
}
%>

<center>
<h1 align="center">Update Course</h1>

<form action="upload3.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file" value="<%=image %>">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>

<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="id">Course ID:</label>
        <input id="id" type="text" name="id" class="form-control" placeholder="Enter Course ID" value="<%=id %>"><br>
    </div>
    <div class="form-group">
        <label for="name">Course Name:</label>
        <input id="name" type="text" name="name" class="form-control" placeholder="Enter Course Name" value="<%=name %>"><br>
    </div>
    <div class="form-group">
        <label for="instructor">Instructor Name:</label>
        <input id="instructor" type="text" name="instructor" class="form-control" placeholder="Enter Instructor Name" value="<%=instructor %>"><br>
    </div>
    <div class="form-group">
        <label for="duration">Course Duration:</label>
        <input id="duration" type="text" name="duration" class="form-control" placeholder="Enter Duration" value="<%=duration %>"><br>
    </div>
    <div class="form-group">
        <label for="startDate">Start Date:</label>
        <input id="startDate" type="date" name="startDate" class="form-control" value="<%=startDate %>"><br>
    </div>
    <div class="form-group">
        <label for="endDate">End Date:</label>
        <input id="endDate" type="date" name="endDate" class="form-control" value="<%=endDate %>"><br>
    </div>
    <div class="form-group">
        <label for="price">Course Charges:</label>
        <input id="price" type="text" name="price" class="form-control" placeholder="Enter Charges" value="<%=price %>"><br>
    </div>
    <div class="form-group">
        <label for="description">Course Description:</label>
        <input id="description" type="text" name="description" class="form-control" placeholder="Enter Description" value="<%=description %>"><br>
    </div>
    <div class="form-group">
        <label for="category">Category:</label>
        <select name="category" class="form-control">
            <option value="<%=category %>"><%=category %></option>
            <option value="Handwriting Course">Handwriting Course</option>
        </select>
    </div>
    <br>
    <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Update</button>
    <button type="reset" class="btn btn-danger">Reset</button>
</form>
</center>

<%
if (request.getParameter("btnsub") != null) {
    id = request.getParameter("id");
    name = request.getParameter("name");
    instructor = request.getParameter("instructor");
    price = request.getParameter("price");
    category = request.getParameter("category");
    description = request.getParameter("description");
    duration = request.getParameter("duration");
    startDate = request.getParameter("startDate");
    endDate = request.getParameter("endDate");

    try {
        String q = "UPDATE addcourses SET name=?, instructor=?, price=?, category=?, description=?, duration=?, startdate=?, enddate=? WHERE id=?";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2, instructor);
        pst.setString(3, price);
        pst.setString(4, category);
        pst.setString(5, description);
        pst.setString(6, duration);
        pst.setString(7, startDate);
        pst.setString(8, endDate);
        pst.setString(9, id);
        pst.executeUpdate();
        out.println("<script>alert('Course updated successfully');window.location='../course.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
<%@include file="footer.jsp"%>
