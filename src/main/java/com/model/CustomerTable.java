package com.model;

import java.util.Date;

public class CustomerTable {
    private String customerId;

    private String customerNum;

    private String customerAddr;

    private String customerTel;

    private String customerStatu;

    private String customerOtherinfo;

    private Date customerTime;

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

    public String getCustomerStatu() {
        return customerStatu;
    }

    public void setCustomerStatu(String customerStatu) {
        this.customerStatu = customerStatu;
    }

    public String getCustomerOtherinfo() {
        return customerOtherinfo;
    }

    public void setCustomerOtherinfo(String customerOtherinfo) {
        this.customerOtherinfo = customerOtherinfo;
    }

    public Date getCustomerTime() {
        return customerTime;
    }

    public void setCustomerTime(Date customerTime) {
        this.customerTime = customerTime;
    }
}