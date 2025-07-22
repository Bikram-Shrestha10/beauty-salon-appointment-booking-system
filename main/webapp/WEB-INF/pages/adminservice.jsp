<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Service Price Management</title>

</head>
 <style>
                * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8f9fa;
        }

        /* Layout */
        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background-color: #fff;
            border-right: 1px solid #eaeaea;
            position: fixed;
            height: 100vh;
            transition: all 0.3s;
            z-index: 100;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 240px;
            padding: 0;
            transition: all 0.3s;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 10px 20px;
            height: 60px;
            border-bottom: 1px solid #eaeaea;
        }

        .logo {
            display: flex;
            align-items: center;
            color: #5057e5;
            font-weight: 700;
            font-size: 20px;
        }

        .logo span {
            margin-left: 10px;
        }

        .logo-icon {
            color: #5057e5;
            font-size: 20px;
        }

        .menu-toggle {
            background: none;
            border: none;
            color: #555;
            font-size: 24px;
            cursor: pointer;
        }

        .user-menu {
            display: flex;
            align-items: center;
        }

        .notification-icon {
            margin-right: 20px;
            color: #555;
            position: relative;
            font-size: 18px;
        }

        .notification-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #5057e5;
            color: #fff;
            border-radius: 50%;
            width: 16px;
            height: 16px;
            font-size: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #e0e0e0;
            color: #666;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .more-options {
            background: none;
            border: none;
            color: #555;
            font-size: 24px;
            margin-left: 15px;
            cursor: pointer;
        }

        /* Sidebar Navigation */
        .nav-menu {
            padding: 20px 0;
            list-style: none;
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #555;
            text-decoration: none;
            transition: all 0.3s;
        }

        .nav-link:hover {
            background-color: #f5f7ff;
        }

        .nav-link.active {
            background-color: #5057e5;
            color: #fff;
            border-radius: 8px;
            border: 2px solid;
            margin: 0 15px;
            padding: 12px 10px;
        }

        .nav-icon {
            margin-right: 10px;
            font-size: 18px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        input[type="number"] {
            width: 80px;
        }
        .btn-update {
            padding: 5px 12px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        img {
            width: 50px;
        }
    </style>
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

    <!-- ✅ Main Content Area -->
    <div class="main-content">
        <div class="navbar">
            <div class="logo">Admin Panel</div>
        </div>

        <div style="padding: 20px;">
            <h2>All Services</h2>

            <table border="1" width="100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Duration (Hours)</th>
                        <th>Category</th>
                        <th>Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${serviceList}">
                        <tr>
                            <td>${s.serviceId}</td>
                            <td>${s.title}</td>
                            <td>Rs ${s.price}</td>
                            <td>${s.duration}</td>
                            <td>${s.category}</td>
                            <td><img src="${pageContext.request.contextPath}/resources/images/${s.imagePath}" width="60" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3>Update Service Price</h3>

            <form action="${pageContext.request.contextPath}/adminservice" method="post" style="margin-top: 20px;" >
                <label for="serviceId">Select Service:</label>
                <select name="serviceId" required>
                    <option value="">-- Select Service --</option>
                    <c:forEach var="s" items="${serviceList}">
                        <option value="${s.serviceId}">${s.title}</option>
                    </c:forEach>
                </select>

                <label for="price">New Price:</label>
                <input type="number" name="price" placeholder="Enter new price e.g. 3000" required />

                <button type="submit">Update</button>
            </form>
        </div>
    </div>

</body>
</html>