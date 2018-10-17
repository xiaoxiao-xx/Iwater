package com.service;

import com.model.BuyIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BuyInService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    void beforeAdd(HttpServletRequest request, HttpServletResponse response);

    String addBuyRecord(HttpServletRequest request, HttpServletResponse response, BuyIn buyIn);

    void beforeEdit(HttpServletRequest request, HttpServletResponse response);

    String edit(HttpServletRequest request, HttpServletResponse response, BuyIn buyIn);

    String showStatistics(HttpServletRequest request);
}
