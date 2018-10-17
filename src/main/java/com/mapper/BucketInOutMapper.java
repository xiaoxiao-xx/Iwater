package com.mapper;

import com.model.BucketInOut;

import java.util.ArrayList;
import java.util.Map;

public interface BucketInOutMapper {
    int deleteByPrimaryKey(String bucketInOutId);

    int insert(BucketInOut record);

    int insertSelective(BucketInOut record);

    BucketInOut selectByPrimaryKey(String bucketInOutId);

    int updateByPrimaryKeySelective(BucketInOut record);

    int updateByPrimaryKey(BucketInOut record);

    int selectBykey(String key);

    ArrayList<BucketInOut> selectBykeyLimit(Map<String, Object> map);

    BucketInOut selectByCusId(String id);
}