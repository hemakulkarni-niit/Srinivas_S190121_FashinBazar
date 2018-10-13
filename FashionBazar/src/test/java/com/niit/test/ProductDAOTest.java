package com.niit.test;

import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.ProductDAO;
import com.niit.model.Product;

public class ProductDAOTest {
	@Autowired
	static ProductDAO productDAO;

	@BeforeClass
	public static void initialize() {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext("DBConfig.class");
		context.scan("com.niit");
		// context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
	}

	@Test
	public void addProductTest() {
		Product product = new Product();
		product.setProductName("Samsung J7");
		product.setProductDesc("A Mobile with 4G and VOLTE option");
		product.setQuantity(10);
		product.setPrice(34000);
		product.setSupplierId(2);
		product.setCategoryId(1);

		assertTrue("Problem in adding Product", productDAO.addProduct(product));
	}

}
