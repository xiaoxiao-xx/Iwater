package com.mapper;

import com.model.CustomerTable;

import java.util.ArrayList;
import java.util.Map;

public interface CustomerTableMapper {
    int deleteByPrimaryKey(String customerId);

    int insert(CustomerTable record);

    int insertSelective(CustomerTable record);

    CustomerTable selectByPrimaryKey(String customerId);

    int updateByPrimaryKeySelective(CustomerTable record);

    int updateByPrimaryKey(CustomerTable record);

    int selectBykey(String key);

    ArrayList<CustomerTable> selectBykeyLimit(Map<String, Object> map);

    String getLastNum();

    CustomerTable selectByNum(String num);
}