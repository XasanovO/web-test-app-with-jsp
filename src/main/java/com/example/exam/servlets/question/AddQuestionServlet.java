package com.example.exam.servlets.question;


import com.example.exam.entity.Question;
import com.example.exam.entity.Test;
import com.example.exam.entity.enums.QuestionLevel;
import com.example.exam.repo.QuestionRepo;
import com.example.exam.repo.TestRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(value = "/question/add")
public class AddQuestionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");
        String level = req.getParameter("level");
        String testId = req.getParameter("testId");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String correctOption = req.getParameter("correctOption");
        Part image = req.getPart("image");

        TestRepo testRepo = new TestRepo();
        Test test = testRepo.findById(Integer.parseInt(testId));


        Question question = Question
                .builder()
                .text(text)
                .level(QuestionLevel.valueOf(level))
                .test(test)
                .options(List.of(option1, option2, correctOption))
                .correctOption(correctOption)
                .image(image.getInputStream().readAllBytes())
                .build();

        QuestionRepo questionRepo = new QuestionRepo();
        questionRepo.save(question);

        resp.sendRedirect("/admin/question.jsp");
    }
}
