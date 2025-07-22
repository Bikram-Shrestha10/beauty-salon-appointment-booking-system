<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admindashboard.css"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
<div class="container">

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

    <!-- Main Content -->
    <div class="main-content">
        <div class="navbar">
            <button class="menu-toggle">&#x2630;</button>
            <div class="user-menu">
                <div class="notification-icon">&#x1F514;<span class="notification-badge">3</span></div>
                <div class="user-avatar">A</div>
                <button class="more-options">&#x22EE;</button>
            </div>
        </div>

        <div class="dashboard">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <h1 class="welcome-heading">Welcome Admin</h1>
                <p class="welcome-text">All systems are running smoothly! You have <span class="highlight">3 unread alerts!</span></p>
            </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stats-card blue">
                    <div class="stats-title">Total users</div>
                    <div class="stats-value">${totalUsers}</div>
                </div>
                <div class="stats-card blue">
    <div class="stats-title">Total Appointments</div>
    <div class="stats-value">${totalAppointments}</div>
</div>

<div class="stats-card purple" style="background-color:green;">
    <div class="stats-title">Total Stylists</div>
    <div class="stats-value">${totalStylists}</div>
</div>

<div class="stats-card coral">
    <div class="stats-title">Total Reviews</div>
    <div class="stats-value">${totalReviews}</div>
</div>
</div>

            <!-- Detail Sections -->
            <div class="detail-sections">

                <!-- Order Details -->
                <div class="detail-card">
                    <div class="detail-header">
                        <h3 class="detail-title">Appointment Details</h3>
                        <div class="detail-badge">&#x26A1;</div>
                    </div>

                    <p class="detail-description">
                        The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc.
                    </p>

                    <div class="detail-stats">
                        <div class="stats-item">
                            <div class="stats-item-value">12.3k</div>
                            <div class="stats-item-label">Appointment Conformed</div>
                        </div>
                        <div class="stats-item">
                            <div class="stats-item-value">14k</div>
                            <div class="stats-item-label">Orders</div>
                        </div>
                        <div class="stats-item">
                            <div class="stats-item-value">71.56%</div>
                            <div class="stats-item-label">Users</div>
                         </div>
                        <div class="stats-item">
                            <div class="stats-item-value">${totalUsers}</div>
                            <div class="stats-item-label">Today Downloads</div>
                        </div>
                        
                    </div>

                    <canvas id="lineChart" width="400" height="200"></canvas>
                    
                </div>

                <!-- Sales Report -->
                <div class="detail-card">
                    <div class="detail-header">
                        <h3 class="detail-title"> Report</h3>
                        <a href="#" class="view-all-link">View all</a>
                    </div>

                    <p class="detail-description">
                        The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc.
                    </p>

                    <div class="chart-placeholder">
                       <canvas id="barChart" width="400" height="200"></canvas>
                    </div>

                    <div class="chart-legend">
                        <div class="legend-item">
                            <div class="legend-color blue"></div><span>Offline Appointment</span>
                        </div>

                        <div class="legend-item">
                            <div class="legend-color red"></div><span>Online Appointment</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>
const ctx = document.getElementById('lineChart').getContext('2d');
const lineChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [{
            label: 'Appointments',
            data: [12, 19, 14, 23, 17, 28, 30],
            borderColor: 'rgba(75, 192, 192, 1)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            fill: true,
            tension: 0.3
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: true }
        }
    }
});

const ctxBar = document.getElementById('barChart').getContext('2d');
const barChart = new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: ['Offline', 'Online'],
        datasets: [{
            label: 'Sales (k)',
            data: [45, 25, 60],
            backgroundColor: ['#3f51b5', '#f44336']
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false }
        }
    }
});

</script>

</html>
