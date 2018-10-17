package com.service.impl;

import com.Pojo.MoneyPojo;
import com.google.gson.Gson;
import com.mapper.MoneyManageMapper;
import com.service.MoneyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Service
public class MoneyServiceImpl implements MoneyService {
    private Gson gson = new Gson();
    @Resource
    private MoneyManageMapper moneyManageMapper;
    @Override
    public String showStatistics(HttpServletRequest request) {
        String year = request.getParameter("time");
        ArrayList<MoneyPojo> moneydata = moneyManageMapper.selectStatistics(year);
        return gson.toJson(moneydata);
    }
}
