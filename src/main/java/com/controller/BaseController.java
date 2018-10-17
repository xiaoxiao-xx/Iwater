package com.controller;

import com.model.MoneyManage;
import com.service.*;

import javax.annotation.Resource;

public class BaseController {
    @Resource
    protected UserService userService;
    @Resource
    protected CustomerService customerService;
    @Resource
    protected GoodsService goodsService;
    @Resource
    protected BucketService bucketService;
    @Resource
    protected TicketService ticketService;
    @Resource
    protected WaterSaleService waterSaleService;
    @Resource
    protected BuyInService buyInService;
    @Resource
    protected MoneyService moneyService;
}
