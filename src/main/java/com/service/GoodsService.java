package com.service;

import com.model.CustomerTable;
import com.model.GoodsTable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GoodsService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    void beforeEdit(HttpServletRequest request, HttpServletResponse response);

    String edit(HttpServletRequest request, HttpServletResponse response, GoodsTable goodsTable);

    String deleteGood(HttpServletRequest request);

    String addGood(GoodsTable goodsTable);
}
