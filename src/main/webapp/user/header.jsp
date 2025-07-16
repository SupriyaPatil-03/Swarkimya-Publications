<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Swarkimya Publications</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
  <img src="images/logo2.png" alt="Logo" style="height: 50px; margin-right: 5px;">
  Swarkimya Publications
</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
          </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Books Gallery
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="bookcategory.jsp?type=First standard">First Standard</a></li>
            <li><a class="dropdown-item" href="bookcategory.jsp?type=Second standard">Second Standard</a></li>
            <li><a class="dropdown-item" href="bookcategory.jsp?type=Third standard">Third Standard</a></li>
            <li><a class="dropdown-item" href="bookcategory.jsp?type=Fourth standard">Fourth Standard</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="courses.jsp">Handwriting Courses</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="counselings.jsp">Counseling Sessions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewcart.jsp">Your Cart</a>
        </li>
         
        <li class="nav-item">
          <a class="nav-link" href="viewenroll.jsp">Your Counseling profile</a>
        </li>
       <li>
          <a class="nav-link" href="feedback.jsp">Feedback</a>
        </li>
        <li>
          <a class="nav-link" href="../user/logout.jsp">Log out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>