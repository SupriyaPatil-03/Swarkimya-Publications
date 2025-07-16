<%@page import="java.sql.*" %>
<%@include file="../connection.jsp"%>

<%
String ono = request.getParameter("ono");
%>

<h1 align="center">Delivery Details</h1>
<div class="row">
    <!-- Container with border -->
    <div class="container" style="border: 1px solid #ccc; padding: 20px; border-radius: 10px; width: 50%; margin: 0 auto;">
        <form id="frmreg" method="post" name="myForm" style="width:100%">
            <input type="hidden" value="<%=request.getParameter("ono")%>" name="txtono">

            <!-- Delivery Address Input -->
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                <textarea name="txtadd" class="form-control" placeholder="Enter Delivery Address" required></textarea>
            </div>
            <br>

            <!-- Contact No Input -->
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                <input id="price" type="text" class="form-control" name="mobile" placeholder="Contact No" required>
            </div>
            <br>

            <!-- Submit and Reset Buttons -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary" id="btnsub" name="btnsub">Submit</button>
                <button type="reset" class="btn btn-danger" id="btnres">Reset</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<%
if (request.getParameter("btnsub") != null) {
    String orderNumber = request.getParameter("txtono");
    String address = request.getParameter("txtadd");
    String mobile = request.getParameter("mobile");

    try {
        PreparedStatement pst = cn.prepareStatement("INSERT INTO delivery (orderno, address, contact) VALUES (?, ?, ?)");
        pst.setString(1, orderNumber);
        pst.setString(2, address);
        pst.setString(3, mobile);
        pst.executeUpdate();

        out.println("<script>alert('Thank You! Your order will be delivered soon.');window.location='index.jsp'</script>");
    } catch (Exception ex) {
        out.println(ex);
    }
}
%>
