package com.niit.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.niit.model.CartItem;
import com.niit.model.Category;
import com.niit.model.OrderDetail;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.niit")
@EnableWebMvc
public class DBConfig {
	@Bean(name = "dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:~/s190121");
		dataSource.setUsername("dteja");
		dataSource.setPassword("dteja");
		return dataSource;
	}

	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory() {
		Properties hibernateProperties = new Properties();
		hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");

		LocalSessionFactoryBuilder localsessionFactory = new LocalSessionFactoryBuilder(getH2DataSource());
		localsessionFactory.addProperties(hibernateProperties);

		localsessionFactory.addAnnotatedClass(Category.class);
		localsessionFactory.addAnnotatedClass(Product.class);
		localsessionFactory.addAnnotatedClass(Supplier.class);
		localsessionFactory.addAnnotatedClass(User.class);
		localsessionFactory.addAnnotatedClass(CartItem.class);
		localsessionFactory.addAnnotatedClass(OrderDetail.class);

		SessionFactory sessionFactory = localsessionFactory.buildSessionFactory();

		return sessionFactory;
	}

	@Bean(name = "txManager")
	public HibernateTransactionManager getHibernateTransactionmanager(SessionFactory sessionFactory) {
		return new HibernateTransactionManager(sessionFactory);
	}
}