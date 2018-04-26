package com.gs.service;

import com.gs.bean.Dynamic;

import java.util.Date;
import java.util.List;

public interface DynamicService extends BaseService{
    List<Dynamic> dynamicPage(Date date);
}
