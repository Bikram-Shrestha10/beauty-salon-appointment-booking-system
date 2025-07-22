<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Booking Confirmed</title>
  <style>
    body {
      background: linear-gradient(to right, #fdfbfb, #ebedee);
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .confirmation-box {
      background-color: #fff;
      padding: 35px 40px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      width: 100%;
    }

    .confirmation-box h2 {
      color: #28a745;
      margin-bottom: 25px;
      text-align: center;
    }

    .booking-detail {
      margin: 15px 0;
      font-size: 15px;
      color: #333;
    }

    .booking-detail strong {
      display: inline-block;
      width: 140px;
    }

    .summary-box {
      background-color: #f5f5f5;
      padding: 25px;
      border-radius: 12px;
      margin-top: 20px;
      border: 1px solid #ccc;
    }

    .summary-box h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .summary-item {
      margin-bottom: 14px;
      font-size: 15px;
    }

    .summary-item ul {
      margin: 8px 0 0 15px;
      padding: 0;
      list-style-type: disc;
    }

    .btn-home {
      display: block;
      text-align: center;
      margin: 30px auto 0;
      background-color: #007bff;
      color: #fff;
      padding: 12px 25px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
      width: fit-content;
      transition: background-color 0.3s ease;
    }

    .btn-home:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<div class="confirmation-box">
  <h2>🎉 Booking Confirmed!</h2>

  <div class="booking-detail"><strong>Appointment ID:</strong> ${appointment.appointmentId}</div>
  <div class="booking-detail"><strong>First Name:</strong> ${user.first_name}</div>
  <div class="booking-detail"><strong>Last Name:</strong> ${user.last_name}</div>

  <div class="summary-box">
    <h2>Summary</h2>

    <div class="summary-item"><strong>Stylist:</strong> ${stylist}</div>
    <div class="summary-item"><strong>Date:</strong> ${date}</div>
    <div class="summary-item"><strong>Time:</strong> ${time}</div>

    <div class="summary-item"><strong>Selected Services:</strong>
      <ul>
        <c:forEach var="service" items="${selectedServices}">
          <li>${service}</li>
        </c:forEach>
      </ul>
    </div>

    <div class="summary-item"><strong>Total Price:</strong> Rs. ${total}</div>
  </div>
  <p style="text-align:center; margin-top: 25px; font-size: 15px; color: #555;">
    Want to leave a review?
  </p>

<!-- Buttons -->
  <div style="display: flex; justify-content: center; gap: 15px; margin-top: 10px;">
    <a href="${pageContext.request.contextPath}/home" class="btn-home">🏠 Back to Home</a>
    <a href="${pageContext.request.contextPath}/review" class="btn-home" style="background-color: #28a745;">✍️ Write a Review</a>
  </div>
</div>

</body>
</html>