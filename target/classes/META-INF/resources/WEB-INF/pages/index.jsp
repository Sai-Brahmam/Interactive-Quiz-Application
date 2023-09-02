<%@include file="common/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
.child {
  display: inline-block;
  border: 1px solid red;
  padding: 1rem 1rem;
  vertical-align: middle;
}
</style>
</head>
<body>
<div class="container  col-lg-3 col-lg-offset-2">
    <h4>Welcome to Quiz App</h4><br><br>
    <div class="d-flex">
    <div class="row">
        <div class="col-6 container w-40">
            <a href="/showQuizListToAdmin" class="btn btn-success btn-lg">Admin</a>

        </div>
        <div class="col-6 container w-40">
            <a href="/showQuizListToUser" class="btn btn-success btn-lg">User</a>

        </div>
    </div>
    </div>
</div>

<%@include file="common/footer.jspf" %>
</body>
</html>