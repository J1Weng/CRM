package com.j1weng.service;

import com.j1weng.entity.Customer;
import com.j1weng.entity.PageBean;
import com.j1weng.entity.Manager;
/**
 * 
 * @author jlweng
 *
 */
public interface CustomerService {
	

	public Manager findManager(String account);
	
	/**
	 * 分页查询
	 * @param offset
	 * @param pageRecord
	 * @return
	 * @throws Exception
	 */
	public PageBean<Customer> allList(int offset,int pageRecord) throws Exception;
	
	/**
	 * 根据id查找客户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Customer getById(long id) throws Exception;
	
	/**
	 * 添加客户信息
	 * @param customer
	 * @throws Exception
	 */
	public void insert(Customer customer) throws Exception;
	
	/**
	 * 根据客户id删除客户信息
	 * @param id
	 * @throws Exception
	 */
	public void delete(long id) throws Exception;
	
	/**
	 * 根据id修改客户信息
	 * @param id
	 * @param customer
	 * @throws Exception
	 */
	public void update(long id,Customer customer) throws Exception;
	
	/**
	 * 模糊查询分页表示
	 * @param offset
	 * @param pageRecord
	 * @param customer
	 * @return
	 * @throws Exception
	 */
	public PageBean<Customer> queryList(int offset,int pageRecord,Customer customer) throws Exception;

}
