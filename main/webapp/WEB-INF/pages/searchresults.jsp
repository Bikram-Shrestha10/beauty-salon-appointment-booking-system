<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Search Services</title>
    <style>
    /* Container styling */
.search-form {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 30px auto;
    max-width: 600px;
}

/* Input field */
.search-input {
    flex: 1;
    padding: 10px 15px;
    border: 1px solid #ccc;
    border-radius: 6px 0 0 6px;
    font-size: 16px;
    outline: none;
    transition: border 0.3s;
}

.search-input:focus {
    border-color: #007bff;
}

/* Submit button */
.search-button {
    padding: 10px 20px;
    background-color: brown;
    border: 1px solid white;
    color: white;
    border-radius: 0 6px 6px 0;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

.search-button:hover {
    background-color: #0056b3;
}
    
.service-card {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 25px 30px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    transition: box-shadow 0.3s ease;
}

.service-card:hover {
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.service-info {
    flex: 1;
}

.service-info h3 {
    margin-top: 0;
    font-size: 30px;
    color: #333;
}

.service-info p {
    margin: 6px 0;
    color: #555;
    font-size: 14px;
}

.book-button {
    display: inline-block;
    margin-top: 20px;
    padding: 8px 16px;
    background-color: #007bff;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s;
}

.book-button:hover {
    background-color: #0056b3;
}

.service-image img {
    width: 250px;
    height: auto%;
    border-radius: 6px;
    object-fit: cover;
    margin-left: 20px;
}
@media (max-width: 600px) {
    .service-card {
        flex-direction: column;
        text-align: left;
    }
    .service-image img {
        margin: 10px 0 0 0;
        width: 100%;
        max-width: 300px;
    }
}


    book-button {
        display: inline-block;
        margin-top: 15px;
        padding: 8px 12px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }

    book-button:hover {
        background-color: #0056b3;
    }
</style>
    
</head>

<body>
<jsp:include page="header.jsp"/>
    <h1>Search Services</h1>

<form method="get" action="search">
    <input type="text" name="query" value="${param.query}" placeholder="Enter service name" class="search-input" />
    <input class="search-button" type="submit" value="Search" />
</form>

<c:if test="${not empty param.query}">
    <h2>Results for "${param.query}":</h2>

    <c:choose>
        <c:when test="${empty results}">
            <p>No services found.</p>
        </c:when>
        <c:otherwise>
           <ul>
			    <c:forEach var="item" items="${results}">
			       <div class="service-card">
				    <div class="service-info">
				        <h3>${item.title}</h3>
				        <p><strong>Category:</strong> ${item.category}</p>
				        <p><strong>Duration:</strong> ${item.duration} hours</p>
				        <p><strong>Price:</strong> Rs ${item.price}</p>
				        <a href="${pageContext.request.contextPath}/bookappointment" class="book-button">Book Now</a>
				    </div>
				    <div class="service-image">
				        <img src="${pageContext.request.contextPath}/resources/images/${item.imagePath}" alt="${item.title}" />
				    </div>
				     <c:if test="${fn:containsIgnoreCase(item.category, param.query)}">
    <div class="category-match-note"></div>
</c:if>
				</div>
			    </c:forEach>
			   
</ul>

        </c:otherwise>
    </c:choose>
</c:if>

    <a class="book-button" href="${pageContext.request.contextPath}/ ">Back to Home</a>
</body>
</html>