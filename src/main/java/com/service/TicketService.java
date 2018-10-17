package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TicketService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    String recharge(HttpServletRequest request, HttpServletResponse response);
}
