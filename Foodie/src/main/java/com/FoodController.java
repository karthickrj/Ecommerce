package com;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.FoodDAO;
import com.model.Food;
import com.dao.CategoryDAO;
import com.dao.SupplierDAO;
import com.dao.UserDAO;

@Controller
public class FoodController {
	
	@Autowired
	FoodDAO foodDAO;
	@Autowired
	CategoryDAO CategoryDAO;
	@Autowired
	SupplierDAO SupplierDAO;
	@Autowired
	UserDAO UserDAO;
	

	
	@RequestMapping(value="InsertFood",method=RequestMethod.POST)
	public String insertFood(@ModelAttribute("Food")Food food,@RequestParam("pimage")MultipartFile fileDetail,Model m)
	{
		foodDAO.addFood(food);
				
		String path="E:\\Ecommerce\\Foodie\\src\\main\\webapp\\resources\\images\\";
		String totalFileWithPath=path+String.valueOf(food.getFoodId())+".jpg";
		
		File foodImage = new File(totalFileWithPath);
		
		
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[]= fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(foodImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error",e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error","Problem in file Uploading");
		}
		
		Food food1= new Food();
		m.addAttribute(food1);
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "Food";
	}
	
	@RequestMapping(value="food",method=RequestMethod.GET)
	public String showFood(Model m)
	{
		Food food=new Food();
		m.addAttribute(food);
		
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "Food";
	}
	
    @RequestMapping(value="updateFood/{foodId}",method=RequestMethod.GET)
	public String updateFood(@PathVariable("foodId") int foodId,Model m)
	{
		Food food=foodDAO.getFood(foodId);
		m.addAttribute(food);
		
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "UpdateFood";
	}
    
	@RequestMapping(value="UpdateFood",method=RequestMethod.POST)
	public String updateMyFood(@ModelAttribute("food")Food food,Model m)
	{
		foodDAO.updateFood(food);
		Food food1= new Food();
		m.addAttribute(food1);
		
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "Food";
	}
	@RequestMapping(value="deleteFood/{foodId}",method=RequestMethod.GET)
	public String deleteFood(@PathVariable("foodId")int foodId,Model m)
	{
		Food food=foodDAO.getFood(foodId);
		foodDAO.deleteFood(food);
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "Food";
	}
	@RequestMapping(value="userList")
	public String showUserList(Model m)
	{
		
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "UserList";
	}
	@ModelAttribute
	public void fetchData(Model m)
	{
		m.addAttribute("categoryList",CategoryDAO.retrieveCategory());
		m.addAttribute("supegoryList",SupplierDAO.retrieveSupplier());
	}
	@ModelAttribute
	public void addAttributes(Model m)
	{
		m.addAttribute("categoryList",CategoryDAO.retrieveCategory());
		m.addAttribute("supplierList",SupplierDAO.retrieveSupplier());
		m.addAttribute("userList",UserDAO.retrieveUser());
	}
	@RequestMapping(value="order")	
	public String showOrder(Model m)
	{
		List<Food> listFood=foodDAO.retrieveFood();
		m.addAttribute("foodList",listFood);
		return "Order";
	}

	
	
	@RequestMapping(value="order/{foodId}", method=RequestMethod.POST)
	public String showOrder(@PathVariable("foodId")int foodId,Model m)
	{
		Food food= foodDAO.getFood(foodId);
		m.addAttribute("product",food);
		return "Order";
	}
	
	

	}
