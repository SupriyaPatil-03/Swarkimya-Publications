<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form method="post">
          <h1 class="mb-5">Login Here</h1>
          <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="email">Email address</label>
            <input type="email" name="email" id="email" class="form-control form-control-lg" placeholder="Enter your email address" required />
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <label class="form-label" for="pass">Password</label>
            <input type="password" id="pass" class="form-control form-control-lg" placeholder="Enter password" name="pass" required />
          </div> 

          <!-- Remember me and Forgot password -->
          <div class="d-flex justify-content-between align-items-center mb-4">
            <div class="form-check">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>

          <!-- Submit button -->
          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem;" name="btnsub">Login</button>
           
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<%
if(request.getParameter("btnsub") != null) {
  String email = request.getParameter("email");
  String pass = request.getParameter("pass");
  try {
    PreparedStatement pst = cn.prepareStatement("select * from adminlogin where emailid=? and password=?");
    pst.setString(1, email);
    pst.setString(2, pass);
    ResultSet result = pst.executeQuery();
    if(result.next()) {
      session.setAttribute("email", email);
      out.println("<script>window.location='admin/index1.jsp'</script>");
    } else {
      out.println("<center><b><font color='red'>Incorrect email or password</font></b></center>");
    }
  } catch(Exception ex) {
    out.println(ex);
  }
}
%>
<%@include file="footer.jsp"%>
