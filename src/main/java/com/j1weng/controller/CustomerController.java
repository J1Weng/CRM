package com.j1weng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.j1weng.entity.Customer;
import com.j1weng.entity.PageBean;
import com.j1weng.service.CustomerService;
import com.j1weng.entity.Manager;

/**
 * 
 * @author jlweng
 *
 */
@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	private Customer myCustomer;  //用于保存模糊查询的客户
	
	
	// 这里设置了只能使用get方法传递url
    @RequestMapping(value = "/frame", method = RequestMethod.GET)
	public String mainFrame() {
		return "frame";
	}
    
    @RequestMapping(value = "/validateLogin", method = RequestMethod.POST)
    public String validateLogin(Manager manager , Model model) throws Exception{
    	 	String inputAccount = manager.getAccount();
    		String inputPassword = manager.getPassword();
    	 	Manager dbManager = customerService.findManager(inputAccount);
    	 	if(dbManager == null) {
    	 		model.addAttribute("result", "账号信息错误");
    	 		model.addAttribute("brs", false);
    	 		return "redirect:login";
    	 	}
    	 	else if(dbManager.getPassword().equals(inputPassword) == false ){
    	 		model.addAttribute("result","密码错误");
    	 		model.addAttribute("brs", false);
    	 		return "redirect:login";
    	 	}else {
    	 		return "redirect:frame";
    	 	}
    		
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String logIn(){
        // 显示主界面
        return "login";
    }
    @RequestMapping(value = "/allCustomerList/{pageNum}", method = RequestMethod.GET)
	public String allCustomerList(@PathVariable("pageNum") Integer pageNum ,Model model) throws Exception{
		if(pageNum==null) {
			pageNum=1;
		}
		int pageRecord=8;
		PageBean<Customer> pb=customerService.allList((pageNum-1)*pageRecord, pageRecord);
		myCustomer=new Customer();
		model.addAttribute("pb",pb);
		return "list";
	}
    @RequestMapping(value = "/add",method = RequestMethod.GET)
	public String addCustomer() throws Exception{
		return "add";
	}
    
    @RequestMapping(value = "/addCustomerSubmit",method = RequestMethod.POST)
	public String addCustomerSuccess(Customer customer) throws Exception{
		customerService.insert(customer);
		return "redirect:allCustomerList/1";
	}
    
    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
	public String editCustomer(@PathVariable("id") Long id,Model model) throws Exception{
		Customer customer=customerService.getById(id);
		model.addAttribute("customer",customer);
		return "edit";
	}
    @RequestMapping(value = "/editCustomerSubmit",method = RequestMethod.POST)
	public String editCustomerSubmit(@Param("id") Long id,@Param("customer") Customer customer) throws Exception{
		customerService.update(id, customer);
		return "redirect:allCustomerList/1";
	}
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
	public void deleteCustomer(@PathVariable("id") Long id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		customerService.delete(id); //删除客户信息
		String url=request.getRequestURI().toString();  //获取当前请求的url
		String newUrl=url.substring(0,url.lastIndexOf("delete"))+"allCustomerList/1";  //重新拼接url
		response.sendRedirect(newUrl);  //重定向到客户列表第一页
	}
    
    
    @RequestMapping(value = "/query",method = RequestMethod.GET)
	public String queryList() {
		return "query";
	}
    
    // 由于模糊查询需要使用post提交表单，这里设置了可以使用get和post方法传递url
    @RequestMapping(value = "/list/{pageNum}", method = {RequestMethod.GET, RequestMethod.POST})
    public String queryCustomerList(@PathVariable("pageNum") Integer pageNum,Customer customer, Model model) throws Exception{
        // 获取从前端传过来的当前页数，并进行分页操作，显示列表，具有模糊查询的功能
        if(pageNum == null){
            pageNum = 1;                 // 空则当前页面设置为1
        }
        int pageRecord = 8;             // 设置每页记录数为8
        if(!customer.isNull()){         // 如果模糊查询中有设置查询信息，则将信息保存到myCustomer对象中
            myCustomer = customer;
        }
        PageBean<Customer> pb = customerService.queryList((pageNum-1)*pageRecord, pageRecord,myCustomer);
        model.addAttribute("pb",pb);

        return "list";
    }


	
}
