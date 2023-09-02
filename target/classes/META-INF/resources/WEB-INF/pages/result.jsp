<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="common/navigation.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
<%@ page import="java.util.List"%>
<%@ page import="com.quiz.project.bean.Answer"%>
<%@ page import="com.quiz.project.bean.Question"%>
<% List<Answer> listOfAnswers = (List)session.getAttribute("listOfAnswers");
List<Question> listOfQuestion = (List)session.getAttribute("listOfQuestionsForResult");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
<h2>${quizName}</h2><br><br>
<h4>Your Score = ${score}/<%=listOfAnswers.size() %> !!</h4>
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
			<th>Your Answer</th>
			
		</tr>
		
		</thead>
		
		<% for(int index = 0; index < listOfQuestion.size(); index++){ %>	
		
			<%if(listOfQuestion.get(index).getCorrectOptionNo() == listOfAnswers.get(index).getChoice()) {%>
			<div>
			<tr>
				
				<td><%=index + 1%></td>
				<td><%=listOfQuestion.get(index).getQuestionStatement()%></td>
				<td><%=listOfQuestion.get(index).getOption1()%></td>
				<td><%=listOfQuestion.get(index).getOption2()%></td>
				<td><%=listOfQuestion.get(index).getOption3()%></td>
				<td><%=listOfQuestion.get(index).getOption4()%></td>
				<td><%=listOfQuestion.get(index).getCorrectOptionNo()%></td>
				<td class="bg-success"><%=listOfAnswers.get(index).getChoice()%></td>
				
			</tr>	
			</div>
		 	<% }
		 	
		 	if(listOfAnswers.get(index).getChoice() == null) {%>
			<div>
			<tr>
				
				<td><%=index + 1%></td>
				<td><%=listOfQuestion.get(index).getQuestionStatement()%></td>
				<td><%=listOfQuestion.get(index).getOption1()%></td>
				<td><%=listOfQuestion.get(index).getOption2()%></td>
				<td><%=listOfQuestion.get(index).getOption3()%></td>
				<td><%=listOfQuestion.get(index).getOption4()%></td>
				<td><%=listOfQuestion.get(index).getCorrectOptionNo()%></td>
				<td class="bg-warning">Not Attempted</td>
				
			</tr>	
			</div>
		 	<% }
		 	
		 	 else{ %>
		 	<div >
			<tr>
				
				<td><%=index + 1%></td>
				<td><%=listOfQuestion.get(index).getQuestionStatement()%></td>
				<td><%=listOfQuestion.get(index).getOption1()%></td>
				<td><%=listOfQuestion.get(index).getOption2()%></td>
				<td><%=listOfQuestion.get(index).getOption3()%></td>
				<td><%=listOfQuestion.get(index).getOption4()%></td>
				<td><%=listOfQuestion.get(index).getCorrectOptionNo()%></td>
				<td class="bg-danger"><%=listOfAnswers.get(index).getChoice()%></td>
				
			</tr>	
			</div>
		 	<% } %>
		 	
		<% } %>
		
</table><br>
 <a href="/showQuizListToUser" class="btn btn-success btn-lg">Go back to Quiz List Page</a>
</div>
</div>
</div>
<%@include file="common/footer.jspf" %>
</body>
</html>