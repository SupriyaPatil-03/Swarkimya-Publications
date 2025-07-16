<%@include file="../connection.jsp"%>
<%
try
{
String id=request.getParameter("id");
PreparedStatement ps = cn.prepareStatement("delete from cart where id=?");
ps.setString(1,id);
ps.executeUpdate();

out.println("<script>alert('Book deleted from cart');window.location='viewcart.jsp'</script>");
}
catch(Exception ex)
{
out.println(ex);
}
%>