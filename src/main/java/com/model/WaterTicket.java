package com.model;

public class WaterTicket {
    private String waterTicketId;

    private String customerId;

    private String customerNum;

    private Integer waterTicketCount;

    public String getWaterTicketId() {
        return waterTicketId;
    }

    public void setWaterTicketId(String waterTicketId) {
        this.waterTicketId = waterTicketId;
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

    public Integer getWaterTicketCount() {
        return waterTicketCount;
    }

    public void setWaterTicketCount(Integer waterTicketCount) {
        this.waterTicketCount = waterTicketCount;
    }
}