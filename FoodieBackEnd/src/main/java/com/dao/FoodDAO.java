package com.dao;

import java.util.List;

import com.model.Food;

public interface FoodDAO {
	
	
	public boolean addFood(Food food);

	public boolean updateFood(Food food);

	public List<Food> retrieveFood();

	public Food getFood(int foodId);

	public boolean deleteFood(Food food);
	

}