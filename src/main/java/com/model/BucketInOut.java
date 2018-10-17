package com.model;

import java.util.Date;

public class BucketInOut {
    private String bucketInOutId;

    private String customerId;

    private String customerNum;

    private String remarks;

    private Double accountMoney;

    private Date changeTime;

    public String getBucketInOutId() {
        return bucketInOutId;
    }

    public void setBucketInOutId(String bucketInOutId) {
        this.bucketInOutId = bucketInOutId;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Double getAccountMoney() {
        return accountMoney;
    }

    public void setAccountMoney(Double accountMoney) {
        this.accountMoney = accountMoney;
    }

    public Date getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Date changeTime) {
        this.changeTime = changeTime;
    }
}