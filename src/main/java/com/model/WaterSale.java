package com.model;

import java.util.Date;

public class WaterSale {
    private String waterSaleId;

    private String customerId;

    private String customerNum;

    private String goodsId;

    private String goodsName;

    private Integer saleNum;

    private Double saleMoney;

    private Integer ticketCount;

    private String remarks;

    private String saleStatu;

    private Date saleTime;

    public String getWaterSaleId() {
        return waterSaleId;
    }

    public void setWaterSaleId(String waterSaleId) {
        this.waterSaleId = waterSaleId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerNum() {
        return customerNum;
    }

    public void setCustomerNum(String customerNum) {
        this.customerNum = customerNum;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(Integer saleNum) {
        this.saleNum = saleNum;
    }

    public Double getSaleMoney() {
        return saleMoney;
    }

    public void setSaleMoney(Double saleMoney) {
        this.saleMoney = saleMoney;
    }

    public Integer getTicketCount() {
        return ticketCount;
    }

    public void setTicketCount(Integer ticketCount) {
        this.ticketCount = ticketCount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getSaleStatu() {
        return saleStatu;
    }

    public void setSaleStatu(String saleStatu) {
        this.saleStatu = saleStatu;
    }

    public Date getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(Date saleTime) {
        this.saleTime = saleTime;
    }
}