package com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.FoodDAO;
import com.model.Food;



@Repository("foodDAO")
public class FoodDAOImpl implements FoodDAO 

{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	
	public boolean addFood(Food food) {
		try
		{
		Session session=sessionFactory.getCurrentSession();
		session.save(food);
		return true;
		}
		catch(Exception e)
		{
		return false;
		}
	}

	public List<Food> retrieveFood() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Food");
		List<Food> listFood=query.list();
		session.close();
		return listFood;
	}

	@Transactional
	
	public boolean deleteFood(Food food) {
		try
		{
		Session session=sessionFactory.getCurrentSession();
		session.delete(food);
		return true;
		}
		catch(Exception e)
		{
		System.out.println("Exception Arised:"+e);	
		return false;
		}
	}

	
	public Food getFood(int foodId) {
		Session session=sessionFactory.openSession();
		Food food=(Food)session.get(Food.class,foodId);
		session.close();
		return food;
	}

	@Transactional
	
	public boolean updateFood(Food food) {
		try
		{
		sessionFactory.getCurrentSession().saveOrUpdate(food);
		return true;
		}
		catch(Exception e)
		{
		System.out.println("Exception Arised:"+e);
		return false;
		}
	}

	



	}


	