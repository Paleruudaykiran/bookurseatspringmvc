package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Bus;

@Component
public class BusDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public Bus getById(int id) {
		return  this.hibernateTemplate.get(Bus.class, id);
	}
	@Transactional
	public void update(Bus bus) {
		this.hibernateTemplate.update(bus);
	}
	@Transactional
	public int save(Bus bus) {
		Integer i = (Integer) this.hibernateTemplate.save(bus);
		return i;
	}
	public List<Bus> getAll() {
		List<Bus> buses = this.hibernateTemplate.loadAll(Bus.class);
		return buses;
	}
	@Transactional
	public void deleteById(int id) {
		this.hibernateTemplate.delete(this.hibernateTemplate.get(Bus.class, id));
	}
}
