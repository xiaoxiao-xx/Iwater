package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("userController")
public class UserController extends BaseController {

    @RequestMapping("login.ajax")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response){
        return userService.login(request,response);
    }

    @RequestMapping("checkSave.ajax")
    @ResponseBody
    public String checkSave(HttpServletRequest request, HttpServletResponse response){
        return userService.checkSave(request,response);
    }

    @RequestMapping("forgetsave.ajax")
    @ResponseBody
    public String forgetsave(HttpServletRequest request, HttpServletResponse response){
        userService.forgetsave(request,response);
        return "SUCCESS";
    }

    //退出登录
    @RequestMapping("logout.do")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        request.getSession().invalidate();
        forgetsave(request, response);
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/search.ajax",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String search(HttpServletRequest request,HttpServletResponse response){
        return userService.search(request);
    }
}
