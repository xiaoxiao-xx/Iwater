package com.util;

import com.Pojo.Page;
import com.google.gson.Gson;
import com.model.BuyIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PageUtil {
    final static String onePage = "10";
    private static Page page;
    private static Gson gson = new Gson();
    public static String wrapKey(String key){
        if(key==null || key == ""){
            key = "%%";
        }else{
            key = "%"+key+"%";
        }
        return key;
    }

    public static Map pageMap(String pn,String key,String onePage){
        int  start = (Integer.parseInt(pn)-1)*Integer.parseInt(onePage);
        int limit = Integer.parseInt(onePage);
        Map<String,Object> map = new HashMap<>();
        map.put("key",key);
        map.put("start",start);
        map.put("limit",limit);
        return map;
    }

    public static String getP(HttpServletRequest request, HttpServletResponse response, BaseMapper base) {
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        int totalRecords = base.selectBykeyword(key);
        page = new Page(totalRecords+"",onePage);
        return gson.toJson(page);
    }

    public static String showL(HttpServletRequest request, HttpServletResponse response,BaseMapper base) {
        String pn = request.getParameter("pn");
        String key = request.getParameter("keyword");
        key = PageUtil.wrapKey(key);
        Map<String,Object> map = PageUtil.pageMap(pn,key,onePage);
        ArrayList<Object> obj = base.selectBykeyLimit(map);
        return gson.toJson(obj);
    }
}
