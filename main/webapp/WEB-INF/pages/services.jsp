<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Services</title>
          <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header.css"/>
    <style>
        .services-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .service-category {
            margin-bottom: 40px;
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }
        .service-list {
            flex: 1;
        }
        .service-category h2 {
            color: #8b4513;
            border-bottom: 2px solid #8b4513;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        .service-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px dashed #ddd;
        }
        .service-name {
            font-weight: 500;
        }
        .service-price {
            font-weight: bold;
            color: #8b4513;
        }
        .service-image {
            width: 300px;
            position: sticky;
            top: 20px;
        }
        .service-image img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .no-services {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        .view-more-btn {
		    position: fixed;
		    bottom: 30px;
		    left: 93%;
		    transform: translateX(-50%);
		    padding: 10px 20px;
		    background-color: #8b4513;
		    color: white;
		    border: 2px solid white;
		    border-radius: 5px;
		    cursor: pointer;
		    z-index: 1000;
		    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
		}
		
		.view-more-btn:hover {
		    background-color: #a0522d;
		}
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <div class="services-container">
        <h1>Our Services</h1>
        
        <c:choose>
            <c:when test="${empty services}">
                <div class="no-services">
                    <p>No services available at the moment.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:set var="currentCategory" value="" />
                <c:forEach items="${services}" var="service" varStatus="loop">
                    <c:if test="${service.category ne currentCategory}">
                        <c:if test="${not empty currentCategory}">
                                </div>
                                <div class="service-image">
                                    <img src="${pageContext.request.contextPath}/resources/images/${currentImage}" 
                                         alt="${currentCategory}">
                                </div>
                            </div>
                        </c:if>
                        
                        <c:set var="currentCategory" value="${service.category}" />
                        <c:set var="currentImage" value="${service.imagePath}" />
                        
                        <div class="service-category">
                            <div class="service-list">
                                <h2>${service.category}</h2>
                    </c:if>
                    
                    <div class="service-item">
                        <span class="service-name">${service.title}</span>
                        <span class="service-price">RS ${service.price}</span>
                       
                       
                    </div>
                    
                    
                    <c:if test="${loop.last}">
                    
                            </div>
                            
                            <div class="service-image">
                                <img src="${pageContext.request.contextPath}/resources/images/${service.imagePath}" 
                                     alt="${service.category}">
                                      
                            </div>
                            
                        </div>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <button class="view-more-btn" onclick="location.href='${pageContext.request.contextPath}/bookappointment'">View More</button>
    </div>
    
    
    <jsp:include page="footer.jsp"/>
</body>
</html>

<!-- This is the main header of the page 
    <div class="service-row">
     
      <div class="service-box">
        <h2>Make up</h2>
        <ul>
          <li>Daily make up<span>5000</span></li>
          <li>Night make up<span>7000</span></li>
          <li>Bridal make up<span>15000</span></li>
          <li>Occasion make up<span>10000</span></li>
      
        </ul>
      </div>
       <div class="service-image">
        <img src="${pageContext.request.contextPath}/resources/images/makeup.png" alt="Makeup">
      </div>
    </div>

    <div class="service-row">
      <div class="service-box">
        <h2>Hair styling</h2>
        <ul>
          <li>Simple haircut<span>2000</span></li>
          <li>Hair Styling<span>3500</span></li>
          <li>Full hair color<span>4500</span></li>
          <li>Protein treatment<span>5000</span></li>
         
        </ul>
      </div>
      <div class="service-image">
        <img  src="${pageContext.request.contextPath}/resources/images/hair.png" alt="Hair Styling">
      </div>
    </div>
    
    

    <div class="service-row">
 
      <div class="service-box">
        <h2>Nail care</h2>
        <ul>
          <li>Manicure<span>2500</span></li>
          <li>Pedicure<span>2500</span></li>
          <li>French manicure<span>3500</span></li>
          <li>Manicure & gel nails<span>5500</span></li>
         
        </ul>
      </div>
           <div class="service-image">
        <img src="${pageContext.request.contextPath}/resources/images/nails.png" alt="Nail Care">
      </div>
    </div>

    <div class="service-row">
      <div class="service-box">
        <h2>Cosmetology</h2>
        <ul>
          <li>Botox<span>15000</span></li>
          <li>Chemical Peel<span>12000</span></li>
          <li>Laser Skin Resurfacing<span>15000</span></li>
          <li>Laser Hair Removal<span>20000</span></li>
        </ul>
      </div>
      <div class="service-image">
        <img src="${pageContext.request.contextPath}/resources/images/cosmetology.png"alt="Cosmetology">
      </div>
    </div>

    <div class="service-row">

      <div class="service-box">
        <h2>SPA procedures</h2>
        <ul>
          <li>Body scrub & smoothing<span>2500</span></li>
          <li>Indulge & relax<span>2500</span></li>
          <li>Slimming & drainage<span>3000</span></li>
          <li>Foot revive treatment<span>3500</span></li>
        </ul>
      </div>
            <div class="service-image">
        <img src="${pageContext.request.contextPath}/resources/images/spa.jpg" alt="SPA">
      </div>
    </div>
  </div>
  -->