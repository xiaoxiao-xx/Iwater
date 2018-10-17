package com.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
    String login(HttpServletRequest request, HttpServletResponse response);

    String checkSave(HttpServletRequest request, HttpServletResponse response);

    void forgetsave(HttpServletRequest request, HttpServletResponse response);

    String search(HttpServletRequest request);
}
