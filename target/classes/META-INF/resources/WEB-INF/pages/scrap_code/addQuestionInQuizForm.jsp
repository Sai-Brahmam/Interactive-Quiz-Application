<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question Form</title>
<script type="text/javascript">
	function validate(){
		var qstmt = document.getElementById("qstmt");
		var o1 = document.getElementById("o1");
		var o2 = document.getElementById("o2");
		var o3 = document.getElementById("o3");
		var o4 = document.getElementById("o4");
		var cr_opt_no = document.getElementById("cr_opt_no");
		
		if(qstmt.value.trim() == ""){
			alert("No blank values allowed for question statement");
			return false;
		}
		if(o1.value.trim() == ""){
			alert("No blank values allowed for option 1");
			return false;
		}
		if(o2.value.trim() == ""){
			alert("No blank values allowed for option 2");	
			return false;
		}
		if(o3.value.trim() == ""){
			alert("No blank values allowed for option 3");		
			return false;
		}
		if(o4.value.trim() == ""){
			alert("No blank values allowed for option 4");	
			return false;
		}
		if(cr_opt_no.value.trim() == ""){
			alert("No blank values allowed for correct option no");
			return false;
		}
		
		else{
			true;
		}
	}
</script>
</head>
<body>
<h2>${quizName}</h2><br>
<!--  <p>${message1}${message2}${message3}</p><br><br> -->
<h5>${instructionMessage}</h5>
<div class = "container">
	<div class="row_justify-content-center mt-8">
	<div class="col-lg-3 col-md-8">
	<div class="card">
	<div class="card-body">
	
	<c:form onsubmit="return validate()" action="/createQuestion/${quizId}?requestDetails=${requestDetails}" modelAttribute="question" method="post">
	
		<div class="mb-3">
		<c:input type="hidden" class = "form-control"  path="questionNo" placeholder="${question.getQuestionNo()}" ></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="qstmt" path="questionStatement" placeholder="${AddQuestion}${question.getQuestionStatement()}" ></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o1" path="option1" placeholder="${AddOption1}${question.getOption1()}" ></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o2" path="option2" placeholder="${AddOption2}${question.getOption2()}"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o3" path="option3" placeholder="${AddOption3}${question.getOption3()}"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o4" path="option4" placeholder="${AddOption4}${question.getOption4()}"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text"  class = "form-control" id="cr_opt_no" path="correctOptionNo" placeholder="${AddCorrectOptionNo}${question.getCorrectOptionNo()}"></c:input>
		</div><br>
		
		<div>
        <input type="submit"  value="Save and Add Next Question" class = "btn btn-success w-150"/>	
		</div><br>
				
	</c:form>
	</div>
	</div>
	</div>
	</div>
	</div>

	<div class = "container">
	<div>
        <a href="/reviewQuestions/${quizId}?requestDetails=reviewRequest" class = "btn btn-success w-200">Done and Proceed for Review of Questions in this Quiz</a><br><br>
        <a href="/showQuizList" class = "btn btn-success w-200">Done and Proceed for Review of Quizzes</a><br><br>	
	</div>
	</div>
	<script src="/js/bootstrap.min.js"></script>
<%@include file="common/footer.jspf" %>


<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>