package com.mapper;

import com.model.User;

import java.util.ArrayList;
import java.util.HashMap;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User login(String username);

    ArrayList<HashMap<String, String>> selectBykey(String key);
}