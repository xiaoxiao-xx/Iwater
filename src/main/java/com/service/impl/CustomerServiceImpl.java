package com.service.impl;

import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.*;
import com.model.*;
import com.service.CustomerService;
import com.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Service
public class CustomerServiceImpl implements CustomerService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private CustomerTableMapper customerTableMapper;
    @Resource
    private GoodsTableMapper goodsTableMapper;
    @Resource
    private CustomerGoodsMapper customerGoodsMapper;
    @Resource
    private BucketInOutMapper bucketInOutMapper;
    @Resource
    private MoneyManageMapper moneyManageMapper;
    @Resource
    private WaterTicketMapper ticketMapper;
    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        int totalRecords=customerTableMapper.selectBykey(key);
        page = new Page(totalRecords+"",onePage);
        return gson.toJson(page);
    }

    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        String pn = request.getParameter("pn");
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        Map<String,Object> map = PageUtil.pageMap(pn,key,onePage);
        ArrayList<CustomerTable> customerLists = customerTableMapper.selectBykeyLimit(map);
        String s = gson.toJson(customerLists);
        return s;
    }

    @Override
    public String getLastNum(HttpServletRequest request, HttpServletResponse response) {
        String num = customerTableMapper.getLastNum();
        ArrayList<GoodsTable> goodsTables = goodsTableMapper.selectAllGoods();
        HashMap<String,Object> map = new HashMap<>();
        map.put("num",num);
        map.put("goods",goodsTables);
        return gson.toJson(map);
    }

    @Override
    public String addCustomer(HttpServletRequest request, CustomerTable customerTable) {
        String goodsId = request.getParameter("goodsId");
        customerTable.setCustomerId(UUID.randomUUID().toString());
        customerTable.setCustomerTime(new Date());
        customerTable.setCustomerStatu("活跃");
        String customerId = customerTable.getCustomerId();
        CustomerGoods customerGoods = new CustomerGoods();
        customerGoods.setCustomerGoodsId(UUID.randomUUID().toString());
        customerGoods.setCustomerId(customerId);
        customerGoods.setGoodsId(goodsId);
        int insert = customerTableMapper.insert(customerTable);
        int i = customerGoodsMapper.insertSelective(customerGoods);
        //添加默认押桶信息
        //String goodsName = request.getParameter("goodsName");
        //BucketInOut bucket = new BucketInOut();
        //bucket.setBucketInOutId(UUID.randomUUID().toString());
        //bucket.setCustomerId(customerId);
        //bucket.setCustomerNum(customerTable.getCustomerNum());
        //bucket.setAccountMoney(40.0);
        //bucket.setRemarks(goodsName);
        //bucket.setChangeTime(new Date());
        //bucketInOutMapper.insertSelective(bucket);

        //押桶资金记录
        //MoneyManage moneyManage = new MoneyManage();
        //moneyManage.setManageId(bucket.getBucketInOutId());
        //moneyManage.setIncome(bucket.getAccountMoney());
        //moneyManage.setOutcome(0.0);
        //String remarks = "客户"+customerTable.getCustomerNum()+"号押"+goodsName+"一个";
        //moneyManage.setRemarks(remarks);
        //moneyManage.setManageTime(new Date());
        //moneyManageMapper.insertSelective(moneyManage);

        //客户水票记录初始化
        WaterTicket waterTicket = new WaterTicket();
        waterTicket.setWaterTicketId(UUID.randomUUID().toString());
        waterTicket.setCustomerId(customerTable.getCustomerId());
        waterTicket.setCustomerNum(customerTable.getCustomerNum());
        waterTicket.setWaterTicketCount(0);
        ticketMapper.insertSelective(waterTicket);
        if (insert > 0 && i > 0) {
            return "yes";
        }
        return "no";
    }

    @Override
    public void beforeEdit(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        CustomerTable customerTable = customerTableMapper.selectByPrimaryKey(id);
        CustomerGoods cusg =customerGoodsMapper.selectByCustomerId(id);
        if (cusg!=null){
            request.setAttribute("cg",cusg.getGoodsId());
        }else{
            request.setAttribute("cg","not");
        }
        request.setAttribute("cus",customerTable);
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, CustomerTable customerTable) {
        int i = customerTableMapper.updateByPrimaryKeySelective(customerTable);
        String oldId = request.getParameter("oldId");
        String goodsId = request.getParameter("goodsId");
        CustomerGoods customerGoods = new CustomerGoods();
        if(oldId.equals("changed")) {
            customerGoods.setGoodsId(goodsId);
            customerGoods.setCustomerId(customerTable.getCustomerId());
            int j = customerGoodsMapper.updateByCustomerId(customerGoods);
        }
        if(oldId.equals("new")){
            customerGoods.setGoodsId(goodsId);
            customerGoods.setCustomerId(customerTable.getCustomerId());
            customerGoods.setCustomerGoodsId(UUID.randomUUID().toString());
            int i1 = customerGoodsMapper.insertSelective(customerGoods);
        }
        return i>0?"yes":"no";
    }

    @Override
    public String deleteCustomer(HttpServletRequest request) {
        String id= request.getParameter("id");
        int i = customerTableMapper.deleteByPrimaryKey(id);
        return i>0?"yes":"no";
    }

    @Override
    public String getCustomerId(HttpServletRequest request) {
        CustomerTable customer = customerTableMapper.selectByNum(request.getParameter("num"));
        if (customer != null) {
            return gson.toJson(customer);
        }
        return "888888";
    }
}
