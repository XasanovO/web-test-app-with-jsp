package com.example.exam.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class MyListener implements ServletContextListener {

    public static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        emf = Persistence.createEntityManagerFactory("punit");
        ServletContextListener.super.contextInitialized(sce);
    }
}
