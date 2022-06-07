package com.demo.model;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author PC
 *
 */
public class HiberConnection {
 private static SessionFactory sessionFactory;

 public static SessionFactory getSessionFactory() {
  if (sessionFactory == null) {
   try {
    Configuration configuration = new Configuration();

    // Hibernate settings equivalent to hibernate.cfg.xml's properties
    Properties settings = new Properties();
    settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
    settings.put(Environment.URL, "jdbc:mysql://localhost:3306/phonestorage");
    settings.put(Environment.USER, "root");
    settings.put(Environment.PASS, "");
    settings.put(Environment.SHOW_SQL, "true");

    configuration.setProperties(settings);
    configuration.addAnnotatedClass(SanPhamDTO.class);
    configuration.addAnnotatedClass(TypeDTO.class);

    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
      .applySettings(configuration.getProperties()).build();
    System.out.println("Hibernate Java Config serviceRegistry created");
    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
    return sessionFactory;

   } catch (Exception e) {
    e.printStackTrace();
   }
  }
  return sessionFactory;
 }
}

