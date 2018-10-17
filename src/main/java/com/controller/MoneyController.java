package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/moneyController")
public class MoneyController extends BaseController{
    @RequestMapping("/showStatistics.ajax")
    @ResponseBody
    public String showStatistics(HttpServletRequest request){

        return moneyService.showStatistics(request);
    }
}
