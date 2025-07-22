<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Book Appointment - The Beauty Lab</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/booking.css"/>
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">
    
</head>
<body>

<jsp:include page="header.jsp"/>

	<main>
	<h1 class="site-title">Book Appointment</h1>

	<form method="post" action="${pageContext.request.contextPath}/bookappointment">

	    <div class="grid-layout-custom">
	
	        <!-- Makeup -->
	        <div class="box makeup">
	            <h3>Makeup</h3>
			<label><input type="checkbox" name="services" value="Daily make up:2000"> Daily make up  - <strong style="color: Brown;"> &emsp; &emsp; Rs 2000</strong></label>
		
			
			<label><input type="checkbox" name="services" value="Night make up:4000"> Night make up - <strong style="color: Brown;">&emsp; &emsp;Rs 4000</strong></label>

			
			<label><input type="checkbox" name="services" value="Bridal make up:4000"> Bridal make up  - <strong style="color: Brown;">&emsp;&emsp;Rs 4000</strong></label>

			
			<label><input type="checkbox" name="services" value="Occasion make up:5000"> Occasion make up - <strong style="color: Brown;">&emsp;Rs 5000</strong></label>

			
			<label><input type="checkbox" name="services" value="Television make up:6000"> Television make up - <strong style="color: Brown;">&emsp;Rs 6000</strong></label>
			

	            <h4>Stylist</h4>
	            
	            <label><input type="radio" name="stylist_makeup" value="Samantha"> Samantha</label>
	            <label><input type="radio" name="stylist_makeup" value="Olivia"> Olivia</label>
	              <c:if test="${showMakeupError}">
				    <p style="color:red;">Please select a makeup stylist.</p>
				</c:if>
	          
	        </div>
	
	        <!-- Hair -->
	        <div class="box hair">
	            <h3>Hair</h3>
	             <label><input type="checkbox" name="services" value="Simple Haircut:300"> Simple Haircut - <strong style="color: Brown;">&emsp; Rs 300</strong></label>

			 
			    <label><input type="checkbox" name="services" value="Hair Styling:1000"> Hair Styling - <strong style="color: Brown;">&emsp; &emsp;Rs 1000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Full Hair Color:2000"> Full Hair Color - <strong style="color: Brown;"> &emsp; Rs 2000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Protein Treatment:3000"> Protein Treatment - <strong style="color: Brown;">Rs 3000</strong></label>
	
			
			    <label><input type="checkbox" name="services" value="Hair Mask:1800"> Hair Mask- <strong style="color: Brown;"> &emsp; &emsp; &emsp;Rs 1800</strong></label>
		
	            <h4>Stylist</h4>
	            
	            <label><input type="radio" name="stylist_hair" value="Emily"> Emily</label>
	            <label><input type="radio" name="stylist_hair" value="Riya"> Riya</label>
	            <c:if test="${showHairError}">
				    <p style="color:red;">Please select a Hair stylist.</p>
				</c:if>
	        </div>
	
	        <!-- Nails -->
	        <div class="box nails">
	            <h3>Nails</h3>
	            <label><input type="checkbox" name="services" value="Manicure:4000"> Manicure - <strong style="color: Brown;"> &emsp; &emsp;  Rs 4000</strong></label>
			
			    <label><input type="checkbox" name="services" value="Pedicure:2500"> Pedicure - <strong style="color: Brown;">&emsp; &emsp; Rs 2500</strong></label>

			
			    <label><input type="checkbox" name="services" value="French Manicure:1200"> French Manicure - <strong style="color: Brown;">Rs 1200</strong></label>

			
			    <label><input type="checkbox" name="services" value="Gel nails:5000"> Gel nails - <strong style="color: Brown;"> &emsp; &emsp; &emsp;Rs 5000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Gel Reapplication:1000"> Gel Reapplication - <strong style="color: Brown;">Rs 1000</strong></label>

	            <h4>Stylist</h4>
	           
	            <label><input type="radio" name="stylist_nail" value="Jessie"> Jessie</label>
	            <label><input type="radio" name="stylist_nail" value="Tina"> Tina</label>
	           <c:if test="${showNailError}">
				    <p style="color:red;">Please select a Nails stylist.</p>
				</c:if>
	           
	        </div>
	
	        <!-- Cosmetology -->
	        <div class="box cosmetology">
	            <h3>Cosmetology</h3>
	              <label><input type="checkbox" name="services" value="Botox:2000"> Botox - <strong style="color: Brown;">&emsp; &emsp; &emsp; &emsp;Rs 2000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Chemical Peel:5000"> Chemical Peel - <strong style="color: Brown;">&emsp;Rs5000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Laser Skin Resurfacing:8000"> Laser Skin Resurfacing - <strong style="color: Brown;">Rs 8000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Laser Hair Removal:10000"> Laser Hair Removal - <strong style="color: Brown;"> &emsp;Rs 10000</strong></label>
	

	            <h4>Stylist</h4>
	            
	            <label><input type="radio" name="stylist_cosmo" value="Dr. Mira" > Dr. Mira</label>
	            <label><input type="radio" name="stylist_cosmo" value="Dr. Laxmi"> Dr. Laxmi</label>
	            <c:if test="${showCosmoError}">
				    <p style="color:red;">Please select a Cosmo stylist.</p>
				</c:if>
	          
	        </div>
	
	        <!-- Spa -->
	        <div class="box spa">
	            <h3>Spa</h3>
	             <label><input type="checkbox" name="services" value="Body scrub & smoothing:2000"> Body scrub & smoothing-<strong style="color: Brown;">Rs 2000</strong></label>
			    
			
			    <label><input type="checkbox" name="services" value="Indulge & relax:2000"> Indulge & relax - <strong style="color: Brown;">&emsp; &emsp; Rs 2000</strong></label>
		
				<label><input type="checkbox" name="services" value="Slimming & drainage:3000"> Slimming & drainage - <strong style="color: Brown;">&emsp;Rs 3000</strong></label>

			
			    <label><input type="checkbox" name="services" value="Foot revive treatment:1800"> Foot revive treatment - <strong style="color: Brown;">&emsp;Rs 1800</strong></label>


	            <h4>Stylist</h4>
	      
	            <label><input type="radio" name="stylist_spa" value="Mina" > Mina</label>
	            <label><input type="radio" name="stylist_spa" value="Luna"> Luna</label>
	            <c:if test="${showSpaError}">
				    <p style="color:red;">Please select a Spa stylist.</p>
				</c:if>
	        </div>
	    </div>
	
	    <section class="booking-form">
	        <h2>Select Date & Time</h2>
	        <label for="date">Date</label>
	        <input type="date" id="date" name="date" required>
	
	        <label for="time">Time</label>
	        <input type="time" id="time" name="time" required>
	
	        <button type="submit">Confirm Booking</button>
	    </section>
	</form>
	
	</main>
	
<jsp:include page="footer.jsp"/>
	
	</body>
	
	
	</html>