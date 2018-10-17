package com.service.impl;

import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.CustomerTableMapper;
import com.mapper.GoodsTableMapper;
import com.model.CustomerTable;
import com.model.GoodsTable;
import com.service.CustomerService;
import com.service.GoodsService;
import com.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private GoodsTableMapper goodsTableMapper;
    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        int totalRecords;
        totalRecords = goodsTableMapper.selectBykey(key);
        page = new Page(totalRecords+"",onePage);
        return gson.toJson(page);
    }

    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        String pn = request.getParameter("pn");
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        Map<String,Object> map = PageUtil.pageMap(pn,key,onePage);
        ArrayList<GoodsTable> goodsTables = goodsTableMapper.selectBykeyLimit(map);
        String s = gson.toJson(goodsTables);
        return s;
    }

    @Override
    public String addGood(GoodsTable goodsTable) {
        goodsTable.setGoodsId(UUID.randomUUID().toString());
        goodsTable.setCustomerTime(new Date());
        int insert = goodsTableMapper.insert(goodsTable);
        if (insert > 0) {
            return "yes";
        }
        return "no";
    }

    @Override
    public void beforeEdit(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        GoodsTable goodsTable = goodsTableMapper.selectByPrimaryKey(id);
        request.setAttribute("good",goodsTable);
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, GoodsTable goodsTable) {
        int i = goodsTableMapper.updateByPrimaryKeySelective(goodsTable);
        return i>0?"yes":"no";
    }

    @Override
    public String deleteGood(HttpServletRequest request) {
        String id= request.getParameter("id");
        int i = goodsTableMapper.deleteByPrimaryKey(id);
        return i>0?"yes":"no";
    }
}
