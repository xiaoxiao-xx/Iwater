package com.mapper;

import com.Pojo.MoneyPojo;
import com.model.MoneyManage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface MoneyManageMapper {
    int deleteByPrimaryKey(String manageId);

    int insert(MoneyManage record);

    int insertSelective(MoneyManage record);

    MoneyManage selectByPrimaryKey(String manageId);

    int updateByPrimaryKeySelective(MoneyManage record);

    int updateByPrimaryKey(MoneyManage record);

    ArrayList<MoneyPojo> selectStatistics(String year);
}