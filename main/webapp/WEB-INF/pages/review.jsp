<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Review Form</title>
    <link rel="stylesheet" href="css/review.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="main-container">
    <div class="form-container">
        <h2 class="form-title">Reviews</h2>

 <form action="${pageContext.request.contextPath}/review" method="post">
 
            <div class="form-grid">
                <div class="left">
                    <label for="name">Name :</label>
                    <input type="text" name="name" placeholder="name" required />

                    <label for="location">Location :</label>
                    <div class="location-input">
                        <input type="text" name="location" placeholder="location" required />
                        <span class="icon"><img style="height: 21px; width: 21px;" src="${pageContext.request.contextPath}/resources/images/icon.png"></span>
                    </div>

                    <label for="stylist">Stylist Name :</label>
		<select name="stylist" required>
		    <c:forEach var="stylist" items="${stylistList}">
		        <option value="${stylist}">${stylist}</option>
		        <c:out value="${stylistList}" />
		    </c:forEach>
		</select>

                    <label for="rating">Rating:</label>
                    <select name="rating" required>
                         <option >Good</option>
                       <option>Satisfied</option>
                            <option >Average</option>
                             <option >Bad</option>
                    
                    </select>
                </div>

                <div class="right">
                    <label for="review">Review:</label>
                    <textarea name="review" placeholder="Give me your review here..." required></textarea>
                </div>
            </div>
            <div class="submit-section">
    <button type="submit" class="submit-btn">Submit </button>
</div>
        </form>
    </div>
</div>

</body>
<jsp:include page="footer.jsp"/>
</html>