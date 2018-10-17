package com.controller;

import com.model.BuyIn;
import com.model.GoodsTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/buyInController")
public class BuyInController extends BaseController {

    //获取出货记录分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
        return buyInService.getPage(request,response);
    }

    //获取出货资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return buyInService.showlist(request,response);
    }
    //获取出货记录分页数据

    @RequestMapping("/beforeAdd.do")
    public String beforeAdd(HttpServletRequest request, HttpServletResponse response){
        buyInService.beforeAdd(request,response);
        return "/buy_in_add.jsp";
    }
    @RequestMapping("/addBuyRecord.ajax")
    @ResponseBody
    public String addBuyRecord(HttpServletRequest request, HttpServletResponse response, BuyIn buyIn){
        return buyInService.addBuyRecord(request,response,buyIn);
    }
    //修改商品资料前
    @RequestMapping(value = "/before_edit.do")
    public String  beforeEdit(HttpServletRequest request, HttpServletResponse response){
        buyInService.beforeEdit(request,response);
        return "/buy_in_edit.jsp";
    }

    //修改商品资料
    @RequestMapping(value = "/edit.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response,BuyIn buyIn){
        return buyInService.edit(request,response,buyIn);
    }
    //显示进货统计echarts
    @RequestMapping(value = "/showStatistics.ajax",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String showStatistics(HttpServletRequest request){
        return buyInService.showStatistics(request);
    }


}
