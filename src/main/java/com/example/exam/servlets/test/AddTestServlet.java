package com.example.exam.servlets.test;

import com.example.exam.entity.Test;
import com.example.exam.repo.TestRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/test/add")
public class AddTestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Test test = Test.builder()
                .name(name)
                .build();

        TestRepo testRepo = new TestRepo();
        testRepo.save(test);
        resp.sendRedirect("/admin/test.jsp");
    }
}
