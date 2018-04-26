package com.gs.service;

import com.gs.bean.Recommend;
import org.apache.poi.ss.usermodel.Workbook;

public interface RecommendService extends BaseService {
    int countTzm(String tjm);
    Workbook export(Object object);
    Object recommendRanking();
}
