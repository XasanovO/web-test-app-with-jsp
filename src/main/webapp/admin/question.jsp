<%@ page import="com.example.exam.repo.QuestionRepo" %>
<%@ page import="com.example.exam.entity.Question" %>
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
    <title>Questions</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    QuestionRepo questionRepo = new QuestionRepo();
    List<Question> questions = questionRepo.findAll();
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
        <a href="/admin/addQuestion.jsp">
            <button class="btn btn-dark">Add Question</button>
        </a>
        <table class="table table-striped">
            <thead>
            <td>Id</td>
            <td>Text</td>
            <td>Level</td>
            <td>Test</td>
            <td>Options</td>
            <td>CorrectOption</td>
            <td>Image</td>
            <td>Action</td>
            </thead>

            <tbody>
            <%for (Question question : questions) {%>
            <tr>
                <td><%=question.getId()%>
                </td>
                <td><%=question.getText()%>
                </td>
                <td><%=question.getLevel()%>
                </td>
                <td><%=question.getTest().getName()%>
                </td>
                <td><%=question.getOptions()%>
                </td>
                <td><%=question.getCorrectOption()%>
                </td>
                <td>
                    <%if (question.getImage() != null && question.getImage().length > 1) {%>
                    <img src="<%="/image?id="+question.getId()%>" alt="Question Photo"
                         style="max-width: 60px">
                    <%}%>
                </td>
                <td>
                    <a href="/admin/addQuestion.jsp?id=<%=question.getId()%>">
                        <button class="btn btn-info">edit</button>
                    </a>
                    <a href="/question/delete?id=<%=question.getId()%>">
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
