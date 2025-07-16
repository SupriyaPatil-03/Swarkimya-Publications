<%@include file="../connection.jsp"%>
<%
try
{
String id=request.getParameter("id");
PreparedStatement ps = cn.prepareStatement("delete from addcounseling where id=?");
ps.setString(1,id);
ps.executeUpdate();

out.println("<script>alert('Record Deleted');window.location='counseling.jsp'</script>");
}
catch(Exception ex)
{
out.println(ex);
}
%>