<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
<!DOCTYPE html>
<html>

<script>
	function validate(){
		var qname = document.getElementById("qname");		
		var adt = new Date(document.getElementById('adt').value);
		var ddt = new Date(document.getElementById('ddt').value);
		var localDateTime = new Date();
		
		var comparableDate = new Date(adt);
		comparableDate.setHours(comparableDate.getHours() + 1);

		
		if(qname.value.trim() ==""){
			alert("No blank values allowed for quiz name");
			return false;			
		}
		if(!Date.parse(adt)){
			alert("No blank values allowed for activation date-time");	
			return false;
		}
		if(adt.getTime() < localDateTime.getTime()){
			 alert("Activation date & time values less than or equal to the Current Date & time are not allowed");
		      return false;
		}
		if(!Date.parse(ddt)){
			alert("No blank values allowed for deactivation date-time");
			return false;
		}
		if(ddt.getTime() < comparableDate.getTime()){
			 alert("Deactivation date-time should be atleast 1 hour more than Activation date-time");
		      return false;
		}
		
		else{
			true;
		}
		alert("Quiz added successfully!!");
	}

</script>
<head>
<meta charset="ISO-8859-1">
<title>New Quiz Form</title>
<h2>Add Quiz Details</h2>
</head>
<body>

<div class = "container">
	<div class="row_justify-content-center mt-5">
	<div class="col-lg-3 col-md-3">
	<div class="card">
	<div class="card-body">
	<c:form onsubmit="return validate()" action="createQuiz" modelAttribute="quiz" method="post">
	
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="qname" path="quizName" placeholder="Add Quiz Name" ></c:input>
		</div><br><br>		
		
		<div class="mb-3">
		Select activation date & time of quiz
		<c:input type="datetime-local" class = "form-control" id="adt" path="activationDateTime" min="${quiz.getActivationDateTime()}"></c:input>
		</div><br><br>
		
		<div class="mb-3">
		Select deactivation date & time of quiz	
		<c:input type="datetime-local" class = "form-control" id="ddt" path="deactivationDateTime"></c:input>
		</div><br><br>
		
		<div class="mb-3">	
        <input type="submit"  value="Save" class = "btn btn-success w-100"/>	
		</div>	
			
	</c:form>
	</div>
	</div>
	</div>
	</div>
	</div>
<%@include file="common/footer.jspf" %>
</body>
</html>