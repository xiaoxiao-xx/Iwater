package com.Pojo;

public class CustomerPojo {
    private String customerId;

    private String customerNum;

    private String customerAddr;

    private String customerTel;

    private String goodsName;

    private Integer waterTicketCount;

    private String customerOtherinfo;

    public CustomerPojo() {
    }

    public CustomerPojo(String customerId, String customerNum, String customerAddr, String customerTel, String goodsName, Integer waterTicketCount, String customerOtherinfo) {
        this.customerId = customerId;
        this.customerNum = customerNum;
        this.customerAddr = customerAddr;
        this.customerTel = customerTel;
        this.goodsName = goodsName;
        this.waterTicketCount = waterTicketCount;
        this.customerOtherinfo = customerOtherinfo;
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

    public String getCustomerAddr() {
        return customerAddr;
    }

    public void setCustomerAddr(String customerAddr) {
        this.customerAddr = customerAddr;
    }

    public String getCustomerTel() {
        return customerTel;
    }

    public void setCustomerTel(String customerTel) {
        this.customerTel = customerTel;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getWaterTicketCount() {
        return waterTicketCount;
    }

    public void setWaterTicketCount(Integer waterTicketCount) {
        this.waterTicketCount = waterTicketCount;
    }

    public String getCustomerOtherinfo() {
        return customerOtherinfo;
    }

    public void setCustomerOtherinfo(String customerOtherinfo) {
        this.customerOtherinfo = customerOtherinfo;
    }
}
