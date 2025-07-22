<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Contact Us</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/contactus.css"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">

          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">

</head>

<body>

<jsp:include page="header.jsp"/>

    <div class="contact-wrapper">



        <!-- heading title -->

        <h1 class="main-title">Contact Us</h1>



        <!-- intro and quote -->

        <div class="intro-message">

        	<p class="quote">“We're here for every question—and every transformation”</p>

            <p>Every message is the beginning of something beautiful. Connect with us, and let’s craft a salon experience that’s tailored just for you.</p>

            

        </div>



    </div>



    <!-- full width map -->

	   <div class="map-full">

        <iframe 

            src="https://www.google.com/maps?q=City+Center,+Kamalpokhari,+Kathmandu&output=embed" 

            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy">

        </iframe>

    </div>

   

   



    <!--contact box -->

    <div class="contact-box">



        <!-- Contact Info -->

        <div class="info-section">

            <h2 class="section-title">Contact Information</h2>



            <div class="info-block">

                <i class="fas fa-map-marker-alt icon"></i>

                <div>

                    <label>Address</label>

                    <p>City Center, Kamalpokhari, Kathmandu</p>

                </div>

            </div>



            <div class="info-block">

                <i class="fas fa-phone icon"></i>

                <div>

                    <label>Contact</label>

                    <p>+977 9845453355</p>

                </div>

            </div>



            <div class="info-block">

                <i class="fas fa-envelope icon"></i>

                <div>

                    <label>Email</label>

                    <p>beautylab@gmail.com</p>

                </div>

            </div>



            <div class="info-block">

                <i class="fas fa-clock icon"></i>

                <div>

                    <label>Open-Close Time</label>

                    <p>Sun-Sat: 9.00am - 7.00pm</p>

                </div>

            </div>

        </div>



        <!--  Contact Form -->

        <div class="form-section">

            <h2 class="section-title">Get in touch with us</h2>



            <form onsubmit="return validateContactForm();">

                <label for="name">Name :</label>

                <input type="text" id="name" name="name" placeholder="Name" required>



                <label for="email">Email :</label>

                <input type="email" id="email" name="email" placeholder="Email" required>



                <label for="phone">Phone :</label>

                <input type="tel" id="phone" name="phone" placeholder="Phone" required>



                <label for="message">Message :</label>

                <textarea id="message" name="message" placeholder="Enter your message here" required></textarea>



                <input type="submit" value="Send">

            </form>

        </div>



    </div>



<jsp:include page="footer.jsp"/>

</body>

</html>