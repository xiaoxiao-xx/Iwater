package com.model;

import java.util.Date;

public class BuyIn {
    private String buyInId;

    private String goodsId;

    private String goodsName;

    private Integer buyNum;

    private Double buyMoney;

    private Date buyTime;

    public String getBuyInId() {
        return buyInId;
    }

    public void setBuyInId(String buyInId) {
        this.buyInId = buyInId;
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

    public Integer getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(Integer buyNum) {
        this.buyNum = buyNum;
    }

    public Double getBuyMoney() {
        return buyMoney;
    }

    public void setBuyMoney(Double buyMoney) {
        this.buyMoney = buyMoney;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }
}