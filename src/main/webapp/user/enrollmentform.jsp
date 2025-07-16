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

              <form method="post" action="cconform.jsp">
                <b><label for="nm" class="form-label">Child's Information:</label></b>
                <div class="mb-3">
                  <label for="nm" class="form-label">Name:</label>
                  <input type="text" class="form-control" id="nm" placeholder="Enter name" name="nm" required>
                </div>

                <div class="mb-3">
                  <label for="startDate">Date of Birth:</label>
                  <input type="date" class="form-control" id="startDate" name="startDate" onchange="calculateAge()" required>
                </div>

                <div class="mb-3">
                  <label for="gender" class="form-label">Gender:</label>
                  <input type="radio" id="gender" name="gender" value="Male" required>Male
                  <input type="radio" id="gender" name="gender" value="Female" required>Female
                </div>

                <div class="mb-3">
                  <label for="age" class="form-label">Age:</label>
                  <input type="text" class="form-control" id="age" placeholder="Enter age" name="age" readonly>
                </div>

                <div class="mb-3">
                  <label for="addr" class="form-label">Address:</label>
                  <input type="text" class="form-control" id="addr" placeholder="Enter address" name="addr" required>
                </div>

                <div class="mb-3">
                  <label for="ct" class="form-label">Select Course:</label>
                  <select class="form-select" id="ct" name="ct" required>
                    <option value="">--select--</option>
                    <option value="Handwriting Class">Handwriting Class</option>
                    <option value="Counseling Session">Counseling Session</option>
                  </select>
                </div>

                <div class="mb-3">
                  <label for="course" class="form-label">Course:</label>
                  <input type="text" class="form-control" id="course" name="course" required>
                </div>

                <div class="mb-3 mt-3">
                  <label for="duration" class="form-label">Duration:</label>
                  <input type="text" class="form-control" id="duration" name="duration" required>
                </div>

                <div class="mb-3 mt-3">
                  <label for="charges" class="form-label">Charges:</label>
                  <input type="text" class="form-control" id="charges" name="charges" required>
                </div>

                <div class="mb-3">
                  <label for="enrollmentDate" class="form-label">Enrollment Date:</label>
                  <input type="date" class="form-control" id="enrollmentDate" name="enrollmentDate" required>
                </div>

                <b><label for="nm" class="form-label">Parent/Guardian Information:</label></b>
                <div class="mb-3">
                  <label for="nm1" class="form-label">Name:</label>
                  <input type="text" class="form-control" id="nm1" placeholder="Enter name" name="nm1" required>
                </div>

                <div class="mb-3">
                  <label for="rel" class="form-label">Relationship to child:</label>
                  <input type="text" class="form-control" id="rel" placeholder="Enter your relation" name="rel" required>
                </div>

                <div class="mb-3 mt-3">
                  <label for="contact" class="form-label">Contact No:</label>
                  <input type="tel" class="form-control" id="contact" placeholder="Enter contact no" name="contact" required>
                </div>

                <div class="mb-3 mt-3">
                  <label for="email" class="form-label">Email:</label>
                  <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
                </div>

                <div class="mb-3">
                  <label for="add" class="form-label">Address:</label>
                  <input type="text" class="form-control" id="add" placeholder="Enter address" name="add" required>
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

                // Populate the form fields with query parameters
                const urlParams = new URLSearchParams(window.location.search);
                document.getElementById('course').value = urlParams.get('name');
                document.getElementById('duration').value = urlParams.get('duration');
                document.getElementById('charges').value = urlParams.get('price');
              </script>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
