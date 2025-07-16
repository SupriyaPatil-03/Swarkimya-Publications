<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>
<h1 class="text-center">Books</h1>
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
               
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" width="300" height="300"><br>
                Book Name: <%= name %><br>
                Book price: <%= price %>
                Book Category: <%= cat %><br>
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