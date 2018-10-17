package com.mapper;

import com.Pojo.EchartsPojo;
import com.model.BuyIn;
import com.util.BaseMapper;

import java.util.ArrayList;
import java.util.Map;

public interface BuyInMapper extends BaseMapper {
    int deleteByPrimaryKey(String buyInId);

    int insert(BuyIn record);

    int insertSelective(BuyIn record);

    BuyIn selectByPrimaryKey(String buyInId);

    int updateByPrimaryKeySelective(BuyIn record);

    int updateByPrimaryKey(BuyIn record);

    int selectBykeyword(String key);

    ArrayList<Object> selectBykeyLimit(Map<String, Object> map);

    ArrayList<EchartsPojo> selectStatistics(String time);
}