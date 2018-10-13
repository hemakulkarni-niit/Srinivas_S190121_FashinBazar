package com.niit.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.niit.model.User;

public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean registerUser(User user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean modifyUser(User user) {
		try {
			sessionFactory.getCurrentSession().update(user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public User getUser(String username) {
		Session session = sessionFactory.openSession();
		User user = session.get(User.class, username);
		session.close();
		return user;
	}

}
