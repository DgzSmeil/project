package com.gs.job;

import com.gs.bean.BorrowApply;
import com.gs.service.BorrowApplyService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 创建类名：TestJob
 * 创建时间：2018/1/15 14:06
 *
 * @author 温宁宁
 * @version 1.0
 */

public class BorrowApplyJob implements Job {
    private BorrowApplyService borrowApplyService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        borrowApplyService = (BorrowApplyService) jobExecutionContext.getJobDetail().getJobDataMap().get("borrowApplyService");
    }

}
