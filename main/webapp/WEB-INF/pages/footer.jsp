<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
     <style>
.site-footer {
    background-color: #0a0a0a;
    color: #fff;
    padding: 40px 20px;
    font-family: 'Figtree', sans-serif;
}

.footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: flex-start;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-left, .footer-center, .footer-right {
    flex: 1;
    min-width: 250px;
    margin-bottom: 20px;
}

.footer-logo {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 15px;
    font-family: 'Italianno', cursive;
}

.social-icons a img {
    width: 24px;
    margin-right: 10px;
    transition: transform 0.3s ease;
}

.social-icons a:hover img {
    transform: scale(1.2);
}

.footer-links {
    list-style: none;
    padding: 0;
}

.footer-links li {
    margin-bottom: 8px;
}

.footer-links a {
    color: #ddd;
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-links a:hover {
    color: #fff;
}

.subscribe-form {
    display: flex;
    gap: 10px;
}

.subscribe-form input[type="email"] {
    padding: 10px;
    border: none;
    border-radius: 4px;
    margin-top: 30px;
    flex: 1;
}

.subscribe-form button {
    padding: 10px 16px;
    background-color: #fff;
    color: #000;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.subscribe-form button:hover {
    background-color: #f1c40f;
    color: #000;
}

.site-footer p {
    text-align: center;
    font-size: 14px;
    margin-top: 20px;
    color: #aaa;
}

</style>

            
</head>
<body>
	<!-- Footer Section -->
<footer class="site-footer">
  <div class="footer-container">

    <!-- Left: Logo & Social Media -->
    <div class="footer-left">
      <h2 class="footer-logo">The Beauty Lab</h2>
      <div class="social-icons">
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/Facebook.png" alt="Facebook"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/Instagram.png" alt="Instagram"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/twitter.png" alt="Twitter"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/youtube.png" alt="YouTube"></a>
      </div>
    </div>

    <!-- Middle: Navigation Links -->
    <div class="footer-center">
      <ul class="footer-links">
      <h2> Pages</h2>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Appoinment</a></li>
        <li><a href="#">Login</a></li>
        <li><a href="#">Register</a></li>
      </ul>
    </div>

    <!-- Right: Newsletter -->
    <div class="footer-right">
      <h3>Do you want Updates</h3>
      <form class="subscribe-form">
        <input type="email" placeholder="Enter your email" required>
        <button type="submit">Submit</button>
      </form>
    </div>

  </div>

  <p class="copyright">
    © 2025 The Beauty Lab. All Rights Reserved.
  </p>
</footer>
</body>
</html>
