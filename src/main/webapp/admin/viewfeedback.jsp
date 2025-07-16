<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>
<section class="h-100 h-custom" style="background-color: #D3D3D3">
<div id="demo" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/1.jpg" class="d-block w-100" style="width:100%;height:400px">
    </div>
    <div class="carousel-item">
      <img src="images/2.jpg" class="d-block w-100" style="width:100%;height:400px">
    </div>
    <div class="carousel-item">
      <img src="images/3.jpg" class="d-block w-100" style="width:100%;height:400px">
    </div>
  </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
<h1 align=center>User Feedbacks</h1>

<%
try
{
	PreparedStatement pst=cn.prepareStatement("select * from feedback");
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		String em=rs.getString("emailid");
		String f1=rs.getString("msg");
%>
<div class="row" style="width:70%;padding:20px;border:solid 2px grey;border-radius:5px;margin:auto auto"><div class='col-md-8 col-md-offset-2'>
<div class="thumbnail">

<div class="caption">
<b><%=em %></b><br><%=f1 %></div></div></div></div><br>

<%
	}
}
catch(Exception ex)
{
	out.println(ex);
}
%>
</section>
<%@include file="footer.jsp"%>
</body>
</html>
