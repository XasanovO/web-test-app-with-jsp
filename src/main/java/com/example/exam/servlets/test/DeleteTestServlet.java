package com.example.exam.servlets.test;


import com.example.exam.repo.TestRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/test/delete")
public class DeleteTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        TestRepo testRepo = new TestRepo();
        testRepo.deleteTestAndRelatedEntities(Integer.parseInt(id));

        resp.sendRedirect("/admin/test.jsp");
    }
}
