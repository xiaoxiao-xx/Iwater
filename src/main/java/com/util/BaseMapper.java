package com.util;

import java.util.ArrayList;
import java.util.Map;

public interface BaseMapper{

    int selectBykeyword(String key);

    ArrayList<Object> selectBykeyLimit(Map<String, Object> map);
}
