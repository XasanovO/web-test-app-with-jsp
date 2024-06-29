<%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 14.05.2024
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-3 bg-dark text-white" style="height: 100vh">
        <ul class="list-group">
            <a href="/index.jsp">
                <li class="list-group-item">Home</li>
            </a>
            <a href="/admin/test.jsp">
                <li class="list-group-item">Tests</li>
            </a>
            <a href="/admin/question.jsp">
                <li class="list-group-item">Questions</li>
            </a>
        </ul>
    </div>
    <div class="col-9">
        <h1>Content</h1>
    </div>
</div>
</body>
</html>
