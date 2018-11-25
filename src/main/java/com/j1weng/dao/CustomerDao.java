package com.j1weng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j1weng.entity.Customer;
import com.j1weng.entity.Manager;
/**
 * 客户关系系统dao层编写（增删改查）
 * @author jlweng
 *
 */

public interface CustomerDao {
	
	

	/**
	 * 查找Manager
	 * @param account
	 * @return Manager
	 */
	public Manager findManager(@Param("account") String account );
	
	
	/**
	 * 分页查询客户
	 * @param offset  起始记录
	 * @param pageRecord 每页的记录数
	 * @return
	 */
	
	public List<Customer> findAll(@Param("offset") int offset, @Param("pageRecord")int pageRecord);
	
	/**
	 * 通过id查找客户信息
	 * @param id 
	 * @return
	 * @throws Exception
	 */
	public Customer findById(long id) throws Exception;
	
	/**
	 * 添加客户
	 * @param customer 需要添加的客户信息
	 * @throws Exception
	 */
	public void addCustomer(Customer customer) throws Exception;
	
	/**
	 * 根据客户id来删除对应客户信息
	 * @param id 客户id
	 * @throws Exception
	 */
	public void deleteCustomer(long id) throws Exception;
	
	/**
	 * 修改客户消息
	 * @param id
	 * @param customer
	 */
	public void editCustomer(@Param("id") long id,@Param("customer")Customer customer) throws Exception;
	
	/**
	 * 模糊查询时，返回模糊查询总记录数
	 * @param customer  模糊查询的客户信息
	 * @return
	 * @throws Exception
	 */
	public int countCustomers(@Param("customer")Customer customer ) throws Exception;
	
	/**
	 *  分页并且模糊查询查找所有符合条件的客户信息
	 * @param offset  起始记录
	 * @param pageRecord  每页的记录数
	 * @param customer  模糊查询的客户信息
	 * @return
	 * @throws Exception
	 */
	public List<Customer> queryAll(@Param("offset")int offset,@Param("pageRecord")int pageRecord,@Param("customer")Customer customer) throws Exception;

}
