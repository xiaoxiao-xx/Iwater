package com.Pojo;

public class CusTicket {
    private String customerId;

    private String customerNum;

    private String customerAddr;

    private String customerTel;

    private String waterTicketId;

    private Integer waterTicketCount;

    public CusTicket(String customerId, String customerNum, String customerAddr, String customerTel, String waterTicketId, Integer waterTicketCount) {
        this.customerId = customerId;
        this.customerNum = customerNum;
        this.customerAddr = customerAddr;
        this.customerTel = customerTel;
        this.waterTicketId = waterTicketId;
        this.waterTicketCount = waterTicketCount;
    }

    public CusTicket() {
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

    public String getWaterTicketId() {
        return waterTicketId;
    }

    public void setWaterTicketId(String waterTicketId) {
        this.waterTicketId = waterTicketId;
    }

    public Integer getWaterTicketCount() {
        return waterTicketCount;
    }

    public void setWaterTicketCount(Integer waterTicketCount) {
        this.waterTicketCount = waterTicketCount;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("CusTicket{");
        sb.append("customerId='").append(customerId).append('\'');
        sb.append(", customerNum='").append(customerNum).append('\'');
        sb.append(", customerAddr='").append(customerAddr).append('\'');
        sb.append(", customerTel='").append(customerTel).append('\'');
        sb.append(", waterTicketId='").append(waterTicketId).append('\'');
        sb.append(", waterTicketCount=").append(waterTicketCount);
        sb.append('}');
        return sb.toString();
    }
}

