<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="../connection.jsp"%>
<style>
.gradient-custom-3 {
  background: #84fab0;
  background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
  background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
}
.gradient-custom-4 {
  background: #84fab0;
  background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
  background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
}
</style>

<section class="h-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Enrollment Form</h2>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String duration = request.getParameter("duration");
    String charges = request.getParameter("price");
    String instructor = request.getParameter("instructor");
    String startDate = request.getParameter("startDate");  // Fetching start date from URL parameter
    String endDate = request.getParameter("endDate");      // Fetching end date from URL parameter
%>

<!-- The form starts here -->
<form method="post">
    <b><label for="nm" class="form-label">Child's Information:</label></b>
    <div class="mb-3">
        <label for="nm" class="form-label">Name:</label>
        <input type="text" class="form-control" id="nm" placeholder="Enter name" name="nm">
    </div>

    <div class="mb-3">
        <label for="startDate">Date of Birth:</label>
        <input type="date" class="form-control" id="startDate" name="startDate" onchange="calculateAge()">
    </div>

    <div class="mb-3">
        <label for="gender" class="form-label">Gender:</label>
        <input type="radio" id="gender" name="gender" value="Male">Male
        <input type="radio" id="gender" name="gender" value="Female">Female
    </div>

    <div class="mb-3">
        <label for="age" class="form-label">Age:</label>
        <input type="text" class="form-control" id="age" placeholder="Enter age" name="age" readonly>
    </div>

    <div class="mb-3">
        <label for="addr" class="form-label">Address:</label>
        <input type="text" class="form-control" id="addr" placeholder="Enter address" name="addr">
    </div>

    <!-- New Select Course Dropdown -->
    <div class="mb-3">
        <label for="ct" class="form-label">Select Course:</label>
        <select class="form-select" id="ct" name="ct">
            <option>--select--</option>
            <option>Handwriting Class</option>
            <option>Counseling Session</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="course" class="form-label">Course:</label>
        <input type="text" class="form-control" id="course" value="<%= name %>" name="course" readonly>
    </div>

    <div class="mb-3 mt-3">
        <label for="duration" class="form-label">Duration:</label>
        <input type="text" class="form-control" id="duration" value="<%= duration %>" name="duration" readonly>
    </div>

    <div class="mb-3 mt-3">
        <label for="charges" class="form-label">Charges:</label>
        <input type="text" class="form-control" id="charges" value="Rs. <%= charges %>" name="charges" readonly>
    </div>

    <!-- New Instructor, Start Date, End Date Fields -->
    <div class="mb-3">
        <label for="instructor" class="form-label">Instructor:</label>
        <input type="text" class="form-control" id="instructor" value="<%= instructor %>" name="instructor" readonly>
    </div>

    <div class="mb-3">
        <label for="startDate" class="form-label">Course Start Date:</label>
        <input type="date" class="form-control" id="startDate" value="<%= startDate %>" name="startDate" readonly>
    </div>

    <div class="mb-3">
        <label for="endDate" class="form-label">Course End Date:</label>
        <input type="date" class="form-control" id="endDate" value="<%= endDate %>" name="endDate" readonly>
    </div>

    <!-- New Enrollment Date Field -->
    <div class="mb-3">
        <label for="enrollmentDate" class="form-label">Enrollment Date:</label>
        <input type="date" class="form-control" id="enrollmentDate" name="enrollmentDate">
    </div>

    <b><label for="nm" class="form-label">Parent/Guardian Information:</label></b>
    <div class="mb-3">
        <label for="nm1" class="form-label">Name:</label>
        <input type="text" class="form-control" id="nm1" placeholder="Enter name" name="nm1">
    </div>

    <div class="mb-3">
        <label for="rel" class="form-label">Relationship to child:</label>
        <input type="text" class="form-control" id="rel" placeholder="Enter your relation" name="rel">
    </div>

    <div class="mb-3 mt-3">
        <label for="contact" class="form-label">Contact No:</label>
        <input type="tel" class="form-control" id="contact" placeholder="Enter contact no" name="contact">
    </div>

    <div class="mb-3 mt-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>

    <div class="mb-3">
        <label for="add" class="form-label">Address:</label>
        <input type="text" class="form-control" id="add" placeholder="Enter address" name="add">
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-primary btn-lg mb-1" name="btnsub">Submit</button>
        <button type="reset" class="btn btn-danger btn-lg mb-1">Reset</button>
    </div>
</form>

<script>
  function calculateAge() {
    const birthdate = document.getElementById('startDate').value;
    if (birthdate) {
      const birthDate = new Date(birthdate);
      const today = new Date();
      let age = today.getFullYear() - birthDate.getFullYear();
      const monthDifference = today.getMonth() - birthDate.getMonth();

      if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }

      document.getElementById('age').value = age;
    }
  }
</script>

<%
if(request.getParameter("btnsub") != null) {
    String n = request.getParameter("nm");
    String s = request.getParameter("startDate");
    String g = request.getParameter("gender");
    String c = request.getParameter("age");
    String a = request.getParameter("addr");
    String courseName = request.getParameter("course");
    String dur = request.getParameter("duration");
    String charge = request.getParameter("charges");
    String selectedCourse = request.getParameter("ct");
    String enrollmentDate = request.getParameter("enrollmentDate");
    String nm1 = request.getParameter("nm1");
    String rel = request.getParameter("rel");
    String contact = request.getParameter("contact");
    String email = request.getParameter("email");
    String add = request.getParameter("add");
  
    Connection conn = null;
    PreparedStatement pst = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/swarkimya", "root", "password");
        String insertQuery = "INSERT INTO enrollment (name, dob, gender, age, address, course, duration, charges, selected_course, enrollment_date, parent_name, relationship, contact, email, parent_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(insertQuery);
        pst.setString(1, n);
        pst.setString(2, s);
        pst.setString(3, g);
        pst.setString(4, c);
        pst.setString(5, a);
        pst.setString(6, courseName);
        pst.setString(7, dur);
        pst.setString(8, charge);
        pst.setString(9, selectedCourse);
        pst.setString(10, enrollmentDate);
        pst.setString(11, nm1);
        pst.setString(12, rel);
        pst.setString(13, contact);
        pst.setString(14, email);
        pst.setString(15, add);

        int rowCount = pst.executeUpdate();

        if(rowCount > 0) {
            // Redirect to the course payment page after successful enrollment
            response.sendRedirect("coursepayment.jsp");
        } else {
            out.println("<script>alert('Enrollment failed. Please try again.');</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error occurred: " + e.getMessage() + "');</script>");
    } finally {
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<script>alert('Error closing resources.');</script>");
        }
    }
}
%>

</div>
</div>
</div>
</div>
</div>
</section>
<%@include file="footer.jsp"%>
