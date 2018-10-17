package com.service;

import com.model.WaterSale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WaterSaleService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    String edit(HttpServletRequest request, HttpServletResponse response, WaterSale waterSale);

    String pay(HttpServletRequest request, HttpServletResponse response);

    String  showStatistics(HttpServletRequest request);
}
