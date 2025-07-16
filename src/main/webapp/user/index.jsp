<%@include file="header.jsp" %>
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
      <img src="images/26.webp" class="d-block w-100" style="width:100%;height:700px">
    </div>
    <div class="carousel-item">
      <img src="images/2.jpg" class="d-block w-100" style="width:100%;height:700px">
    </div>
    <div class="carousel-item">
      <img src="images/27.webp" class="d-block w-100" style="width:100%;height:700px">
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
<%@include file="footer.jsp" %>