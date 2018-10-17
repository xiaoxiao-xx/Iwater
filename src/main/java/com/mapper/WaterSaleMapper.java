package com.mapper;

import com.Pojo.EchartsPojo;
import com.model.WaterSale;
import com.util.BaseMapper;

import java.util.ArrayList;
import java.util.Map;

public interface WaterSaleMapper extends BaseMapper {
    int deleteByPrimaryKey(String waterSaleId);

    int insert(WaterSale record);

    int insertSelective(WaterSale record);

    WaterSale selectByPrimaryKey(String waterSaleId);

    int updateByPrimaryKeySelective(WaterSale record);

    int updateByPrimaryKey(WaterSale record);

    int selectBykeyword(String key);

    ArrayList<Object> selectBykeyLimit(Map<String, Object> map);

    ArrayList<EchartsPojo> selectStatistics(String time);
}