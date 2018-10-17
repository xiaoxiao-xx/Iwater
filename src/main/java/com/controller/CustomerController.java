package com.controller;

import com.model.CustomerTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/customerController")
public class CustomerController extends BaseController {

    //获取会员分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
       return customerService.getPage(request,response);
    }
    //获取编号
    @RequestMapping(value = "/getLastNum.ajax",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getLastNum(HttpServletRequest request, HttpServletResponse response){
       return customerService.getLastNum(request,response);
    }
    //添加会员
    @RequestMapping("/addCustomer.ajax")
    @ResponseBody
    public String addCustomer(HttpServletRequest request, HttpServletResponse response, CustomerTable customerTable){
       return customerService.addCustomer(request,customerTable);
    }

    //修改会员资料前
    @RequestMapping(value = "/before_edit.do")
    public String  beforeEdit(HttpServletRequest request, HttpServletResponse response){
       customerService.beforeEdit(request,response);
       return "/customer_edit.jsp";
    }

    //修改会员资料
    @RequestMapping(value = "/edit.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response,CustomerTable customerTable){
        return customerService.edit(request,response,customerTable);
    }

    //获取会员资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return customerService.showlist(request,response);
    }
    @RequestMapping("/deleteCustomer.ajax")
    @ResponseBody
    public String deleteCustomer(HttpServletRequest request){
        return customerService.deleteCustomer(request);
    }

    @RequestMapping("/getCustomerId.ajax")
    @ResponseBody
    public String getCustomerId(HttpServletRequest request){
        return customerService.getCustomerId(request);
    }

}
