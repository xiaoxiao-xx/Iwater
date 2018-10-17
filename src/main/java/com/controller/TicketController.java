package com.controller;

import com.model.GoodsTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/ticketController")
public class TicketController extends BaseController {

    //获取水票记录分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
       return ticketService.getPage(request,response);
    }

    //修改商品资料
    @RequestMapping(value = "/recharge.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String recharge(HttpServletRequest request, HttpServletResponse response){
        return ticketService.recharge(request,response);
    }

    //获取水票资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return ticketService.showlist(request,response);
    }

}
