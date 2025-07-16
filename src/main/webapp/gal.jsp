<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>

<style>
    .gallery-img {
        border: 1px solid black; /* Increased the border width */
        padding: 5px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .caption {
        text-align: center;
        margin-bottom: 20px;
        padding: 10px; /* Added padding for better spacing */
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    .caption img {
        margin-bottom: 10px;
    }
</style>

<h1 class="text-center">Books Gallery</h1>
<div class="row">
<%
try {
    String id, name, price, cat, image;
    PreparedStatement pst = cn.prepareStatement("select * from addbooks");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
    	id = rs.getString("id");
        name = rs.getString("name");
        price = rs.getString("price");
        cat = rs.getString("category");
        image = rs.getString("productimg");
%>
        <div class="col-sm-3">
            <div class="caption">
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" width="250" height="300" class="gallery-img"><br>
                Book Name: <%= name %><br>
                Category: <%= cat %><br>
                Price: <%= price %><br>
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
