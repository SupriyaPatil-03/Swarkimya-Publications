<%@include file="../connection.jsp"%>
<%
try
{
String id=request.getParameter("id");
PreparedStatement ps = cn.prepareStatement("delete from addbooks where id=?");
ps.setString(1,id);
ps.executeUpdate();

out.println("<script>alert('Record Deleted');window.location='addbooks.jsp'</script>");
}
catch(Exception ex)
{
out.println(ex);
}
%>