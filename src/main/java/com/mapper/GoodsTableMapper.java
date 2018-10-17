package com.mapper;

import com.model.GoodsTable;

import java.util.ArrayList;
import java.util.Map;

public interface GoodsTableMapper {
    int deleteByPrimaryKey(String goodsId);

    int insert(GoodsTable record);

    int insertSelective(GoodsTable record);

    GoodsTable selectByPrimaryKey(String goodsId);

    int updateByPrimaryKeySelective(GoodsTable record);

    int updateByPrimaryKey(GoodsTable record);

    int selectBykey(String key);

    ArrayList<GoodsTable> selectBykeyLimit(Map<String, Object> map);

    ArrayList<GoodsTable> selectAllGoods();
}