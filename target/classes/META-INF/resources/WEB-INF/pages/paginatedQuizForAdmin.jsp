<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="common/navigation.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
<!DOCTYPE html>
<html>
<script>
function confirmation(){
    var result = confirm("Are you sure you want to delete this question?");
    if(result){
        alert("Deleted Successfully!");
    }
    
    return result;
}

</script>
<head>
<meta charset="ISO-8859-1">
<title>Admin Review</title>
</head>
<body>
<h2>${quizName}</h2><br>
<div class="container">
<div class="row">
<div class="col">
<table class="table table-striped table-border bordered-primary">
		<thead>
		
		<tr>
			<th>Question No</th>
			<th>Question Statement</th>
			<th>Option 1</th>
			<th>Option 2</th>
			<th>Option 3</th>
			<th>Option 4</th>
			<th>Correct Option</th>
			<th colspan="2">Actions</th>
			
		</tr>
		
		</thead>
		
		<c1:forEach items="${listOfQuestions}" var="l">
		
			<tr>
				
				<td>${listOfQuestions.indexOf(l) + 1}</td>
				<td>${l.questionStatement}</td>
				<td>${l.option1}</td>
				<td>${l.option2}</td>
				<td>${l.option3}</td>
				<td>${l.option4}</td>
				<td>${l.correctOptionNo}</td>
				<th><a href="/updateQuestion/${quizId}?questionNo=${l.questionNo}" > <span id="boot-icon" class="bi bi-pencil" style="font-size: 20px; color: rgb(84, 84, 84); -webkit-text-stroke-width: 1px; opacity: 1;"></span> </a></th>
				<th><a href="/deleteQuestion/${quizId}?questionNo=${l.questionNo}" onclick="return confirmation();"> <span id="boot-icon" class="bi bi-trash" style="font-size: 20px; color: rgb(255, 0, 0); -webkit-text-stroke-width: 0.5px;"></span> </a></th>
				
			</tr>	
		
		</c1:forEach>	
		
</table><br>
<a href="/createQuestion/${quizId}" class="btn btn-success w-200"> <span id="boot-icon" class="bi bi-plus" style="font-size: 30px; color: rgb(255, 255, 255); -webkit-text-stroke-width: 3.0px;"></span>Add New Question </a><br><br>
<a href="/showQuizListToAdmin" class="btn btn-success w-200"> Review Quiz List </a>
</div>
</div>
</div>
<%@include file="common/footer.jspf" %>
</body>
</html>