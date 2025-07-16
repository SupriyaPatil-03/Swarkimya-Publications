<%@include file="../connection.jsp"%>
<%
try
{
String id=request.getParameter("id");
PreparedStatement ps = cn.prepareStatement("delete from booksession where id=?");
ps.setString(1,id);
ps.executeUpdate();

out.println("<script>alert('Counseling Session is deleted from Your Counseling Profile');window.location='viewenroll.jsp'</script>");
}
catch(Exception ex)
{
out.println(ex);
}
%>