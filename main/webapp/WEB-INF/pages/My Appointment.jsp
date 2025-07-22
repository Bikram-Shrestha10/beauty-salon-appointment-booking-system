<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.beauty.model.Appointment" %>
<%@ page import="com.beauty.service.AppointmentService" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    AppointmentService appointmentService = new AppointmentService();
    List<Appointment> allAppointments = appointmentService.getAllAppointments();
    request.setAttribute("appointments", allAppointments);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Appointments</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/My Appointment.css"/>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="navbar">
            <div class="logo">
                <span class="logo-icon">&#x27A4;</span>
                <span>The Beauty Lab</span>
            </div>
        </div>

        <ul class="nav-menu">
            <li><a href="${pageContext.request.contextPath}/admindashboard" class="nav-link active">&#x1F3E0; Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/adminuser" class="nav-link">&#x1F464; User List</a></li>
            <li><a href="${pageContext.request.contextPath}/adminservice" class="nav-link">&#x1F4E6; Service List</a></li>
            <li><a href="${pageContext.request.contextPath}/myappointmentController" class="nav-link">&#x1F4CB; Appointment List</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-link">&#x1F6AA; Log Out</a></li>
        </ul>
    </div>
<div class="appointment-container">
    <h1>All Appointments</h1>

    <c:choose>
        <c:when test="${not empty appointments}">
   
<c:forEach var="appointment" items="${appointments}">
    <div class="card">
        <p><strong>ID:</strong> ${appointment.appointmentId}</p>
        <p><strong>Date:</strong> ${appointment.date}</p>
        <p><strong>Time:</strong> ${appointment.time}</p>
        <p><strong>Stylist:</strong> ${appointment.stylist}</p>
        <p><strong>Services:</strong></p>
        <ul>
            <c:forEach var="i" begin="0" end="${fn:length(appointment.serviceNames) - 1}">
                <li>${appointment.serviceNames[i]} – ${appointment.durations[i]} hours</li>
            </c:forEach>
        </ul>
    </div>
</c:forEach>
        </c:when>
        <c:otherwise>
            <p>No appointments found.</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
