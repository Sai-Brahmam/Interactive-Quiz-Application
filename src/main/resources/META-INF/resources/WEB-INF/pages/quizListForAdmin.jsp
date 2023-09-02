<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">    
<!DOCTYPE html>
<html>
<script>
function confirmation(){
    var result = confirm("Are you sure you want to delete this quiz?");
    if(result){
        alert("Deleted Successfully!");
    }
    
    return result;
}
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
</script>
<head>
<meta charset="ISO-8859-1">
<title>Quiz List</title>
</head>
<body>
<div class="container">
<div class="row">
<div class="col">
<table class="table table-striped table-border bordered-primary">
		<thead>
		
		<tr>
			<th>Quiz No</th>
			<th>Quiz Title</th>
			<th>Questions in Quiz</th>	
			<th>No of Questions</th>			
			<th>Activation Date & Time</th>
			<th>Deactivation Date & Time</th>
			<th colspan="2">Actions</th>
						
		</tr>
		
		</thead>
		
		<c1:forEach items="${quizList}" var="l">
		
			<tr>
				
				<td>${quizList.indexOf(l) + 1}</td>
				<td>${l.quizName}</td>
				<td><p><a href="/reviewQuestions/${l.quizId}" class="btn btn-light"><span id="boot-icon" class="bi bi-plus" style="font-size: 28px; -webkit-text-stroke-width: 2.9px; color: rgb(22, 162, 101);"></span> OR <span id="boot-icon" class="bi bi-pencil" style="font-size: 20px; color: rgb(84, 84, 84); -webkit-text-stroke-width: 1px; opacity: 1;"></span> </a></p></td>
				<td><p>${(l.listOfQuestions.size() - 1) + 1}</p></td>
				<td><p data-toggle="tooltip" data-placement="right" title="Format : (yyyy-mm-dd)T(hh:mm:ss)">${l.activationDateTime}</p></td>
				<td><p data-toggle="tooltip" data-placement="right" title="Format : (yyyy-mm-dd)T(hh:mm:ss)">${l.deactivationDateTime}</p></td>				
				<th><a href="/updateQuiz?quizId=${l.quizId}"> <span id="boot-icon" class="bi bi-pencil" style="font-size: 20px; color: rgb(84, 84, 84); -webkit-text-stroke-width: 1px; opacity: 1;"></span> </a> </th>
				<th><a href="/deleteQuiz?quizId=${l.quizId}" onclick="return confirmation();"> <span id="boot-icon" class="bi bi-trash" style="font-size: 20px; color: rgb(255, 0, 0); -webkit-text-stroke-width: 0.5px;"></span> </a> </th>
			
			</tr>	
		
		</c1:forEach>	
</table><br>
<a href="/createQuiz" class="btn btn-success"> <span id="boot-icon" class="bi bi-plus" style="font-size: 30px; color: rgb(255, 255, 255); -webkit-text-stroke-width: 3.0px;"></span>Add New Quiz</a>
</div>
</div>
</div>
<%@include file="common/footer.jspf" %>

</body>
</html>