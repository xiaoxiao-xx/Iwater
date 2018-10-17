package com.service.impl;

import com.Pojo.Page;
import com.google.gson.Gson;
import com.mapper.BucketInOutMapper;
import com.mapper.CustomerGoodsMapper;
import com.mapper.GoodsTableMapper;
import com.mapper.MoneyManageMapper;
import com.model.BucketInOut;
import com.model.CustomerGoods;
import com.model.GoodsTable;
import com.model.MoneyManage;
import com.service.BucketService;
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
@Transactional
public class BucketServiceImpl implements BucketService {
    final String onePage = "10";
    private Page page;
    private Gson gson = new Gson();
    @Resource
    private BucketInOutMapper bucketInOutMapper;
    @Resource
    private MoneyManageMapper moneyManageMapper;
    @Resource
    private GoodsTableMapper goodsTableMapper;
    @Resource
    private CustomerGoodsMapper customerGoodsMapper;
    @Override
    public String getPage(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        int totalRecords=bucketInOutMapper.selectBykey(key);
        page = new Page(totalRecords+"",onePage);
        String s = gson.toJson(page);
        return s;
    }
    @Override
    public String showlist(HttpServletRequest request, HttpServletResponse response) {
        String pn = request.getParameter("pn");
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        Map<String,Object> map = PageUtil.pageMap(pn,key,onePage);
        ArrayList<BucketInOut> bucketInOuts = bucketInOutMapper.selectBykeyLimit(map);
        return gson.toJson(bucketInOuts);
    }
    @Override
    public void beforeEdit(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String customerNum = request.getParameter("num");
        BucketInOut bucketInOut = bucketInOutMapper.selectByCusId(id);
        CustomerGoods customerGoods = customerGoodsMapper.selectByCustomerId(id);
        ArrayList<GoodsTable> goodsTables = goodsTableMapper.selectAllGoods();
        request.setAttribute("goods",goodsTables);
        request.setAttribute("cusg",customerGoods);
        request.setAttribute("buck",bucketInOut);
        request.setAttribute("id",id);
        request.setAttribute("num",customerNum);
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, BucketInOut bucketInOut) {
        //押桶资料修改
        String bucketType = request.getParameter("bucketType");
        String number = request.getParameter("number");
        String remarks = bucketType+"("+number+")";
        bucketInOut.setChangeTime(new Date());
        bucketInOut.setRemarks(remarks);

        //押桶资金记录修改
        MoneyManage moneyManage = new MoneyManage();
        moneyManage.setIncome(bucketInOut.getAccountMoney());
        moneyManage.setRemarks("客户"+bucketInOut.getCustomerNum()+"号押"+remarks);
        moneyManage.setManageTime(new Date());

        if (bucketInOut.getBucketInOutId().equals("")) {
            bucketInOut.setBucketInOutId(UUID.randomUUID().toString());
            moneyManage.setManageId(bucketInOut.getBucketInOutId());
            int insert = bucketInOutMapper.insert(bucketInOut);
            moneyManageMapper.insertSelective(moneyManage);
            return insert>0?"yes":"no";
        } else{
            moneyManage.setManageId(bucketInOut.getBucketInOutId());
            int i = bucketInOutMapper.updateByPrimaryKeySelective(bucketInOut);
            moneyManageMapper.updateByPrimaryKeySelective(moneyManage);
            return i>0?"yes":"no";
        }
    }

    @Override
    public String deleteBucket(HttpServletRequest request) {
        String id= request.getParameter("id");
        int i;
            i = bucketInOutMapper.deleteByPrimaryKey(id);
            if(i<1){
                throw new RuntimeException("don't have any message for bucket");
            }
            MoneyManage moneyManage = moneyManageMapper.selectByPrimaryKey(id);
            if (moneyManage != null) {
                moneyManage.setOutcome(moneyManage.getIncome());
                moneyManage.setIncome(0.0);
                moneyManage.setRemarks(moneyManage.getRemarks().replace('押','退'));
                moneyManage.setManageId(UUID.randomUUID().toString());
                moneyManage.setManageTime(new Date());
                moneyManageMapper.insertSelective(moneyManage);
            }else{
                throw new RuntimeException("null");
            }
        return i>0?"yes":"no";
    }

    @Override
    public String addBucket(BucketInOut bucketInOut) {
        bucketInOut.setChangeTime(new Date());
        bucketInOut.setBucketInOutId(UUID.randomUUID().toString());
        int i = bucketInOutMapper.insertSelective(bucketInOut);
        MoneyManage moneyManage = new MoneyManage();
        moneyManage.setManageId(bucketInOut.getBucketInOutId());
        moneyManage.setIncome(bucketInOut.getAccountMoney());
        moneyManage.setOutcome(0.0);
        moneyManage.setRemarks(bucketInOut.getRemarks());
        moneyManage.setManageTime(new Date());
        moneyManageMapper.insertSelective(moneyManage);
        return i>0?"yes":"no";
    }
}
