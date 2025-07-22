<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Beauty Lab</title>

    <!-- Google Font for Italianno -->
    <link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


    
    
    <!-- Link to new CSS file -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home1.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>

<jsp:include page="header.jsp"/>
<div class="hero-image" style="background-image: url('${pageContext.request.contextPath}/resources/images/images.png');">
	
  <div class="hero-text">
      <h1>Glow Up With Confidence</h1>
      <p>Book Your Beauty Appointments with Ease and Elegance</p>
     <button class="cta-btn" onclick="location.href='${pageContext.request.contextPath}/bookappointment'">BOOK NOW</button>
  </div>
</div>

    <section class="hero">
        <h1>Elegance comes from being as beautiful inside as outside</h1>
        <p>"Be Bold. Be Beautiful. Be You."</p>
    </section>




<section class="services">
    <h2>Our Services</h2>
    <div class="cards">

        <div class="card" style="background-image: url('${pageContext.request.contextPath}/resources/images/nails.png');">
            <div class="card-overlay">
                <h3>Nail Care</h3>
                <p>Rs. 3000</p>
            </div>
        </div>

        <div class="card" style="background-image: url('${pageContext.request.contextPath}/resources/images/hair.png');">
            <div class="card-overlay">
                <h3>Hair Styling</h3>
                <p>Rs. 4500</p>
            </div>
        </div>

        <div class="card" style="background-image: url('${pageContext.request.contextPath}/resources/images/makeup.png');">
            <div class="card-overlay">
                <h3>Make Up</h3>
                <p>Rs. 2500</p>
            </div>
        </div>

        <div class="card" style="background-image: url('${pageContext.request.contextPath}/resources/images/cosmetology.png');">
            <div class="card-overlay">
                <h3>Cosmetology</h3>
                <p>Rs. 8999</p>
            </div>
        </div>

        <div class="card" style="background-image: url('${pageContext.request.contextPath}/resources/images/spa.jpg');">
            <div class="card-overlay">
                <h3>Spa and More</h3>
                <p>Rs. 5999</p>
            </div>
        </div>

    </div>

    <button class="view-more-btn" onclick="location.href='${pageContext.request.contextPath}/servicescontroller'">View More</button>
</section>




<section class="service-pricing">
    <div class="pricing-container">

        <!-- Image on left -->
        <div class="pricing-image">
            <img src="${pageContext.request.contextPath}/resources/images/service.jpg" alt="Service Visual">
        </div>

        <!-- Pricing List on right -->
        <div class="pricing-wrapper">
            <ul class="pricing-list with-title">
                <li class="title-row">
                    <span class="service-heading">Services</span>
                    <span class="starting-from-label">Starting From</span>
                </li>
                <li><span class="service-name">Nail Care</span> <span class="price">Rs. 3000</span></li>
                <li><span class="service-name">Hair Styling</span> <span class="price">Rs. 4500</span></li>
                <li><span class="service-name">Make Up</span> <span class="price">Rs. 2500</span></li>
                <li><span class="service-name">Cosmetology</span> <span class="price">Rs. 8999</span></li>
                <li><span class="service-name">Spa and More</span> <span class="price">Rs. 5999</span></li>
            </ul>

            <button class="view-more-btn" onclick="location.href='${pageContext.request.contextPath}/servicescontroller'">View More</button>
        </div>

    </div>
</section>




<section class="testimonial">
  <div class="testimonial-background"></div>
  <h2 class="testimonial-title">What Our Clients Say</h2>

  <div class="testimonial-content">
    <div class="quote-mark top">“</div>
    
    <p class="testimonial-text">
      Absolutely loved my experience at The Beauty Lab! The staff were so warm and welcoming, and the salon has such a relaxing,comforting, chic vibe. I got a facial and a blowout, and honestly, I’ve never felt more pampered. My skin was glowing for days, and my hair looked amazing! You can really tell they care about quality and customer service. Definitely my new go-to beauty spot!
    </p>

    <div class="quote-mark bottom">”</div>

    <div class="stars">
      <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
    </div>

    <cite class="client-name">— Samantha R. (Happy Client)</cite>
  </div>
</section>




<jsp:include page="footer.jsp"/>
</body>
</html>