<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz Rules & Details</title>
</head>
<body>
<h1>${quiz.getQuizName()}</h1><br><br>
<h2>Some Rules of this Quiz</h2>
<ul>
	<h5><li><p>This quiz Contains ${quiz.getListOfQuestions().size()} questions </p></li><h5>
	<h5><li><p>You can't exit from the quiz while you are playing </p></li><h5>
	<h5><li><p>You can't go back to previous question once you hit next</p></li><h5>
	<h5><li><p>You'll get points on the basis of your correct answers</p></li><h5>
	<h5><li><p>One correct answer has one point</p></li><h5>
</ul><br>

<a href="/attempt/${quiz.getQuizId()}" class="btn btn-success" > Attempt Quiz </a>
<%@include file="common/footer.jspf" %>

</body>
</html>