package com.service.impl;

import com.ManageException;
import com.Pojo.CusTicket;
import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.MoneyManageMapper;
import com.mapper.WaterTicketMapper;
import com.model.MoneyManage;
import com.model.WaterTicket;
import com.service.TicketService;
import com.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Service
public class TicketServiceImpl implements TicketService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private WaterTicketMapper ticketMapper;
    @Resource
    private MoneyManageMapper moneyManageMapper;

    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        int totalRecords;
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        totalRecords = ticketMapper.selectBykey(key);
        page = new Page(totalRecords+"",onePage);
        return gson.toJson(page);
    }
    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        String pn = request.getParameter("pn");
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        Map<String,Object> map = PageUtil.pageMap(pn,key,onePage);
        ArrayList<CusTicket> tickets = ticketMapper.selectBykeyLimit(map);
        String s = gson.toJson(tickets);
        return s;
    }

    @Override
    @Transactional
    public String recharge(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String num = request.getParameter("num");
        String ticket = request.getParameter("ticket");
        String money = request.getParameter("money");
        int count = Integer.parseInt(ticket);
        WaterTicket waterTicket = new WaterTicket();
        waterTicket.setWaterTicketId(id);
        waterTicket.setWaterTicketCount(count);
        int i = ticketMapper.rechargeTicket(waterTicket);
        if (count>0){
            MoneyManage manage = new MoneyManage();
            manage.setManageId(UUID.randomUUID().toString());
            manage.setIncome(Double.parseDouble(money));
            manage.setOutcome(0.0);
            manage.setRemarks("客户("+num+")充值水票("+ticket+")张");
            manage.setManageTime(new Date());
            int i1 = moneyManageMapper.insertSelective(manage);
            if (i1==0){
                throw new ManageException("moneyManage not insert");
            }
        }
        return i>0?"yes":"no";
    }
}
