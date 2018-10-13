package com.niit.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CategoryDAO;
import com.niit.model.Category;

public class CategoryDAOTest 
{

	static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
	}
	@Ignore
	@Test
	public void addCategoryTest()
	{
		Category category=new Category();
		category.setCategoryName("LGMobile");
		category.setCategoryDesc("All the LG Category Mobile");
		assertTrue("Problem in Adding Category:",categoryDAO.addCategory(category));
	}
	@Ignore
	@Test
	public void updateCategoryTest()
	{
		Category category=categoryDAO.getCategory(3);
		category.setCategoryDesc("All the Xiomi Mobile with Smart Feature");
		assertTrue("Probem in Updating the Category",categoryDAO.updateCategory(category));
	}
	@Ignore
	@Test
	public void deleteCategoryTest()
	{
		Category category=categoryDAO.getCategory(4);
		assertTrue("Probem in deleting the Category",categoryDAO.deleteCategory(category));
	}
	
	@Test
	public void listCategoriesTest()
	{
		List<Category> listCategories=categoryDAO.listCategories();
		assertNotNull("Problem in Listing Categories",listCategories);
		
		for(Category category:listCategories)
		{
			System.out.print(category.getCategoryId()+":::");
			System.out.print(category.getCategoryName()+":::");
			System.out.println(category.getCategoryDesc());
		}
	}

}
