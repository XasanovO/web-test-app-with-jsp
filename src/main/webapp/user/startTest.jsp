<%@ page import="com.example.exam.repo.TestRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.exam.entity.Question" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.exam.repo.QuestionRepo" %>
<%@ page import="com.example.exam.repo.TestReportRepo" %>
<%@ page import="com.example.exam.entity.TestReport" %>
<%@ page import="com.example.exam.entity.User" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.exam.entity.enums.QuestionLevel" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 14.05.2024
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    String testId = request.getParameter("testId");
    String difficulty = request.getParameter("difficulty");
    String countQuestions = request.getParameter("countQuestions");
    String second = request.getParameter("second");

    User user = (User) session.getAttribute("user");

    QuestionRepo questionRepo = new QuestionRepo();
    List<Question> questions;

    if (difficulty.equals("Random")) {
        questions = questionRepo.findByTestIdAndCount(Integer.parseInt(testId), Integer.parseInt(countQuestions));
    } else if (difficulty.equals("Thickly")) {
        questions = questionRepo.findAllThicklyByLevel(Integer.parseInt(testId), Integer.parseInt(countQuestions));
    } else {
        questions = questionRepo.findByTestIdAndCountAndDifficulty(Integer.parseInt(testId), difficulty, Integer.parseInt(countQuestions));
    }

    TestReport testReport = TestReport.builder()
            .user(user)
            .totalQuestions(questions.size())
            .level(difficulty)
            .endTime(LocalDateTime.now().plusSeconds(Integer.parseInt(second)))
            .build();

    TestReportRepo testReportRepo = new TestReportRepo();
    TestReport savedTestReport = testReportRepo.save(testReport);
    session.setAttribute("questions", questions);
    session.setAttribute("testReport", savedTestReport);

%>
<body>
<div class="col">
    <form action="/test/end" method="post">
        <%
            int i = 1;
            for (Question question : questions) {
                List<String> questionOptions = question.getOptions();
                Collections.shuffle(questionOptions);
        %>
        <div class="mb-4">
            <div class="row align-items-center">
                <%if (question.getImage() != null && question.getImage().length > 1) {%>
                <div class="col-auto">
                    <img src="<%="/image?id="+question.getId()%>" alt="Question Photo"
                         style="max-width: 60px">
                </div>
                <%}%>
                <div class="col">
                    <p><%= question.getText() + " (Level :" + question.getLevel() + ") " + i++%>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <% for (String questionOption : questionOptions) {%>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="option_<%= questionOption %>"
                               name="<%=question.getId()%>" value="<%= questionOption %>" required>
                        <label class="form-check-label" for="<%= questionOption %>"><%= questionOption %>
                        </label>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
        <div class="text-center">
            <button type="submit" class="btn btn-success">End Test</button>
        </div>
    </form>
</div>
</body>
</html>
