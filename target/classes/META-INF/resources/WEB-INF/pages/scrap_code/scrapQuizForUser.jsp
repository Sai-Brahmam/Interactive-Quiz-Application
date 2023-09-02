<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="common/navigation.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="c" %>
  
<%@ page import="java.util.List"%>
<%@ page import="com.quiz.project.bean.Question"%>
<%@ page import="com.quiz.project.bean.Answer"%>
<% List<Question> listOfQuestions= (List)session.getAttribute("listOfQuestionstoattempt");
   List<Answer> listOfAnswers = (List)session.getAttribute("listOfAnswers");%>
   
<!DOCTYPE html>
<html>
<head>
<script>
//var tlimit = document.getElementById("tlimit");
//var hours = parseInt(tlimit.substring(0,2));
//var minutes = parseInt(tlimit.substring(3,5));
//var tlimit_milli = hours* 60 * 60 * 1000 + minutes* 60 * 1000;
//var tlimit = new moment(document.getElementById("tlimit"), 'HH:mm');
//var updatedDateTime = new Date(adt.getTime() + tlimit_milli);
	
	
	//alert(adt.getTime());
	//alert(tlimit);
	//alert(tlimit_milli);
	//alert(hours);
	//alert(minutes);
	//alert(adt);
	//alert(updatedDateTime);
	//alert(ddt);
	//alert(tlimit_milli);
    //alert(qname.value);
	//alert(localDateTime);
	//if(tlimit.value.trim() == null){
	//	alert("No blank values allowed for time-limit");
	//	return false;
	//}
	//if ((updatedDateTime.getTime() > ddt.getTime())) {
	//      alert("Deactivation date & time values should be greater than the [Activation date & time + timeLimit] of quiz");
	//      return false;
	//}
</script>
<meta charset="ISO-8859-1">
<title>Attempt Quiz</title>
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
			
		</tr>
		
		</thead>
		<p><%= listOfAnswers.get(1).getQuestionStatement() %></p>
		<!-- ------------------------------------------------------------- -->
		<c:form action="attempt" modelAttribute="listOfAnswers" method="post">
		
		<!--<c1:forEach items="${listOfQuestions}" var="l">-->
		<%for ( int qItr=0, aItr=0; qItr < listOfQuestions.size() && aItr < listOfAnswers.size(); qItr++,aItr++){ %>
		
			<tr>
				
				
				<td>
				<div class="mb-3">
				<c:label path ="<%= Integer.toString(listOfAnswers.get(aItr).getQuestionNo()) %>"><%=Integer.toString(listOfQuestions.get(qItr).getQuestionNo()) %></c:label>
				<c:input type="hidden"  path="<%= Integer.toString(listOfAnswers.get(aItr).getQuestionNo()) %>" placeholder="<%=Integer.toString(listOfQuestions.get(qItr).getQuestionNo()) %>"/>
				</div><br>
				</td>				
				
				<td>
				<div class="mb-3">
				<c:label path ="<%= listOfAnswers.get(aItr).getQuestionStatement() %>"><%=listOfQuestions.get(qItr).getQuestionStatement() %></c:label>
				<c:input type="hidden"  path="<%= listOfAnswers.get(aItr).getQuestionStatement() %>" placeholder="<%=listOfQuestions.get(qItr).getQuestionStatement() %>"/>
				</div><br>
				</td>
				
				<td>
				
				<c:radiobutton  path="<%= listOfAnswers.get(qItr).getChoice() %>" value="<%=listOfQuestions.get(qItr).getOption1() %>"/>
				<c:label path ="<%= listOfAnswers.get(qItr).getChoice() %>"><%=listOfQuestions.get(qItr).getOption1() %></c:label>
				
				</td>
				
				<td>
							
				<c:radiobutton  path="<%= listOfAnswers.get(aItr).getChoice() %>" value="<%=listOfQuestions.get(qItr).getOption2() %>"/>
				<c:label path ="<%= listOfAnswers.get(aItr).getChoice() %>"><%=listOfQuestions.get(qItr).getOption2() %></c:label>
				
				</td>
				
				<td>
							
				<c:radiobutton  path="<%= listOfAnswers.get(aItr).getChoice() %>" value="<%=listOfQuestions.get(qItr).getOption3() %>"/>
				<c:label path ="<%= listOfAnswers.get(aItr).getChoice() %>"><%=listOfQuestions.get(qItr).getOption3() %></c:label>
				
				</td>
				
				<td>
								
				<c:radiobutton  path="<%= listOfAnswers.get(aItr).getChoice() %>" value="<%=listOfQuestions.get(qItr).getOption4() %>"/>
				<c:label path ="<%= listOfAnswers.get(aItr).getChoice() %>"><%=listOfQuestions.get(qItr).getOption4() %></c:label>
				
				</td>
				
			</tr>	
			
		
		<!-- ------------------------------------------------------------- -->
		<%}%>
		<!--</c1:forEach>	-->
		<c:button>Submit</c:button>
		</c:form>
		
</table><br>
</div>
</div>
</div>
<%@include file="common/footer.jspf" %>
</body>
</html>