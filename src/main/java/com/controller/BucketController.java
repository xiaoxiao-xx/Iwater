package com.controller;

import com.model.BucketInOut;
import com.model.GoodsTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/bucketController")
public class BucketController extends BaseController {

    //获取押桶分页数据
    @RequestMapping("/getPage.ajax")
    @ResponseBody
    public String getPage(HttpServletRequest request, HttpServletResponse response){
        return bucketService.getPage(request,response);
    }

    //获取押桶资料
    @RequestMapping(value = "/showlist.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String showlist(HttpServletRequest request, HttpServletResponse response){
        return bucketService.showlist(request,response);
    }

    //修改押桶资料前
    @RequestMapping(value = "/before_edit.do")
    public String  beforeEdit(HttpServletRequest request, HttpServletResponse response){
        bucketService.beforeEdit(request,response);
        return "/bucket_edit.jsp";
    }

    //修改押桶资料
    @RequestMapping(value = "/edit.ajax",produces ="text/html;charset=utf-8")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response, BucketInOut bucketInOut){
        return bucketService.edit(request,response,bucketInOut);
    }

    @RequestMapping("/deleteBucket.ajax")
    @ResponseBody
    public String deleteBucket(HttpServletRequest request){
        return bucketService.deleteBucket(request);
    }

    //添加商品
    @RequestMapping("/addBucket.ajax")
    @ResponseBody
    public String addBucket(HttpServletRequest request, HttpServletResponse response, BucketInOut bucketInOut){
        return bucketService.addBucket(bucketInOut);
    }
}
