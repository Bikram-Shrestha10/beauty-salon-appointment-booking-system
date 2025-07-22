<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 

</head>
<body>

<div class="profile-container">
  <!-- Sidebar -->
  <aside class="profile-sidebar">
    <div class="profile-pic">
      <img style="width: 120px;
      height: 120px;
      border-radius: 50%;
      margin-bottom: 10px;" src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="Profile Picture" />
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
    <div class="container">
        <h1>Change Personal Information</h1>
        
        <div class="form-card">
            <form action="${pageContext.request.contextPath}/usersettings" method = "post">
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">First Name:</label>
                     
                           <input type="text" class="form-control"  id="firstName" name="firstName" value="${user.first_name}" required>
                       
                    </div>
                    <div class="form-group">
                        <label class="form-label">Last Name</label>
                        <div class="form-control-wrapper">
                            <input type="text" class="form-control" id="lastName" name="lastName" value="${user.last_name}" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Email:  </label>
            			 <input type="email" id="email" class="form-control"  name="email" value="${user.email}"  required>
                         
  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Phone No :</label>
                        <div class="form-control-wrapper">
                
                    <input type="tel" id="phone" name="phone" class="form-control" value="${user.phone}"  required>
               
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Username :</label>
                        <div class="form-control-wrapper">
                         <input type="text" name="username" id="username" class="form-control" value="${user.username}"  required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Password:</label>
                        <div class="form-control-wrapper">
                            <input type="text" class="form-control" id="password" name="password" value="${userPassword}" required>
                          </div>
                        </div>
                        <div class="form-group">
                    <label for="image">Insert Your Display Picure :</label>
                     <input type="file" class="form-control" id="myFile" name="imagefile" required>
 					
                </div>
                    </div>
               
                
                <button type="submit" class="btn">Save Changes</button>
      
            </form>
                <p style="color:red">${errorMsg}</p>
        </div>
        </div>
         <a href="${pageContext.request.contextPath}/" class="btn-home">🏠 Back to Home</a>
        
        
 
 </section>
 </div>

</body>
</html>
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
      background-color: #f0f0f0;
      width: 250px;
      padding: 20px;
        height: auto;
    }
    

    .profile-sidebar h2 {
      margin-bottom: 5px;
    }

    .profile-sidebar .member-since {
      font-size: 12px;
      color: #007BFF;
      margin-bottom: 20px;
    }

    .profile-pic {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
      
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
     height: auto;
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
      

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #fff;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .form-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 55px;
            margin-bottom: 35px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .form-card h2{
        color: black;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -10px;
        }

        .form-group {
            flex: 1 0 300px;
            padding: 0 10px;
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
        }

        .form-control {
            width: 90%;
            padding: 12px;
            background-color: #f0eef1;
            border: none;
            border-radius: 5px;
            color: #333;
            font-size: 14px;
            position: relative;
        }

        .form-control-wrapper {
            position: relative;
        }

        .clear-button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #999;
            cursor: pointer;
            font-size: 16px;
        }

        .btn {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #555;
        }

        .password-field {
            margin-bottom: 20px;
        }

        @media (max-width: 600px) {
            .form-group {
                flex: 1 0 100%;
            }
        }
    </style>
