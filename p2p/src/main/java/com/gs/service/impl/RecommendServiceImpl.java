package com.gs.service.impl;

import com.gs.bean.Recommend;
import com.gs.service.AbstractBaseService;
import com.gs.vo.RecommendVO;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gs.common.Pager;
import com.gs.dao.RecommendDAO;
import com.gs.service.RecommendService;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 创建时间：2017/12/21.
 * @author 张芳芃
 */
@Service
public class RecommendServiceImpl extends AbstractBaseService implements RecommendService {

    private RecommendDAO recommendDAO;

    @Autowired
    public void setRecommendDAO(RecommendDAO recommendDAO) {
        super.setBaseDAO(recommendDAO);
        this.recommendDAO = recommendDAO;
    }

    @Override
    public void save(Object obj) {
        recommendDAO.save(obj);
    }
    @Override
    public void remove(Object obj) {
        recommendDAO.remove(obj);
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(recommendDAO.listPagerCriteria(pager, obj));
        pager.setTotal(recommendDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public int countTzm(String tjm) {
        return recommendDAO.countTzm(tjm);
    }

    @Override
    public Workbook export(Object object) {
        RecommendVO recommendVO=(RecommendVO) object;
        Pager pager = new Pager(1, recommendDAO.countCriteria(recommendVO).intValue());
        List<Object> objectList = recommendDAO.listPagerCriteria(pager, recommendVO);
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("recommend");
        createHeadRow(sheet);
        createContentRows(sheet, objectList);
        return workbook;
    }

    @Override
    public Object recommendRanking() {
        return recommendDAO.recommendRanking();
    }


    private void createHeadRow(Sheet sheet) {
        Row headRow = sheet.createRow(0);
        headRow.createCell(0).setCellValue("编号");
        headRow.createCell(1).setCellValue("推荐人编号");
        headRow.createCell(2).setCellValue("推荐人姓名");
        headRow.createCell(3).setCellValue("被推荐人编号");
        headRow.createCell(4).setCellValue("被推荐人姓名");
        headRow.createCell(5).setCellValue("被推荐人登录时间");
    }

    private void createContentRows(Sheet sheet, List<Object> objectList) {
        int i = 1;
        for (Object obj : objectList) {
            Recommend recommend = (Recommend) obj;
            Row row = sheet.createRow(i);
            row.createCell(0).setCellValue(recommend.getId());
            row.createCell(1).setCellValue(recommend.getTid());
            row.createCell(2).setCellValue(recommend.getTname());
            row.createCell(3).setCellValue(recommend.getUid());
            row.createCell(4).setCellValue(recommend.getRname());
            row.createCell(5).setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                    .format(recommend.getDate()));
            i++;
        }
    }
}
