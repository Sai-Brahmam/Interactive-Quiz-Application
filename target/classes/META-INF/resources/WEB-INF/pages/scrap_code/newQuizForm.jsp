<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Quiz Form</title>
<script type="text/javascript">
	function validate(){
		var qname = document.getElementById("qname");
		var tlimit = document.getElementById("tlimit");
		var adt = document.getElementById("adt");
		var ddt = document.getElementById("ddt");
		
		if(qname.value.trim() ==""){
			alert("No blank values allowed for quiz name");
			return false;			
		}
		if(tlimit.value.trim() ==""){
			alert("No blank values allowed for time-limit");
			return false;
		}
		if(adt.value.trim() ==""){
			alert("No blank values allowed for activation date-time");	
			return false;
		}
		if(ddt.value.trim() ==""){
			alert("No blank values allowed for deactivation date-time");
			return false;
		}
		
		else{
			true;
		}
	}

</script>
</head>
<body>
<h2>${quiz.getQuizName()}</h2>
<p><h4>${relevantMessage}</h4></p>

<div class = "container">
	<div class="row_justify-content-center mt-5">
	<div class="col-lg-3 col-md-3">
	<div class="card">
	<div class="card-body">
	<c:form onsubmit="return validate()" action="createQuiz?quizId=${quiz.getQuizId()}" modelAttribute="quiz" method="post">
	
		<div class="mb-3">
		<c:input type="text" class = "form-control" id="qname" path="quizName" placeholder="${placeHolderMessage1}${quiz.getQuizName()}" ></c:input>
		</div><br><br>		
		
		<div class="mb-3">
		${placeHolderMessage2}
		<c:input type="time" class = "form-control" id="tlimit" path="timeLimit" placeHolder="${quiz.getTimeLimit()}" ></c:input>		
		</div><br><br>		
		
		<div class="mb-3">
		${placeHolderMessage3}
		<c:input type="datetime-local" class = "form-control" id="adt" path="activationDateTime" placeholder="${quiz.getActivationDateTime()}" ></c:input>
		</div><br><br>
		
		<div class="mb-3">
		${placeHolderMessage3}	
		<c:input type="datetime-local" class = "form-control" id="ddt" path="deactivationDateTime" placeholder="${quiz.getDeactivationDateTime()}" ></c:input>
		</div><br><br>
		
		<div class="mb-3">	
        <input type="submit"  value="Save and Add Questions" class = "btn btn-success w-100"/>	
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