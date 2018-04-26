package com.gs.common;

import com.alibaba.fastjson.JSONObject;

/**
 * Created by Administrator on 2018/1/16.
 */
public class BankAPIUtil {

    public static JSONObject SendjsonObject(String url,String param) {
        JSONObject jsonObject = new JSONObject();
        String result =  HttpUtils.sendPost(url,param);
        jsonObject = JSONObject.parseObject(result);
        return jsonObject;
    }

}
