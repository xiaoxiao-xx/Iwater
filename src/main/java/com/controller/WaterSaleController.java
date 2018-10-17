package com.controller;

import com.model.CustomerTable;
import com.model.WaterSale;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/waterSaleController")
public class WaterSaleController extends BaseController {
    //获取出货记录分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
        return waterSaleService.getPage(request,response);
    }
    //获取出货资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return waterSaleService.showlist(request,response);
    }

    //修改会员资料前
    @RequestMapping(value = "/before_edit.do")
    public String  beforeEdit(HttpServletRequest request, HttpServletResponse response){
        customerService.beforeEdit(request,response);
        return "/watersale_reload.jsp";
    }

    //修改会员资料
    @RequestMapping(value = "/edit.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response, WaterSale waterSale){
        return waterSaleService.edit(request,response,waterSale);
    }
    //售水支付
    @RequestMapping("/pay.ajax")
    @ResponseBody
    public String pay(HttpServletRequest request,HttpServletResponse response){
        return waterSaleService.pay(request,response);
    }
    //显示售水统计echarts
    @RequestMapping(value = "/showStatistics.ajax",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String showStatistics(HttpServletRequest request){
        return waterSaleService.showStatistics(request);
    }
}
