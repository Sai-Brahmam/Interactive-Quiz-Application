<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Solve Question</title>
</head>
<body>
<h2>${quizName}</h2><br>
<div class = "container">
	<div class="row_justify-content-center mt-8">
	<div class="col-lg-3 col-md-8">
	<div class="card">
	<div class="card-body">
	
	<c:form action="/attempt/${quizId}" modelAttribute="answer" method="post">
		
		<div class="mb-3">
		${index}] ${question.getQuestionStatement()}		
		</div><br>
		
		<div class="mb-3">
		<c:label path ="choice">${question.getOption1()}</c:label>
		<c:radiobutton  path="choice" value="1"/>
		</div><br>
		
		<div class="mb-3">
		<c:label path ="choice">${question.getOption2()}</c:label>
		<c:radiobutton  path="choice" value="2"/>
		</div><br>
		
		<div class="mb-3">
		<c:label path ="choice">${question.getOption3()}</c:label>
		<c:radiobutton  path="choice" value="3"/>
		</div><br>
		
		<div class="mb-3">
		<c:label path ="choice">${question.getOption4()}</c:label>
		<c:radiobutton  path="choice" value="4"/>
		</div><br>		
		
		
		<div>
        <input type="submit"  value="Next" class = "btn btn-success w-50"/>	
		</div><br>
				
	</c:form>
	
	</div>
	</div>
	</div>
	</div>
	</div>	
</body>
</html>