package com.mapper;

import com.Pojo.CusTicket;
import com.model.WaterTicket;

import java.util.ArrayList;
import java.util.Map;

public interface WaterTicketMapper {
    int deleteByPrimaryKey(String waterTicketId);

    int insert(WaterTicket record);

    int insertSelective(WaterTicket record);

    WaterTicket selectByPrimaryKey(String waterTicketId);

    int updateByPrimaryKeySelective(WaterTicket record);

    int updateByPrimaryKey(WaterTicket record);

    int selectBykey(String key);

    ArrayList<CusTicket> selectBykeyLimit(Map<String, Object> map);

    int rechargeTicket(WaterTicket waterTicket);

    int updateByCustomerId(WaterTicket waterTicket);
}