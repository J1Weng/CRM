package com.j1weng.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.j1weng.entity.Customer;
import com.j1weng.entity.PageBean;
import com.j1weng.entity.Manager;

import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
                        "classpath:spring/spring-service.xml"})
public class CustomerServiceTest {

    @Autowired
    private CustomerService customerService;

   // @Test
    public void allList() throws Exception{
        PageBean<Customer> pageBean = customerService.allList(0, 8);    // 设置每页8条记录
        System.out.println(pageBean);
    }

    //@Test
    public void getById() throws Exception{
        long id = 1L;
        Customer customer = customerService.getById(id);
        System.out.println(customer);
    }

    //@Test
    public void insert() throws Exception{
        Customer customer = new Customer();
        customer.setName("吕布");
        customer.setGender("男");
        customer.setPhone("15823232333");
        customerService.insert(customer);
    }

    //@Test
    public void delete() throws Exception{
        long id = 7L;
        customerService.delete(id);
    }

    @Test
    public void update() throws Exception{
        long id = 3L;
        Customer customer = customerService.getById(id);
        customer.setDescription("我是小明");
        customerService.update(id,customer);
        System.out.println(customer);
    }

    //@Test
    public void queryList() throws Exception{
        int offset = 0;
        int pageRecord = 8;
        Customer customer = new Customer();
        customer.setName("小");
        PageBean<Customer> pageBean = customerService.queryList(offset, pageRecord, customer);
        System.out.println(pageBean);
    }
    
    //@Test
    public void findManager() throws Exception{
    		String account = "manager";
    		Manager manager = customerService.findManager(account);
    		String ma = manager.getAccount();
    		String psw = manager.getPassword();
    		System.out.println("管理员信息为：" + "账号: "+ ma + "密码: " + psw);
    }
}