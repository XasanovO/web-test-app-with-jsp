package com.example.exam.servlets.question;


import com.example.exam.repo.QuestionRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/question/delete")
public class DeleteQuestionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        QuestionRepo questionRepo = new QuestionRepo();
        questionRepo.delete(Integer.parseInt(id));

        resp.sendRedirect("/admin/question.jsp");
    }
}
