<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Question Form</title>
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
			alert("No blank values allowed for Correct Option No");
			return false;
		}
		if(cr_opt_no.value < 1 || cr_opt_no.value > 4){
			alert("Correct Option No values less than 1 as well as more than 4 are not allowed");
			return false;
		}
		
		else{
			true;
		}
		alert("Updated Successfully!");
	}
</script>
</head>
<body>
<h2>${quiz.getQuizName()}</h2><br><br>
<h4>Update the necessary fields</h4>
<div class = "container">
	<div class="row_justify-content-center mt-8">
	<div class="col-lg-6 col-md-8">
	<div class="card">
	<div class="card-body">
	<p>* (If you dont want to change any field then leave it as it is)</p>
	<c:form onsubmit="return validate()" action="/updateQuestion/${quiz.getQuizId()}" modelAttribute="question" method="post">
	
		<div class="mb-3">
		<c:input type="hidden" class = "form-control"  path="questionNo" placeholder="${question.getQuestionNo()}" ></c:input>
		</div><br>
		
		<div class="mb-3">
		Question Statement
		<c:input type="text" class = "form-control" id="qstmt" path="questionStatement"></c:input>
		</div><br>
		
		<div class="mb-3">
		Option 1
		<c:input type="text" class = "form-control" id="o1" path="option1"></c:input>
		</div><br>
		
		<div class="mb-3">
		Option 2
		<c:input type="text" class = "form-control" id="o2" path="option2"></c:input>
		</div><br>
		
		<div class="mb-3">
		Option 3
		<c:input type="text" class = "form-control" id="o3" path="option3"></c:input>
		</div><br>
		
		<div class="mb-3">
		Option 4
		<c:input type="text" class = "form-control" id="o4" path="option4"></c:input>
		</div><br>
		
		<div class="mb-3">
		Correct Option No
		<c:input type="text"  class = "form-control" id="cr_opt_no" path="correctOptionNo"></c:input>
		</div><br>
		
		<div>
        <input type="submit"  value="Save" class = "btn btn-success w-50"/>	
		</div><br>
				
	</c:form>
	</div>
	</div>
	</div>
	</div>
	</div>
<%@include file="common/footer.jspf" %>
</body>
</html>