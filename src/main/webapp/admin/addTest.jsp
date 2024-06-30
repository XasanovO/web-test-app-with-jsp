<%@ page import="com.example.exam.entity.Test" %>
<%@ page import="com.example.exam.repo.TestRepo" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 14.05.2024
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    String testId = request.getParameter("id");
    Test test = null;
    TestRepo testRepo = new TestRepo();
    if (testId != null) {
        test = testRepo.findById(Integer.parseInt(testId));
    }
%>


<body>
<div class="container">
    <h1><%=test != null?"Update Test":"Add Test"%></h1>
    <form action="<%=test != null?"/test/update":"/test/add"%>" method="post">
        <%if (test != null) {%>
        <input type="hidden" value="<%=test.getId()%>" name="id">
        <%}%>
        <div class="mb-3">
            <label for="name" class="form-label">Test Name:</label>
            <input value="<%=test != null?test.getName():""%>" type="text" class="form-control" id="name" name="name">
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
</body>
</html>
