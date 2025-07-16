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
String name = "";
String price = "";
String cat = "";
String image = "";
String id = "";
String ad = "";
String fn = "";
try {
    id = request.getParameter("id");
    session.setAttribute("id", id);
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addbooks WHERE id=?");
    pst.setString(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        price = rs.getString("price");
        cat = rs.getString("category");
        image = rs.getString("productimg");
        id = rs.getString("id");
    }
} catch(Exception ex) {
    out.println(ex);
}
%>

<center>
<h1 align="center">Add Books</h1>
<form action="upload2.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file" value="<%=image %>">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>

<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="id">Product ID:</label>
        <input id="id" type="text" name="id" class="form-control" placeholder="Enter Product id" value="<%=id %>"><br>
    </div>
    <div class="form-group">
        <label for="name">Product Name:</label>
        <input id="name" type="text" name="name" class="form-control" placeholder="Enter Product Name" value="<%=name %>"><br>
    </div>
    <div class="form-group">
        <label for="price">Product Price:</label>
        <input id="price" type="text" name="price" class="form-control" placeholder="Enter Product price" value="<%=price %>"><br>
    </div>
    <div class="form-group">
        <label for="cat">Category:</label>
        <select name="type" class="form-control">
            <option value="<%=cat %>"><%=cat %></option>
            <option>--select Category--</option>
            <option value="First Standard">First Standard</option>
            <option value="Second Standard">Second Standard</option>
            <option value="Third Standard">Third Standard</option>
            <option value="Fourth Standard">Fourth Standard</option>
        </select>
    </div>
    <br>
    <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Submit</button>
    <button type="reset" class="btn btn-danger">Reset</button>
</form>
</center>

<center>
<br>
<div class="col-sm-8">
<h1 align="center">Available Books</h1>
<table class="table">
<thead>
<tr>
<th>Actions</th><th>Product Id</th><th>Product Name</th><th>Category</th><th>Price</th><th>Image</th>
</tr>
</thead>
<tbody>
<%
try {
    PreparedStatement pst = cn.prepareStatement("SELECT * FROM addbooks");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        id = rs.getString("id");
        name = rs.getString("name");
        price = rs.getString("price");
        cat = rs.getString("category");
        image = rs.getString("productimg");
%>
<tr>
<td><a href="delete.jsp?id=<%=id%>">Delete</a>  <a href="up.jsp?id=<%=id%>">Update</a></td>
<td><%=id%></td>
<td><%=name%></td>
<td><%=cat%></td>
<td><%=price%></td>
<td><img src="http://localhost:9090/SwarkimyaPublication/images/<%=image%>" width="150" height="150"></td>
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

<%
if (request.getParameter("btnsub") != null) {
    id = request.getParameter("id");
    name = request.getParameter("name");
    price = request.getParameter("price");
    cat = request.getParameter("type");
    fn = (String) session.getAttribute("filepath");

    try {
        String q = "UPDATE addbooks SET name=?, category=?, price=?, productimg=? WHERE id=?";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2, cat);
        pst.setString(3, price);
        pst.setString(4, fn);  // File path for the image
        pst.setString(5, id);
        pst.executeUpdate();
        out.println("<script>alert('Book Details Updated Successfully'); window.location='addbooks.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
