<%@ page import="com.example.exam.repo.TestRepo" %>
<%@ page import="com.example.exam.entity.Test" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 14.05.2024
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tests</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    TestRepo testRepo = new TestRepo();
    List<Test> tests = testRepo.findAll();
%>
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
        <a href="/admin/addTest.jsp">
            <button class="btn btn-dark">Add Test</button>
        </a>
        <table class="table table-striped">
            <thead>
            <td>Id</td>
            <td>Name</td>
            <td>Action</td>
            </thead>

            <tbody>
            <%for (Test test : tests) {%>
            <tr>
                <td><%=test.getId()%>
                </td>
                <td><%=test.getName()%>
                </td>
                <td>
                    <a href="/admin/addTest.jsp?id=<%=test.getId()%>">
                        <button class="btn btn-info">edit</button>
                    </a>
                    <a href="/test/delete?id=<%=test.getId()%>">
                        <button class="btn btn-danger">delete</button>
                    </a>
                </td>
            </tr>
            <%}%>
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
