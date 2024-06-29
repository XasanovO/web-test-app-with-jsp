<%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 12.05.2024
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="text-center mb-4">
                <h2>Login</h2>
            </div>
            <form action="/auth/login" method="post">
                <div class="form-group">
                    <input name="email" type="email" class="form-control" id="email" placeholder="Enter Email">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary btn-block">login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
