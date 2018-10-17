package com.service;

import com.model.CustomerTable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    String getLastNum(HttpServletRequest request, HttpServletResponse response);

    String addCustomer(HttpServletRequest request, CustomerTable customerTable);

    void beforeEdit(HttpServletRequest request, HttpServletResponse response);

    String edit(HttpServletRequest request, HttpServletResponse response, CustomerTable customerTable);

    String deleteCustomer(HttpServletRequest request);

    String getCustomerId(HttpServletRequest request);
}
