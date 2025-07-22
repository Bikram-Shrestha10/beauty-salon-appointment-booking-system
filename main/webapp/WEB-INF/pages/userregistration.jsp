<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/userregistration.css"/>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="form-wrapper">
    <div class="form-container">
        <!-- Left Side: All Text and Form Fields -->
        <div class="form-left">
            <h1 class="title">The Beauty Lab</h1>
            <h2 class="subtitle">User Registration</h2>
            <p class="instruction">Please kindly fill the Registration form</p>
            <form action="${pageContext.request.contextPath}/register" method="post" name="registrationForm" enctype="multipart/form-data">
                <!-- First + Last Name -->
                <div class="row">
                    <div class="input-box">
                        <label for="firstName">First Name :</label>
                        <input type="text" id="firstName" name="firstName" placeholder="First name" required>
                    </div>
                    <div class="input-box">
                        <label for="lastName">Last Name :</label>
                        <input type="text" id="lastName" name="lastName" placeholder="Last name" required>
                    </div>
                </div>
                <div class="row">
                <!-- Email -->
                <div class="input-box">
                    <label for="email">Email :</label>
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>
                <!-- Phone -->
                <div class="input-box">
                    <label for="phone">Phone No :</label>
                    <input type="tel" id="phone" name="phone" placeholder="Phone number" required>
                </div>
                </div>
                <div class="input-box">
					<label for="gender">Gender:</label> 
						<select class="select"  name="gender"  style="height: 40px;">
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
				</div>
                
                <!-- DOB -->
                <div class="input-box">
                    <label for="dob">Date Of Birth :</label>
                    <input type="date"	id="Birthdate" name="dob" required>
                </div>
                
					
					
                <div class="input-box">
                    <label for="phone">Username :</label>
                    <input type="text" name="username" id="username" placeholder="Username" required>
                </div>
                 <div class="row">
                <div class="input-box">
                    <label for="phone">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-box">
                    <label for="phone">Retype-Password :</label>
                    <input type="password" id="re-password" name="re-Password" placeholder="Re-Password" required>
                </div>
                </div>
                <div class="input-box">
                    <label for="image">Insert Your Display Picure :</label>
                     <input type="file" id="image" name="image" required>
 					
                </div>
                
                  <!-- Submit Button -->
                <div class="input-box">
                    <button type="submit" class="btn" >Register </button>
                </div>
                	<select class="select"  name="role_id"  style="height: 40px; visibility: hidden;     ">
							<option value="user">user </option>
							<option value="admin">admin</option>
						</select>
						
                
    <p style="color:red">${errorMsg}</p>
      
            </form>
        </div>
        <!-- Right Side: Full Height Image -->
        <div class="form-right">
            <img src="${pageContext.request.contextPath}/resources/images/registrationimage.jpg" alt="Beauty Lab">
        </div>
    </div>
</div>
  <jsp:include page="footer.jsp"/>

</body>
</html>