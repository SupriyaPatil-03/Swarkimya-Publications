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
<h1 align=center>Add Books</h1>
<form action="upload.jsp" method="post" enctype="multipart/form-data" class="form-group">
    <label for="file">Select an image to upload:</label>
    <input type="file" name="file" class="form-control-file" id="file">
    <br/>
    <button type="submit" class="btn btn-success">Upload</button>
</form>
        
<form id="frmreg" method="post" name="myForm" class="form-group">
    <div class="form-group">
        <label for="name">Product ID:</label>
        <input id="name" type="text" name="id" class="form-control" placeholder="Enter Product id"><br>
    </div>
    <div class="form-group">
        <label for="name">Product Name:</label>
        <input id="name" type="text" name="name" class="form-control" placeholder="Enter Product Name"><br>
    </div>
    <div class="form-group">
        <label for="price">Product Price:</label>
        <input id="name" type="text" name="price" class="form-control" placeholder="Enter Product price"><br>
    </div>
    <div class="form-group">
        <label for="cat">Category:</label>
        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
        <select name="type" class="form-control">
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

<%
if(request.getParameter("btnsub") != null){
    String id,name,price,cat,fn;
    id = request.getParameter("id");
    name = request.getParameter("name");
    price = request.getParameter("price");
    cat = request.getParameter("type");
    fn = (String) session.getAttribute("filepath");
    try {
        String q = "insert into addbooks(id, name, price, category, productimg) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pst = cn.prepareStatement(q);
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, price);
        pst.setString(4, cat);
        pst.setString(5, fn);
        pst.executeUpdate();
        out.println("<script>alert('Book added to Book Gallary Successfully');window.location='../gal.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
<center>
<br>
<div class="col-sm-8">
<h1 align=center>Available Books</h1>
<table class=table>
<thead>
<tr>
<th>Product Id</th><th>Product Name</th><th>Category</th><th>Price</th><th>Image</th><th>Actions</th>
</tr>
</thead>
<tbody>
<%
try {
    PreparedStatement pst = cn.prepareStatement("select * from addbooks");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String price = rs.getString("price");
        String cat = rs.getString("category");
        String image = rs.getString("productimg");
%>
<tr>
<td><%=id%></td><td><%=name%></td><td><%=cat%></td><td><%=price%></td>
<td><img src="http://localhost:9090/SwarkimyaPublication/images/<%= image%>" width="150" height="150"></td>
<td><a href="delete.jsp?id=<%=id%>">Delete</a>  <a href="up.jsp?id=<%=id%>">Update</a></td>
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
