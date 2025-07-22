<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user profile</title>
<style>
    * {
      box-sizing: border-box;
    }

    body {
      display: flex;
      font-family: Arial, sans-serif;
      margin: 0;
    }

    .profile-container {
      display: flex;
      width: 100%;
      height: 100vh;
    }

    .profile-sidebar {
      background-color: white;
      width: 250px;
      padding: 20px;
    }

    .profile-sidebar h2 {
      margin-bottom: 5px;
    }

    .profile-sidebar .member-since {
      font-size: 12px;
      color: #007BFF;
      margin-bottom: 20px;
    }

   
    /* Container to hold both thumbnail and popup */
.profile-pic {
  position: relative;
  display: inline-block;
}

/* Profile Thumbnail */
.profile-thumb {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  transition: transform 0.3s ease;
  cursor: pointer;
}

/* Hidden Zoom Popup */
.zoom-popup {
  display: none;
  position: absolute;
  top: -10px;
  left: 130%;
  z-index: 100;
  padding: 5px;
  background-color: white;
  border: 1px solid #ccc;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
}

/* Zoomed Image Style */
.zoom-popup img {
  width: 250px;
  height: 250px;
  border-radius: 10px;
}

/* Show popup on hover */
.profile-pic:hover .zoom-popup {
  display: block;
}
  .btn-home {
    display: inline-block;
    background-color: #007BFF;
    color: white;
    padding: 10px 18px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
  }

  .btn-home:hover {
    background-color: #0056b3;
  }

    .profile-nav a {
      display: block;
      padding: 10px;
      margin: 10px 0;
      text-decoration: none;
      color: black;
      background: #e0e0e0;
      border-radius: 5px;
    }

    .profile-nav a.active {
      background: #add8ff;
      font-weight: bold;
    }

    .profile-main {
      flex-grow: 1;
      background-color: #1e1e1e;
      color: white;
      padding: 30px;
      height: max-content;
    }

    /* Booking section tabs */
.booking-tabs {
  display: flex;
  gap: 20px;
  margin: 15px 0;
  border-bottom: 1px solid #ccc;
}

.tab-btn {
  background: none;
  border: none;
  padding: 10px 0;
  font-size: 16px;
  cursor: pointer;
  color: #333;
  border-bottom: 2px solid transparent;
}

.tab-btn.active {
  color: #f56a05;
  font-weight: bold;
  border-color: #f56a05;
}

/* Booking cards like in the image */
.white-card {
  background: #f9f9f9;
  color: #000;
  border-radius: 12px;
  padding: 15px;
  margin: 15px 0;
  box-shadow: 0px 1px 3px rgba(0,0,0,0.1);
}

.details-link.orange {
  color: #f56a05;
  text-decoration: none;
  font-weight: bold;
  display: inline-block;
  margin-top: 5px;
}
    
/* Booking cards like in the image */
.white-card {
  background: #f9f9f9;
  color: #000;
  border-radius: 12px;
  padding: 15px;
  margin: 15px 0;
  box-shadow: 0px 1px 3px rgba(0,0,0,0.1);
}

.details-link.orange {
  color: #f56a05;
  text-decoration: none;
  font-weight: bold;
  display: inline-block;
  margin-top: 5px;
}
.booking-card{
 background-color: #f9f9f9;
 color: black;
 border-radius: 10px;
 margin: 10px;
 padding: 10px;
 
}

  </style>
</head>
<body>

<div class="profile-container">
  <!-- Sidebar -->
  <aside class="profile-sidebar">
    <div class="profile-pic">
      <img style="   width: 120px;
      height: 120px;
      border-radius: 50%;
      margin-bottom: 10px;"   src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="Profile Picture" />
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

<!-- Main Section -->
  <section class="profile-main">
    <div id="history" class="content-section">
      <h2>Booking History</h2>
      <div class="booking-history">
        <c:choose>
          <c:when test="${not empty historyList}">
            <c:forEach var="appt" items="${historyList}">
              <div class="booking-card">
                <p><strong>Session with: </strong><span class="coach-name">${appt.stylist}</span></p>
                <p><span class="icon">📅</span> ${appt.appointment_date}</p>
                <p><span class="icon">⏰</span> ${appt.time}</p>
                <p><span class="icon">💰</span> Rs. ${appt.price}</p>
                <p><strong>Service:</strong> ${appt.services}</p>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <p>You haven't booked any appointments yet.</p>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
     <a href="${pageContext.request.contextPath}/" class="btn-home">🏠 Back to Home</a>
    
  </section>
</div>

</body>
</html>