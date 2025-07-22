<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    HttpSession userSession = request.getSession(false);
    String currentUser = (String) (userSession != null ? userSession.getAttribute("username") : null);
    pageContext.setAttribute("currentUser", currentUser);
%>
<!-- Set contextPath variable -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://fonts.googleapis.com/css2?family=Italianno&display=swap" rel="stylesheet">
<style>
/* General Styling */
body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #fdf6f0;
    background-image: url('https://www.transparenttextures.com/patterns/beige-paper.png');
    background-repeat: repeat;
    color: #5e4633;
    box-sizing: border-box;
    overflow-x: hidden;
}

/* Header */
.beauty-header {
    background-color: #f7e6d7;
    animation: fadeIn 1.5s ease-in;
    
}
/* Navbar Layout */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 40px;
    width: 100%;
    box-sizing: border-box;
    flex-wrap: wrap;
   
}

/* Navigation Links Centered */
.nav-links {
    list-style: none;
    display: flex;

    justify-content: center;
    align-items: center;
    margin: 0 auto;
    padding: 0;
    flex: 1;
    gap: 59px;
}

.nav-links li a {
    text-decoration: none;
    font-weight: 600;
    color: #3a1d0d;
    font-size: 16px;
    position: relative;
    transition: color 0.3s ease;
}

.nav-links li a::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background-color: #3a1d0d;
    left: 0;
    bottom: -5px;
    transition: width 0.3s ease;
}

.nav-links li a:hover {
    color: #a86439;
}

.nav-links li a:hover::after {
    width: 100%;
}


/* Search bar */
.search-box {
    align-items: center;
    gap: 10px;
    margin-left: auto;
	max-width: 400px;
}
.search-box input {
  padding: 6px;
    border: 1px solid #aaa;
    border-radius: 4px;
    height: 20px;
    max-width: 150px;  /* allow it to shrink smaller if needed */
    width: 100%;  
}

/* Auth buttons */
.auth-buttons {
    display: flex;
    justify-content:end;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 10px;
}

button {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    background: #8b5e3c;
    color: white;
    cursor: pointer;
}
button:hover {
    background: #a67c52;
}

/* Branding */
.brand {
    font-family: 'Italianno', cursive;
    text-align: center;
    font-size: 35px;
    color: #7b4b2b;
    margin: 20px 0 10px;
padding-top: 40px;
    border-bottom: 2px solid;
}

/* Responsive for ≤768px */
@media (max-width: 768px) {
	 .nav-links li a {
        font-size: 14px; /* reduce from 16px */
    }
    .header{
           max-height: max-content;
            margin-bottom: 40px;
    }

    .navbar {
        flex-direction: column;
        align-items: center;
        padding: 10px;
            max-height: max-content;
            
    }

    .nav-links {
        flex-direction: column;
        gap: 15px;
        padding: 10px 0;
        margin: 0;       /* center cleanly */
        flex: initial;   /* let it shrink */
    }

      .search-box {
        width: 100%;
        justify-content: center;
        margin: 10px 0;
    }
    .search-box input {
        /* this will now work, because width isn’t locked at 300px */
        max-width: none;   /* allow full flexibility */
        width: 80%;
    }

    .auth-buttons {
        justify-content: center;
        width: 100%;
        gap: 10px;
        margin-top: 10px;
    }

    .brand {
        font-size: 28px;
        padding-top: 10px;
        margin: 10px 0;
        text-align: center;
    }
      .hero {
        margin-top: 20px;
    }
}

</style>
</head>
<body>
<header class="beauty-header">
    <nav class="navbar">
        <!-- Center Navigation Links -->
        <ul class="nav-links">
            <li><a href="${contextPath}/">Home</a></li>
            <li><a href="${contextPath}/servicescontroller">Services</a></li>
            <li><a href="${contextPath}/bookappointment">Book Appointment</a></li>
            <li><a href="${contextPath}/contactus">Contact Us</a></li>
            <li><a href="${contextPath}/aboutus">About Us</a></li>
        </ul>

        <!-- Right Side Search -->
 
        
       <c:if test="${not fn:contains(pageContext.request.requestURI, '/search')}">
    <form action="${pageContext.request.contextPath}/search" method="get" class="search-box">
        <input type="text" name="query" id="searchInput" placeholder="Search..." required />
        <button type="submit">Search</button>
    </form>
</c:if>
</form>
    </nav>


    <!-- Branding -->
    <h1 class="brand">The Beauty Lab</h1>

        <!-- Auth Buttons -->
    <div class="auth-buttons">
        <c:choose>
            <c:when test="${not empty sessionScope.username}">
                <button onclick="location.href='${contextPath}/userprofile'">Profile</button>
                <button onclick="location.href='${contextPath}/logout'">Logout</button>
            </c:when>
            <c:otherwise>
                <button onclick="location.href='${contextPath}/login'" style="background-color: red;">Login</button>
                <button onclick="location.href='${contextPath}/register'" style="background-color: red;">Sign Up</button>
            </c:otherwise>
        </c:choose>
    </div>
    
</header>
</body>
</html>
