<%@ page import="com.example.exam.entity.User" %>
<%@ page import="com.example.exam.repo.TestReportRepo" %>
<%@ page import="com.example.exam.entity.TestReport" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.exam.entity.enums.TestStatus" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 15.05.2024
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test Report</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    User user = (User) session.getAttribute("user");
    TestReportRepo testReportRepo = new TestReportRepo();
    List<TestReport> testReports = testReportRepo.findAllByUserId(user.getId());
    if (testReports.isEmpty()) {
        response.sendRedirect("/index.jsp");
        return;
    }
%>
<body>
<a href="/index.jsp">
    <h1 class="bg-dark form-control text-center text-white">Home</h1>
</a>
<div class="row">
    <div class="col-12">
        <h1 class="bg-dark form-control text-center text-white">Accepted Tests</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Id</td>
                <td>User</td>
                <td>Date</td>
                <td>Status</td>
                <td>Level</td>
                <td>TotalQuestions</td>
                <td>CorrectAnswers</td>
                <td>InCorrectAnswers</td>
            </tr>
            </thead>
            <tbody>
            <%for (TestReport testReport : testReports) {%>
            <%if (testReport.getStatus().equals(TestStatus.FINISHED_ON_TIME)) {%>
            <tr>
                <td><%=testReport.getId()%>
                </td>
                <td><%=testReport.getUser().getUsername()%>
                </td>
                <td><%=testReport.getEndTime().toLocalDate()%>
                </td>
                <td><%=testReport.getStatus()%>
                </td>
                <td><%=testReport.getLevel()%>
                </td>
                <td><%=testReport.getTotalQuestions()%>
                </td>
                <td><%=testReport.getCorrectAnswers()%>
                </td>
                <td><%=testReport.getIncorrectAnswers()%>
                </td>
            </tr>
            <%}%>
            <%}%>
            </tbody>
        </table>
    </div>
    <div class="col-12">
        <h1 class="bg-dark form-control text-center text-white">Failed Tests</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Id</td>
                <td>User</td>
                <td>Date</td>
                <td>Status</td>
                <td>Level</td>
                <td>TotalQuestions</td>
                <td>CorrectAnswers</td>
                <td>InCorrectAnswers</td>
            </tr>
            </thead>
            <tbody>
            <%for (TestReport testReport : testReports) {%>
            <%if (testReport.getStatus().equals(TestStatus.DID_NOT_FINISH_ON_TIME)) {%>
            <tr>
                <td><%=testReport.getId()%>
                </td>
                <td><%=testReport.getUser().getUsername()%>
                </td>
                <td><%=testReport.getEndTime().toLocalDate()%>
                </td>
                <td><%=testReport.getStatus()%>
                </td>
                <td><%=testReport.getLevel()%>
                </td>
                <td><%=testReport.getTotalQuestions()%>
                </td>
                <td><%=testReport.getCorrectAnswers()%>
                </td>
                <td><%=testReport.getIncorrectAnswers()%>
                </td>
            </tr>
            <%}%>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
