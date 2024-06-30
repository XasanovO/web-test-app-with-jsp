package com.example.exam.servlets.auth;

import com.example.exam.entity.User;
import com.example.exam.repo.UserRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value = "/auth/login")
public class LoginUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserRepo userRepo = new UserRepo();
        HttpSession session = req.getSession();
        User user = userRepo.findByEmailAndPassword(email, password);
        System.out.println(user);
        if (user != null) {
            session.setAttribute("user", user);
            resp.sendRedirect("/");
            return;
        }
        resp.sendRedirect("/auth/login.jsp");
    }
}
