<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="connection.jsp"%>
<div>
<section class="h-100 h-custom" style="background-color: #8fc4b7;">
  <div class="container py-6 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
         <div style="text-align: center;">
    <img src="images/2.webp" width="95%" height="100%">
</div>
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">REGISTRATION INFO</h3>
<form method="post">
<div class="mb-3">
    <label for="nm" class="form-label">Name:</label>
    <input type="text" class="form-control" id="nm" placeholder="Enter name" name="nm" pattern="\D+" required>
  </div>
  <div class="mb-3">
    <label for="addr" class="form-label">Address:</label>
    <input type="text" class="form-control" id="addr" placeholder="Enter address" name="addr" required>
  </div>
  <div class="mb-3">
    <label for="ct" class="form-label">City:</label>
    <select class="form-select" id="ct" name="ct" required>
  <option>--select--</option>
  <option>Satara</option>
  <option>Sangali</option>
  <option>Pune</option>
  <option>Mumbai</option>
</select>
  </div>
  <div class="mb-3">
    <label for="gender" class="form-label">Gender:</label>
    <input type="radio" id="gender" name="gender" value="Male">Male
    <input type="radio" id="gender" name="gender" value="Female">Female
  </div>
  <div class="mb-3 mt-3">
    <label for="contact" class="form-label">Contact No:</label>
    <input type="tel" class="form-control" id="contact" placeholder="Enter contact no" name="contact" pattern="\d{10}" required>
  </div>
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">Email:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
  </div>
  <div class="text-center">
  <button type="submit" class="btn btn-success btn-lg mb-1" name="btnsub">Register</button>
  <button type="reset" class="btn btn-danger btn-lg mb-1">Reset</button>
  </div>
</form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<%
if(request.getParameter("btnsub")!=null)
{
	String n,a,c,g,con,e,p;
	n=request.getParameter("nm");
	a=request.getParameter("addr");
	c=request.getParameter("ct");
	g=request.getParameter("gender");
	con=request.getParameter("contact");
	e=request.getParameter("email");
	p=request.getParameter("pswd");
	try
	{
		PreparedStatement pst=cn.prepareStatement("insert into register values(?,?,?,?,?,?,?)");
		pst.setString(1,n);
		pst.setString(2,a);
		pst.setString(3,c);
		pst.setString(4,g);
		pst.setString(5,con);
		pst.setString(6,e);
		pst.setString(7,p);
		int count=pst.executeUpdate();
		if(count>0)
			out.println("<script>alert('Registration successful')</script>");
		else
			out.println("<script>alert('problem occured')</script>");		
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
}
%>

</div>
<%@include file="footer.jsp"%>