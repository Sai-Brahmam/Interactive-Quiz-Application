<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Question Form</title>
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
			alert("Correct Option No. must be in between 1 to 4");
			return false;
		}
		
		else{
			true;
		}
		alert('Question Successfully added!')
	}
</script>
</head>
<body>
<h2>${quizName}</h2><br>
<h4>Add Question Details</h4>
<div class = "container">
	<div class="row_justify-content-center mt-8">
	<div class="col-lg-3 col-md-8">
	<div class="card">
	<div class="card-body">
	
	<c:form onsubmit="return validate()" action="/createQuestion/${quizId}" modelAttribute="question" method="post">
	
		<div class="mb-3">
		<c:input type="hidden" class = "form-control"  path="questionNo"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="qstmt" path="questionStatement" placeholder="Add Question Statement" ></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o1" path="option1" placeholder="Add Option 1" ></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o2" path="option2" placeholder="Add Option 2"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o3" path="option3" placeholder="Add Option 3"></c:input>
		</div><br>
		
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="o4" path="option4" placeholder="Add Option 4"></c:input>
		</div><br>
		
		<div class="mb-3">
		*Please add integral value
		<c:input type="text"  class = "form-control" id="cr_opt_no" path="correctOptionNo" placeholder="Add Correct Option No"></c:input>
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