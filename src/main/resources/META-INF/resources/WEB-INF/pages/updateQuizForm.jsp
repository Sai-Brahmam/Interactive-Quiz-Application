<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Quiz Form</title>
<script type="text/javascript">
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
	alert("Updated Successfully!");
}
</script>

</head>
<body>
<h2>${quiz.getQuizName()}</h2><br>
<h4>Please overwrite the only fields which you want to change (Overwriting all is not compulsory)</h4>
<div class = "container">
	<div class="row_justify-content-center mt-5">
	<div class="col-lg-6 col-md-6">
	<div class="card">
	<div class="card-body">
	<c:form  onsubmit="return validate()" action="updateQuiz" modelAttribute="quiz"  name="newQuizForm" method="post">
	
		<div class="mb-3">
		<c:input type="hidden" class = "form-control" id="qid" path="quizId" placeholder="${quiz.getQuizId()}" ></c:input>
		</div><br><br>
		
		<div class="mb-3">		
		Previous Quiz Name
		<c:input type="text" class = "form-control" id="qname" path="quizName" placeholder="${quiz.getQuizName()}" ></c:input>
		</div><br><br>			
		
		<div class="mb-3">
		Previous activation date & time (yyyy-mm-ddThh:mm) = ${quiz.getActivationDateTime()}<br>
		Select a new activation date & time of quiz
		<c:input type="datetime-local" class = "form-control" id="adt" path="activationDateTime" ></c:input>
		</div><br><br>
		
		<div class="mb-3">
		Previous deactivation date & time (yyyy-mm-ddThh:mm) = ${quiz.getDeactivationDateTime()}<br>
		Select a new deactivation date & time of quiz
		<c:input type="datetime-local" class = "form-control" id="ddt" path="deactivationDateTime" placeholder="${quiz.getDeactivationDateTime()}" ></c:input>
		</div><br><br>
		
		<div class="mb-3">	
        <input type="submit"  value="Save Changes" class = "btn btn-success w-100" />	
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