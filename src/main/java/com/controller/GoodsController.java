package com.controller;

import com.model.CustomerTable;
import com.model.GoodsTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/goodsController")
public class GoodsController extends BaseController {

    //获取商品分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
       return goodsService.getPage(request,response);
    }

    //添加商品
    @RequestMapping("/addGood.ajax")
    @ResponseBody
    public String addGood(HttpServletRequest request, HttpServletResponse response, GoodsTable goodsTable){
       return goodsService.addGood(goodsTable);
    }

    //修改商品资料前
    @RequestMapping(value = "/before_edit.do")
    public String  beforeEdit(HttpServletRequest request, HttpServletResponse response){
        goodsService.beforeEdit(request,response);
       return "/goods_edit.jsp";
    }

    //修改商品资料
    @RequestMapping(value = "/edit.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response, GoodsTable goodsTable){
        return goodsService.edit(request,response,goodsTable);
    }

    //获取商品资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return goodsService.showlist(request,response);
    }
    @RequestMapping("/deleteGood.ajax")
    @ResponseBody
    public String deleteGood(HttpServletRequest request){
        return goodsService.deleteGood(request);
    }
}
