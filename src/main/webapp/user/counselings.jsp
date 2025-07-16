<%@page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="../connection.jsp" %>
<style>
    .gallery-img {
        border: 1px solid black; /* Increased the border width */
        padding: 5px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .caption {
        text-align: center;
        margin-bottom: 20px;
        padding: 15px; /* Added padding for better spacing */
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Added a subtle shadow */
        transition: transform 0.2s; /* Smooth transition for hover effect */
    }
    .caption img {
        margin-bottom: 15px;
        width: 100%;
        height: auto; /* Make images responsive */
        border-radius: 10px;
    }
    .caption:hover {
        transform: scale(1.05); /* Slightly enlarge on hover */
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
<h1 class="text-center">Counseling Sessions</h1>
<div class="row">
<%
try {
	PreparedStatement pst = cn.prepareStatement("select * from addcounseling");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String id = rs.getString("id");
        String counselingName = rs.getString("counselingName");
        String price = rs.getString("price");
        String cat = rs.getString("category");
        String image = rs.getString("courseimg");
        String des = rs.getString("description");
        String dr = rs.getString("duration");
        String counselorName = rs.getString("counselorName"); // Added field
%>
        <div class="col-sm-3">
            <div class="caption">
                <img src="http://localhost:9090/SwarkimyaPublication/images/<%= image %>" alt="<%= counselingName %>">
                <div class="course-title"><%= counselingName %></div>
                <div class="course-detail"><b>Counselor:</b> <%= counselorName %></div> <!-- Displaying counselorName -->
                <div class="course-detail"><b>Duration:</b> <%= dr %></div>
                <div class="course-detail"><b>Charges: Rs.</b> <%= price %></div>
                <div class="course-description"><b>About Course:</b><br> <%= des %></div>
                <a class="btn btn-primary" href="enroll.jsp?id=<%=id %>&price=<%=price %>&name=<%=counselingName %>&category=<%=cat %>&description=<%=des%>&duration=<%=dr%>">Book a Session</a>
            </div>
        </div>
<%
    }
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
</div>
<%@ include file="footer.jsp" %>

