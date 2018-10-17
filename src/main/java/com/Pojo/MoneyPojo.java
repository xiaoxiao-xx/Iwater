package com.Pojo;

public class MoneyPojo {
    private double income;
    private double outcome;
    private double profit;
    private String year;
    private String month;

    public MoneyPojo(double income, double outcome, double profit, String year, String month) {
        this.income = income;
        this.outcome = outcome;
        this.profit = profit;
        this.year = year;
        this.month = month;
    }

    public MoneyPojo() {
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public double getOutcome() {
        return outcome;
    }

    public void setOutcome(double outcome) {
        this.outcome = outcome;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
}
