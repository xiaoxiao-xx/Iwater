package com.model;

import java.util.Date;

public class GoodsTable {
    private String goodsId;

    private String goodsName;

    private Double goodsOut;

    private Double goodsIn;

    private String goodsSpecs;

    private Date customerTime;

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

    public Double getGoodsOut() {
        return goodsOut;
    }

    public void setGoodsOut(Double goodsOut) {
        this.goodsOut = goodsOut;
    }

    public Double getGoodsIn() {
        return goodsIn;
    }

    public void setGoodsIn(Double goodsIn) {
        this.goodsIn = goodsIn;
    }

    public String getGoodsSpecs() {
        return goodsSpecs;
    }

    public void setGoodsSpecs(String goodsSpecs) {
        this.goodsSpecs = goodsSpecs;
    }

    public Date getCustomerTime() {
        return customerTime;
    }

    public void setCustomerTime(Date customerTime) {
        this.customerTime = customerTime;
    }
}