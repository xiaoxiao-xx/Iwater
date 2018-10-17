package com.service;

import com.model.BucketInOut;
import com.model.GoodsTable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BucketService {
    String getPage(HttpServletRequest request, HttpServletResponse response);

    String showlist(HttpServletRequest request, HttpServletResponse response);

    void beforeEdit(HttpServletRequest request, HttpServletResponse response);

    String edit(HttpServletRequest request, HttpServletResponse response, BucketInOut bucketInOut);

    String deleteBucket(HttpServletRequest request);

    String addBucket(BucketInOut bucketInOut);
}
