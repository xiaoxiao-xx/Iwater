package com.service.impl;

import com.ManageException;
import com.Pojo.EchartsPojo;
import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.GoodsTableMapper;
import com.mapper.MoneyManageMapper;
import com.mapper.WaterSaleMapper;
import com.mapper.WaterTicketMapper;
import com.model.GoodsTable;
import com.model.MoneyManage;
import com.model.WaterSale;
import com.model.WaterTicket;
import com.service.WaterSaleService;
import com.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Service
public class WaterSaleServiceImpl implements WaterSaleService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private WaterSaleMapper waterSaleMapper;
    @Resource
    private MoneyManageMapper moneyManageMapper;
    @Resource
    private WaterTicketMapper ticketMapper;
    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        return PageUtil.getP(request,response,waterSaleMapper);
    }
    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        return PageUtil.showL(request,response,waterSaleMapper);
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, WaterSale waterSale) {
        waterSale.setWaterSaleId(UUID.randomUUID().toString());
        waterSale.setSaleTime(new Date());
        int i = waterSaleMapper.insertSelective(waterSale);
        String statu = waterSale.getSaleStatu();
        int ticketCount = waterSale.getTicketCount();
        if(ticketCount>0){
            WaterTicket waterTicket = new WaterTicket();
            waterTicket.setCustomerId(waterSale.getCustomerId());
            waterTicket.setWaterTicketCount(ticketCount);
            int count = ticketMapper.updateByCustomerId(waterTicket);
            if (count==0){
                throw new ManageException("change waterTicker failed");
            }
        } else if (statu.equals("1")){
            MoneyManage moneyManage = new MoneyManage();
            moneyManage.setManageId(UUID.randomUUID().toString());
            moneyManage.setManageTime(new Date());
            moneyManage.setIncome(waterSale.getSaleMoney());
            moneyManage.setRemarks("客户("+waterSale.getCustomerNum()+")购买"+waterSale.getGoodsName()+"("+waterSale.getSaleNum()+")桶");
            int i1 = moneyManageMapper.insertSelective(moneyManage);
            if (i1!=1){
                throw new ManageException("insert buy water moneyManage false");
            }
        }
        return i>0?"yes":"no";
    }

    @Override
    public String pay(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String money = request.getParameter("money");
        String csnum = request.getParameter("csnum");
        String gdname = request.getParameter("gdname");
        String count = request.getParameter("count");
        //修改支付状态
        WaterSale waterSale = new WaterSale();
        waterSale.setWaterSaleId(id);
        waterSale.setSaleStatu("1");
        int i = waterSaleMapper.updateByPrimaryKeySelective(waterSale);

        MoneyManage moneyManage = new MoneyManage();
        moneyManage.setManageId(UUID.randomUUID().toString());
        moneyManage.setIncome(Double.parseDouble(money));
        moneyManage.setManageTime(new Date());
        moneyManage.setRemarks("客户("+csnum+")购买"+gdname+"("+count+")桶");
        int i1 = moneyManageMapper.insertSelective(moneyManage);
        if (i1==0){
            throw  new ManageException("money record insert failed");
        }
        return i>0?"yes":"no";
    }

    @Override
    public String  showStatistics(HttpServletRequest request) {
        String time = request.getParameter("time");
        if(time == " "){
            time = "no";
        }
        ArrayList<EchartsPojo> data = waterSaleMapper.selectStatistics(time);
        return gson.toJson(data);
    }
}
