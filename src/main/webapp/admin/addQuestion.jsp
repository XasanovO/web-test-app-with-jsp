<%@ page import="com.example.exam.repo.TestRepo" %>
<%@ page import="com.example.exam.entity.Test" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.exam.entity.Question" %>
<%@ page import="com.example.exam.repo.QuestionRepo" %><%--
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
    TestRepo testRepo = new TestRepo();
    List<Test> tests = testRepo.findAll();
    String id = request.getParameter("id");
    QuestionRepo questionRepo = new QuestionRepo();
    Question question = null;
    if (id != null) {
        question = questionRepo.findById(Integer.parseInt(id));
    }
%>
<body>
<div class="container">
    <h1><%=question != null ? "Update Queston" : "Add Question"%>
    </h1>

    <form action="<%=question != null?"/question/update":"/question/add"%>" method="post" enctype="multipart/form-data">
        <%if (question != null) {%>
        <input type="hidden" value="<%=question.getId()%>" name="id">
        <%}%>
        <div class="mb-3">
            <label for="text" class="form-label">Question Text:</label>
            <input value="<%=question != null?question.getText():""%>" type="text" class="form-control" id="text"
                   name="text">
        </div>
        <div class="mb-3">
            <label for="level" class="form-label">Question Level:</label>
            <select class="form-select form-control" id="level" name="level">
                <option value="<%=question != null?question.getLevel():"EASY"%>"><%=question != null ? question.getLevel() : "Easy"%>
                </option>
                <option value="NORMAL">Normal</option>
                <option value="HARD">Hard</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="test" class="form-label">Test:</label>
            <select class="form-select form-control" id="test" name="testId">
                <option value="<%=question != null?question.getTest().getId():tests.get(0).getId()%>">
                    <%=question != null ? question.getTest().getName() : tests.get(0).getName()%>
                </option>
                <%for (Test test : tests) {%>
                <option value="<%=test.getId()%>"><%=test.getName()%>
                </option>
                <%}%>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Options:</label>
            <div class="row">
                <div class="col-12">
                    <input value="<%=question != null?question.getOptions().get(0):""%>" type="text"
                           class="form-control mb-2" name="option1" placeholder="Option 1">
                </div>
                <div class="col-12">
                    <input value="<%=question != null?question.getOptions().get(1):""%>" type="text"
                           class="form-control mb-2" name="option2" placeholder="Option 2">
                </div>
                <div class="col-12">
                    <input value="<%=question != null?question.getCorrectOption():""%>" type="text"
                           class="form-control mb-2" name="correctOption" placeholder="CorrectOption 3">
                </div>
            </div>
        </div>
        <div class="mb-3">
            <%if (question != null) {%>
            <img src="data:image/jpeg;base64,<%=question.getBase64Photo()%>" style="max-width: 60px">
            <%}%>
            <label for="image" class="form-label">Image:</label>
            <input type="file" class="form-control" id="image" name="image">
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
</body>
</html>
