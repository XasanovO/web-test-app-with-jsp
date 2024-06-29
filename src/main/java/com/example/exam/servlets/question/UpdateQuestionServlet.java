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
@WebServlet(value = "/question/update")
public class UpdateQuestionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String text = req.getParameter("text");
        String level = req.getParameter("level");
        String testId = req.getParameter("testId");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String correctOption = req.getParameter("correctOption");
        Part image = req.getPart("image");

        TestRepo testRepo = new TestRepo();
        Test test = testRepo.findById(Integer.parseInt(testId));

        QuestionRepo questionRepo = new QuestionRepo();

        Question question = null;
        if (image.getInputStream().readAllBytes().length == 0) {
            question = questionRepo.findById(Integer.parseInt(id));
        }

        Question updatedQuestion = Question
                .builder()
                .id(Integer.parseInt(id))
                .text(text)
                .level(QuestionLevel.valueOf(level))
                .test(test)
                .options(List.of(option1, option2, correctOption))
                .correctOption(correctOption)
                .image(question != null ? question.getImage() : image.getInputStream().readAllBytes())
                .build();

        questionRepo.update(updatedQuestion);

        resp.sendRedirect("/admin/question.jsp");
    }
}
