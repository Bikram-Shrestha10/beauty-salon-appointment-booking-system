<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>About Us</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/aboutus.css"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">

</head>

<body>

<jsp:include page="header.jsp"/>

 <div class="aboutus-wrapper">



 <!-- main heading -->

 <h1 class="main-heading">About Us</h1>





 <!-- centered quote -->

 <div class="centered-quote">

 <strong>“Welcome to The Beauty Lab – Your Glow Starts Here”</strong>

 </div>



 <!-- SHORT DESCRIPTION -->

 <p class="short-description">

 Step into The Beauty Lab and let our expert team craft a personalized experience<br>

 that leaves you feeling radiant and confident.

 </p>



 <!-- two column section: image left + quote and paragraph in right -->

 <div class="two-column-section">

 <div class="column-left">

 <img src="aboutuspicture1.jpg" alt="Salon Image">

 </div>

 <div class="column-right">

 <div class="quote"><strong>“The Beauty Lab: A Passion for Perfection”</strong></div>

 <p>



 Established in 2019, The Beauty Lab was born from a vision to redefine beauty care.

 We blend cutting-edge techniques with a love for artistry, creating a space

 where every client feels like their best self.From bold transformations to subtle

 enhancements, we’re here to experiment, innovate, and celebrate you.



 </p>

 </div>

 </div>



 <!-- Service block + image in right -->

 <div class="service-row">

 <div class="service-left">

 <h3>Shine Brighter with Our Services</h3>

 <p>Innovative treatments for stunning results,<br>your beauty is perfected by our hands.</p>



 <div class="services-columns">

 <ul>

 <li>Cosmetology</li>

 <li>Manicure</li>

 <li>Pedicure</li>

 <li>Make-up</li>

 <li>Message</li>

 </ul>

 <ul>

 <li>Mesotherapy</li>

 <li>Acupuncture</li>

 <li>Nails</li>

 <li>Facial Treatments</li>

 <li>Hyaluronic Acid</li>

 </ul>

 <ul>

 <li>Dermatology</li>

 <li>Natural Make-up</li>

 <li>Hyaluronic Fillers</li>

 <li>Brows</li>

 <li>Face Massage</li>

 </ul>

 </div>

 </div>

 <div class="service-right">

 <img src="aboutuspicture2.jpg" alt="Towel and Candle">

 </div>

 </div>



 <!-- stats row -->

 <div class="stats-section">

 <div>

 <h2>5+</h2>

 <p>Years of Experience</p>

 </div>

 <div>

 <h2>4K+</h2>

 <p>Happy Clients</p>

 </div>

 <div>

 <h2>50+</h2>

 <p>Workers Employed</p>

 </div>

 <div>

 <h2>10+</h2>

 <p>Awards Won</p>

 </div>

 </div>



 <!-- team section -->

 <div class="team-section">

 <h2>Our Team</h2>

 <div class="team-grid">

 <div class="team-col-1">



 <div class="team-card">

 <img src="${pageContext.request.contextPath}/resources/images/kushal.jpeg" alt="Kushal">

 <h4>Kushal Shrestha</h4>

 <p>CEO</p>

 <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"

 style="color: #74C0FC;"></i></a>

 <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram"></i></a>

 </div>



 <div class="team-card">

 <img src="${pageContext.request.contextPath}/resources/images/khushi.jpeg" alt="Khushi">

 <h4>Khushi Karanjit</h4>

 <p>Founder</p>

 <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"

 style="color: #74C0FC;"></i></a>

 <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram"></i></a>

 </div>



 </div>

 <div class="team-col-2">





 <div class="team-card">

 <img src="${pageContext.request.contextPath}/resources/images/yuri.jpeg"  alt="Yuri">

 <h4>Yuri Dangol</h4>

 <p>Co-founder</p>

 <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"

 style="color: #74C0FC;"></i></i></a>

 <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram"></i></a>

 </div>

 <div class="team-card">

 <img src="${pageContext.request.contextPath}/resources/images/sophie.jpeg" alt="Sophie">

 <h4>Sophie Thapa</h4>

 <p>Chairman</p>

 <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"

 style="color: #74C0FC;"></i></a>

 <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram"></i></a>

 </div>



 <div class="team-card">

 <img src="${pageContext.request.contextPath}/resources/images/bikram.jpg" src="bikram.jpg" alt="Bikram">

 <h4>Bikram Shrestha</h4>

 <p>Vice-chairman</p>

 <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"

 style="color: #74C0FC;"></i></a>

 <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram"></i></a>

 </div>

 </div>

 </div>

 </div>



 </div>



<jsp:include page="footer.jsp"/>

</body>

</html>






