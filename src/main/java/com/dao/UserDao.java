package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.entities.User;
import java.util.List;

@Component
public class UserDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int save(User user) {
		Integer i = (Integer) this.hibernateTemplate.save(user);
		return i;
	}
	public List<User> getAll() {
		List<User> users = this.hibernateTemplate.loadAll(User.class);
		return users;
	}
}
