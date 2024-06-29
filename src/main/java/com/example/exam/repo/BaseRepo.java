package com.example.exam.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import static com.example.exam.config.MyListener.emf;

public class BaseRepo<Type, ID> {
    private Class<Type> typeClass;

    public BaseRepo() {
        typeClass = (Class<Type>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }


    public Type save(Type entity) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null; // Or handle the exception accordingly
        } finally {
            entityManager.close();
        }
    }

    public void delete(ID id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Type type = entityManager.find(typeClass, id);
            if (type != null) {
                entityManager.remove(type);
            }
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public Type findById(ID id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Type entity = entityManager.find(typeClass, id);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        throw new RuntimeException("couldn't find entity with id: " + id);
    }

    public void update(Type entity) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Type> findAll() {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery("from " + typeClass.getSimpleName() + " t", typeClass).getResultList();
    }
}
