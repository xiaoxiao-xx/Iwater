package com.Pojo;

public class Page {
    //总页数
    private String total;
    //总数据条数
    private String totalRecords;
    //每页数据条数
    private String onePage;

    public Page(String totalRecords, String onePage) {
        this.totalRecords = totalRecords;
        this.onePage = onePage;
        int record = Integer.parseInt(totalRecords);
        int one = Integer.parseInt(onePage);
        this.total =(record%one==0?record/one:record/one+1)+"";
    }

    public String getTotal() {
        return total;
    }

    public String getTotalRecords() {
        return totalRecords;
    }

    public String getOnePage() {
        return onePage;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public void setTotalRecords(String totalRecords) {
        this.totalRecords = totalRecords;
    }

    public void setOnePage(String onePage) {
        this.onePage = onePage;
    }

    public Page() {
    }
}
