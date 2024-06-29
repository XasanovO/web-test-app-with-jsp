package com.example.exam.servlets.test;


import com.example.exam.entity.Question;
import com.example.exam.entity.TestReport;
import com.example.exam.entity.enums.TestStatus;
import com.example.exam.repo.TestReportRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/test/end")
public class EndTestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        TestReport testReport = (TestReport) session.getAttribute("testReport");
        List<Question> questions = (List<Question>) session.getAttribute("questions");

        TestReportRepo testReportRepo = new TestReportRepo();

        Integer correctAnswersCount = 0;
        Integer inCorrectAnswersCount = 0;

        for (Question question : questions) {
            String option = req.getParameter(question.getId().toString());
            if (option.equals(question.getCorrectOption())) {
                correctAnswersCount++;
            } else {
                inCorrectAnswersCount++;
            }
        }

        if (!testReport.getEndTime().isAfter(LocalDateTime.now())) {
            testReport.setStatus(TestStatus.DID_NOT_FINISH_ON_TIME);
            testReport.setCorrectAnswers(0);
            testReport.setIncorrectAnswers(0);

            testReportRepo.update(testReport);
        } else {
            testReport.setCorrectAnswers(correctAnswersCount);
            testReport.setIncorrectAnswers(inCorrectAnswersCount);
            testReport.setStatus(TestStatus.FINISHED_ON_TIME);

            testReportRepo.update(testReport);
        }
        resp.sendRedirect("/");
    }
}
