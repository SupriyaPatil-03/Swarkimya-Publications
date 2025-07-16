<%@page import="java.sql.*" %>
<%@include file="../connection.jsp"%>
<%@include file="header.jsp"%>

<style>
*{
    margin: 0;
    padding: 0;
}
form{
    padding: 10px;
    align-items: center;
    justify-content: center;
    background-color: rgba(104, 99, 99, 0.5);
    width: 700px;
    border-radius: 9.5px;
    box-shadow: inset -5px -5px rgba(44,43,43,0.5);
}
h1{
    color: black;
    font-size: 3rem;
    border-bottom: 4px solid rgba(255, 255, 255, 0.5);
}
.productname, .productprice, .productimage, .productquantity, .productcategories {
    padding: 5px;
    margin: 10px;
    width: 70%;
}
</style>

<%
String id = "";
String counselingName = "";
String counselorName = "";
String price = "";
String cat = "";
String image = "";
String des = "";
String dr = "";
try {
    id = request.getParameter("id");
    session.setAttribute("id", id);
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addcounseling WHERE id=?");
    pst.setString(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        counselingName = rs.getString("counselingName");
        counselorName = rs.getString("counselorName");
        price = rs.getString("price");
        cat = rs.getString("category");
        image = rs.getString("courseimg");
        des = rs.getString("description");
        dr = rs.getString("duration");
    }
} catch(Exception ex) {
    out.println(ex);
}
%>

<center>
<h1 align="center">Update Counseling</h1>

<form action="upload2.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file" value="<%=image %>">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>

<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="id">Counseling ID:</label>
        <input id="id" type="text" name="id" class="form-control" placeholder="Enter Counseling ID" value="<%=id %>"><br>
    </div>
    <div class="form-group">
        <label for="counselingName">Counseling Name:</label>
        <input id="counselingName" type="text" name="counselingName" class="form-control" placeholder="Enter Counseling Name" value="<%=counselingName %>"><br>
    </div>
    <div class="form-group">
        <label for="counselorName">Counselor Name:</label>
        <input id="counselorName" type="text" name="counselorName" class="form-control" placeholder="Enter Counselor Name" value="<%=counselorName %>"><br>
    </div>
    <div class="form-group">
        <label for="dr">Counseling Duration:</label>
        <input id="dr" type="text" name="dr" class="form-control" placeholder="Enter Duration" value="<%=dr %>"><br>
    </div>
    <div class="form-group">
        <label for="price">Counseling Charges:</label>
        <input id="price" type="text" name="price" class="form-control" placeholder="Enter Charges" value="<%=price %>"><br>
    </div>
    <div class="form-group">
        <label for="des">Counseling Description:</label>
        <input id="des" type="text" name="des" class="form-control" placeholder="Enter Description" value="<%=des %>"><br>
    </div>
    <div class="form-group">
        <label for="cat">Category:</label>
        <select name="type" class="form-control">
            <option value="<%=cat %>"><%=cat %></option>
            <option value="Counseling Sessions">Counseling Sessions</option>
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
    counselingName = request.getParameter("counselingName");
    counselorName = request.getParameter("counselorName");
    price = request.getParameter("price");
    cat = request.getParameter("type");
    des = request.getParameter("des");
    dr = request.getParameter("dr");

    try {
        String q = "UPDATE addcounseling SET counselingName=?, counselorName=?, price=?, category=?, courseimg=?, description=?, duration=? WHERE id=?";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, counselingName);
        pst.setString(2, counselorName);
        pst.setString(3, price);
        pst.setString(4, cat);
        pst.setString(6, des);
        pst.setString(7, dr);
        pst.setString(8, id);
        pst.executeUpdate();
        out.println("<script>alert('Counseling session updated successfully');window.location='../counseling.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
