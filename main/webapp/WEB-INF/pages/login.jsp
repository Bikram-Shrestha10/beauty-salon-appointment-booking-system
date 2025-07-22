<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>The Beauty Lab - Login</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css"/>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
 <jsp:include page="header.jsp"/>
 
    <div class="container">
   
        <div class="login-box">
            <div class="left-panel">
                <h2 class="logo">The Beauty Lab</h2>
                <h1>Login</h1>
              <form action="${pageContext.request.contextPath}/login" method="post">
				    <input type="text" name="username" placeholder="Please enter your Phone or Email" required>
				    <input type="password" name="password" placeholder="Please enter your Password" required>
				    <button class ="loginbtn" type="submit">Login</button>
				</form>
                <p class="forgot">Forgot your Password? <a href="#">Click here</a></p>
                <p class="create">Don’t have an account? <a href="#">Create one</a></p>
                    <p style="color:red">${errorMsg}</p>
            </div>
            <div class="right-panel">
                <img src="${pageContext.request.contextPath}/resources/images/salonenterior.jpg" alt="Salon Interior"> 
        </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>
