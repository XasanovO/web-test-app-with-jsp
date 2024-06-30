package com.example.exam.servlets.question;

import com.example.exam.entity.Question;
import com.example.exam.repo.QuestionRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;


@WebServlet(value = "/image")
public class QuestionImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        QuestionRepo questionRepo = new QuestionRepo();
        Question question = questionRepo.findById(Integer.parseInt(id));


        byte[] imageData = question.getImage(); // Bu funksiya sizning ma'lumotlar bazangizdan rasmning byte massivini olishi kerak

        // HTTP yanvara joylashgan rasmlar uchun response headerlari
        resp.setContentType("image/jpeg"); // Rasmingizning turi mavjud bo'lgan turi boyicha o'zgartiring
        resp.setContentLength(imageData.length);

        // Rasm byte massivini chiqarish
        OutputStream outputStream = resp.getOutputStream();
        outputStream.write(imageData);
        outputStream.close();
    }
}
