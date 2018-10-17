package com.service.impl;

import com.ManageException;
import com.Pojo.EchartsPojo;
import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.*;
import com.model.BuyIn;
import com.model.GoodsTable;
import com.model.MoneyManage;
import com.model.WaterSale;
import com.service.BuyInService;
import com.util.BaseMapper;
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
public class BuyInServiceImpl implements BuyInService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private BuyInMapper buyInMapper;
    @Resource
    private MoneyManageMapper moneyManageMapper;
    @Resource
    private GoodsTableMapper goodsTableMapper;

    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        return PageUtil.getP(request, response, buyInMapper);
    }

    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        return PageUtil.showL(request,response,buyInMapper);
    }

    @Override
    public void beforeAdd(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<GoodsTable> goodsTables = goodsTableMapper.selectAllGoods();
        request.setAttribute("goods",goodsTables);
    }

    @Override
    public String addBuyRecord(HttpServletRequest request, HttpServletResponse response,BuyIn buyIn) {
        String goodsId = request.getParameter("goodsId");
        String goodsName = request.getParameter("goodsName");
        String buyNum = request.getParameter("buyNum");
        String buyMoney = request.getParameter("buyMoney");

        buyIn.setBuyInId(UUID.randomUUID().toString());
        buyIn.setBuyTime(new Date());
        int i = buyInMapper.insertSelective(buyIn);

        MoneyManage moneyManage = new MoneyManage();
        moneyManage.setManageId(UUID.randomUUID().toString());
        moneyManage.setManageTime(new Date());
        moneyManage.setOutcome(buyIn.getBuyMoney());
        moneyManage.setRemarks("购进"+goodsName+"("+buyNum+")桶");
        int i1 = moneyManageMapper.insertSelective(moneyManage);
        if (i1==0){
            throw  new ManageException("insert message for buy_in failed");
        }
        return i>0?"yes":"no";
    }

    @Override
    public void beforeEdit(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        BuyIn buyIn = buyInMapper.selectByPrimaryKey(id);
        request.setAttribute("buyIn",buyIn);
        ArrayList<GoodsTable> goodsTables = goodsTableMapper.selectAllGoods();
        request.setAttribute("goods",goodsTables);
        request.setAttribute("id",id);
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, BuyIn buyIn) {
        int i = buyInMapper.updateByPrimaryKeySelective(buyIn);
        return i>0?"yes":"no";
    }

    @Override
    public String showStatistics(HttpServletRequest request) {
        String time = request.getParameter("time");
        if(time == " "){
            time = "no";
        }
        ArrayList<EchartsPojo> data = buyInMapper.selectStatistics(time);
        return gson.toJson(data);
    }
}
