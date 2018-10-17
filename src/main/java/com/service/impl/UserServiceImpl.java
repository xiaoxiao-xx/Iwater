package com.service.impl;

import com.Pojo.CustomerPojo;
import com.google.gson.Gson;
import com.mapper.UserMapper;
import com.model.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

@Service
public class UserServiceImpl implements UserService {
    private Gson gson = new Gson();
    @Resource
    private UserMapper userMapper;

    @Override
    public String login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //String save = request.getParameter("save");
        User user = userMapper.login(username);
        if (user == null) {
            return "ERROR";
        } else if (!user.getPassword().equals(password)) {
            return "PDERROR";
        } else {
            request.getSession().setAttribute("USER", user);
            Cookie cookie = new Cookie("water", user.getId());
            cookie.setMaxAge(60 * 60 * 24 * 15);
            response.addCookie(cookie);
            /*if (save!=null&&save.equals("y")){
            }*/
        }
        return "SUCCESS";

    }

    @Override
    public String checkSave(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("water")) {
                    String id = c.getValue();
                    User user = userMapper.selectByPrimaryKey(id);
                    if (user != null) {
                        return gson.toJson(user);
                    }
                }
            }
        }
        return "unsave";
    }

    @Override
    public void forgetsave(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("water")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                    break;
                }
            }
        }
    }

    @Override
    public String search(HttpServletRequest request) {
        String key = request.getParameter("key");
        if (key!=""){
            key = "%"+key+"%";
            ArrayList<HashMap<String,String>> customerPojos = userMapper.selectBykey(key);
            return gson.toJson(customerPojos);
        }
        return "nothing";
    }
}
