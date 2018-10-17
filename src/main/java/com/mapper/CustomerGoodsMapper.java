package com.mapper;

import com.model.CustomerGoods;

public interface CustomerGoodsMapper {
    int deleteByPrimaryKey(String customerGoodsId);

    int insert(CustomerGoods record);

    int insertSelective(CustomerGoods record);

    CustomerGoods selectByPrimaryKey(String customerGoodsId);

    int updateByPrimaryKeySelective(CustomerGoods record);

    int updateByPrimaryKey(CustomerGoods record);

    CustomerGoods selectByCustomerId(String id);

    int updateByCustomerId(CustomerGoods customerGoods);
}