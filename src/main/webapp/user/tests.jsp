<%@ page import="com.example.exam.entity.Test" %>
<%@ page import="com.example.exam.repo.TestRepo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 14.05.2024
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    TestRepo testRepo = new TestRepo();
    List<Test> tests = testRepo.findAll();
%>
<a href="/index.jsp">
    <h1 class="bg-dark form-control text-white">Home</h1>
</a>
<div class="container mt-5">
    <h2 class="bg-dark form-control text-white">Tests</h2>
    <form action="/user/startTest.jsp">

        <div class="form-group">
            <div class="mb-3">
                <label for="test" class="form-label">Test:</label>
                <select class="form-select form-control" id="test" name="testId">
                    <%for (Test test : tests) {%>
                    <option value="<%=test.getId()%>"><%=test.getName()%>
                    </option>
                    <%}%>
                </select>
            </div>
            <%--@declare id="difficulty"--%><label for="difficulty">What level of testing do you need?</label>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="random" name="difficulty" value="Random" required>
                <label class="form-check-label" for="random">Random</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="thickly" name="difficulty" value="Thickly" required>
                <label class="form-check-label" for="thickly">Thickly</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="easy" name="difficulty" value="EASY" required>
                <label class="form-check-label" for="easy">Easy</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="normal" name="difficulty" value="NORMAL" required>
                <label class="form-check-label" for="normal">Normal</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="hard" name="difficulty" value="HARD" required>
                <label class="form-check-label" for="hard">Hard</label>
            </div>

            <div class="mb-3">
                <input type="number" class="form-control"
                       id="countQuestions" name="countQuestions" placeholder="How many questions ?"
                       required>
            </div>

            <div class="mb-3">
                <input type="number" class="form-control"
                       id="seconds" name="second" placeholder="How many seconds ?"
                       required>
            </div>

        </div>
        <button type="submit" class="btn btn-primary">Start Test</button>
    </form>
</div>
</body>
</html>
