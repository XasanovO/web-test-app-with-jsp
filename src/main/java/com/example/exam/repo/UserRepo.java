package com.example.exam.repo;

import com.example.exam.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import static com.example.exam.config.MyListener.emf;

public class UserRepo extends BaseRepo<User, Integer> {
    public User findByEmailAndPassword(String email, String password) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            User user = entityManager.createQuery("from User where email = :email and password = :password", User.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
            transaction.commit();
            return user;
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        return null;
    }
}
