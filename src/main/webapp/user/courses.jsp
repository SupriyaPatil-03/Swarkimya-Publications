<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>
<style>
    .gallery-img {
        border: 1px solid black;
        padding: 5px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .caption {
        text-align: center;
        margin-bottom: 20px;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
    }
    .caption img {
        margin-bottom: 15px;
        width: 100%;
        height: auto;
        border-radius: 10px;
    }
    .caption:hover {
        transform: scale(1.05);
    }
    .caption .course-title {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .caption .course-detail {
        margin-bottom: 5px;
    }
    .caption .course-description {
        font-size: 14px;
        color: #555;
        margin-bottom: 15px;
    }
    .caption .enroll-button {
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.2s;
    }
    .caption .enroll-button:hover {
        background-color: #0056b3;
    }
</style>

<h1 class="text-center">Our Handwriting Courses</h1>
<div class="row">
<%
try {
    String query = "SELECT * FROM addcourses";
    PreparedStatement pst = cn.prepareStatement(query);
    ResultSet rs = pst.executeQuery();

    while (rs.next()) {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String instructor = rs.getString("instructor");
        String price = rs.getString("price");
        String category = rs.getString("category");
        String image = rs.getString("courseimg");
        String description = rs.getString("description");
        String duration = rs.getString("duration");
        String startDate = rs.getString("startdate");
        String endDate = rs.getString("enddate");
%>
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="caption">
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" alt="<%= name %>">
                <div class="course-title"><%= name %></div>
                <div class="course-detail"><b>Instructor:</b> <%= instructor %></div>
                <div class="course-detail"><b>Duration:</b> <%= duration %></div>
                <div class="course-detail"><b>Charges: Rs.</b> <%= price %></div>
                <div class="course-detail"><b>Start Date:</b> <%= startDate %></div>
                <div class="course-detail"><b>End Date:</b> <%= endDate %></div>
                <div class="course-description"><b>About Course:</b><br> <%= description %></div>
                <!-- Updated Enroll Now Button in courses.jsp -->
<a class="enroll-button" href="enrollmentform.jsp?id=<%= id %>&price=<%= price %>&name=<%= name %>&category=<%= category %>&description=<%= description %>&duration=<%= duration %>&instructor=<%= instructor %>&startDate=<%= startDate %>&endDate=<%= endDate %>">Enroll Now</a>

            </div>
        </div>
<%
    }
} catch (Exception ex) {
    out.println("<div class='alert alert-danger'>Unable to fetch course details. Please try again later.</div>");
    ex.printStackTrace();
}
%>
</div>
<%@ include file="footer.jsp" %>
