<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="user" value="${user}" />
    <%@ page session="true" %>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userprofile.css">
</head>

</head>
<body>

<div class="profile-container">
  <!-- Sidebar -->
  <aside class="profile-sidebar">
    <div class="profile-pic">
      <img src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="Profile Picture" />
      <div class="zoom-popup">
    <img src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="Zoomed Picture" />
  </div>
    </div>
     <h2>${user.username}</h2>
    <p class="member-since">MEMBER SINCE 2025</p>

    <nav class="profile-nav">
      <a href="${pageContext.request.contextPath}/userprofile"><span>👤</span> Personal Info</a>
      <a href="${pageContext.request.contextPath}/userbookinghistory"><span>⏰</span> Booking History</a>
      <a href="${pageContext.request.contextPath}/usersettings"><span>⚙️</span> Settings</a>
      <a href="${pageContext.request.contextPath}/logout"><span>📕</span> Logout</a>
    </nav>
  </aside>

  <!-- Main content -->
  <section class="profile-main">
    <!-- Personal Info -->
    <div id="info" class="content-section active">
      <div class="profile-header">
        <div class="profile-pic small">
          <img src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="Profile Picture" />
        </div>
        <div>
          <h3>${user.first_name } ${user.last_name} </h3>
          <p>${user.email}</p>
        </div>
      </div>

 <form action="${pageContext.request.contextPath}/userprofile" method="post">
  <div class="profile-info">
    <div class="info-row">
      <label>First Name</label>
      <span><input type="text" class="form-control" name="firstName" value="${sessionScope.user.first_name}"></span>
    </div>
    <div class="info-row">
      <label>Last Name</label>
      <span><input type="text" class="form-control" name="lastName" value="${user.last_name}"></span>
    </div>
    <div class="info-row">
      <label>Email</label>
      <span><input type="text" class="form-control" name="email" value="${user.email}"></span>
    </div>
    <div class="info-row">
      <label>Mobile number</label>
      <span><input type="text" class="form-control" name="number" value="${user.phone}"></span>
    </div>

    <!-- Hidden input for user ID -->
    <input type="hidden" name="user_id" value="${user.user_id}">
 <a href="${pageContext.request.contextPath}/" class="btn-home">🏠 Back to Home</a>


  </div>
</form>

    </div>

    

    
  </section>

</div>

</body>
</html>