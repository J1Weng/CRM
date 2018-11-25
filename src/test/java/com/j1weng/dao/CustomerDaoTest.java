package com.j1weng.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.j1weng.PapaTest;
import com.j1weng.entity.Customer;

public class CustomerDaoTest extends  PapaTest{
	@Autowired
	private CustomerDao customerDao;
	
	//@Test
	public void findAll(){
		int offset=0;
		int pageRecord=10;
		List<Customer> customerList;
		customerList=customerDao.findAll(offset, pageRecord);
		for(Customer c:customerList) {
			System.out.println(c);
		}
	}
	//@Test
	public void findById() throws Exception {
		long id=3l;
		Customer customer=customerDao.findById(id);
		System.out.println(customer);
	}
	@Test
	public void addCustomer() throws Exception {
		Customer customer=new Customer();
		customer.setName("小蓝");
		customer.setGender("男");
		customer.setPhone("12345677890");
		customer.setEmail(null);
		customer.setDescription(null);
		customerDao.addCustomer(customer);
		System.out.println("添加成功");
	}
	//@Test
	public void deleteCustomer() throws Exception {
		long id=10l;
		customerDao.deleteCustomer(id);
	}
	
	//@Test
	public void editCustomer() throws Exception {
		long id=1l;
		Customer customer=customerDao.findById(id);
		System.out.println("修改之前"+customer);
		customer.setGender("女");
		customerDao.editCustomer(id, customer);
		customer= customerDao.findById(id);
		System.out.println("修改之后"+customer);
	}
	//@Test
	public void countCustomers() throws Exception {
		Customer customer=new Customer();
		customer.setGender("女");
		int count=customerDao.countCustomers(customer);
		System.out.println("女生有"+count+"个");
	}
	//@Test
	public void queryAll() throws Exception {
		Customer customer=new Customer();
		customer.setGender("女");
		int offset=0;
		int pageRecord=10;
		List<Customer> customerList=customerDao.queryAll(offset, pageRecord, customer);
		for(Customer c:customerList) {
			System.out.println(c);
		}
	}
	}
