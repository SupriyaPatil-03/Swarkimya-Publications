<%@page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>

<style>
    .gallery-img {
        border: 1px solid black; 
        padding: 5px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .thumbnail {
        margin-bottom: 20px;
        padding: 10px; /* Unified padding */
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
        text-align: center; /* Center the content */
    }
    .thumbnail img {
        margin-bottom: 10px;
    }
    .thumbnail .caption {
        padding: 0; /* Remove padding */
    }
</style>

<%
String cat="";
if(request.getParameter("type")!=null)
    cat=request.getParameter("type");
%>

<h1 align=center><%=cat %></h1>
<div class="row">

<%
try {
    PreparedStatement pst = cn.prepareStatement("select * from addbooks where category=?");
    pst.setString(1, cat);
    
    ResultSet rs = pst.executeQuery();
    int i=0;
    while (rs.next()) {
        String id = rs.getString("id");
        String image = rs.getString("productimg");
        cat = rs.getString("category");
        String price = rs.getString("price");
        String name = rs.getString("name");    
%>

<div class='col-md-3'>
    <div class="thumbnail">
        <a href="<%=image%>" target="_blank">
            <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" class="img-responsive gallery-img" width="250" height="300">
        </a>
        <div class="caption">
            <b>
                Book Name: <%= name %><br>
                Category: <%= cat %><br>
                Rs.<%= price %>/-<br>
            </b>
        </div>
        <a class="btn btn-primary" href="buy.jsp?id=<%=id %>&price=<%=price %>&name=<%=name %>&category=<%=cat %>">Buy Now</a>
    </div>
</div>

<%
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
</div>
<%@ include file="footer.jsp" %>
