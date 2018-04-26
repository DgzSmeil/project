package com.gs.job;

import com.gs.bean.*;
import com.gs.query.SkbQuery;
import com.gs.service.*;
import com.gs.vo.JkbVO;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */
public class HkbJob implements Job {

    private HkbService hkbService;
    private UserMoneyService userMoneyService;
    private BorrowApplyService borrowApplyService;
    private LogMoneyService logMoneyService;
    private SkbService skbService;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        hkbService = (HkbService) jobExecutionContext.getJobDetail().getJobDataMap().get("hkbService");
        userMoneyService = (UserMoneyService) jobExecutionContext.getJobDetail().getJobDataMap().get("userMoneyService");
        borrowApplyService = (BorrowApplyService) jobExecutionContext.getJobDetail().getJobDataMap().get("borrowApplyService");
        logMoneyService = (LogMoneyService) jobExecutionContext.getJobDetail().getJobDataMap().get("logMoneyService");
        skbService = (SkbService) jobExecutionContext.getJobDetail().getJobDataMap().get("skbService");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(Calendar.getInstance().getTime());
        calendar2.add(Calendar.DATE, -1);
        Date time = calendar2.getTime();
        Hkb h = new Hkb();
        h.setIszd((byte)2);
        List<Hkb> hkbs= (List)hkbService.listByBaid(h);
        if (hkbs.size() >0){
            for (Hkb hkb : hkbs){
                //如果时间过了，则有钱则还款，没钱则逾期
                if (calendar.getTime().before(hkb.getYtime())){
                    hkb.setHkid(hkb.getHkid());
                    UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(hkb.getUid());
                    if (userMoney.getKymoney().compareTo(hkb.getYbx())<0){
                        //余额不足
                        hkb.setState((byte)3);
                        hkb.setYustartime(calendar.getTime());
                        hkb.setYucount(1);
                    }else{
                        hkb.setHkid(hkb.getHkid());
                        hkb.setRnum(hkb.getRnum()+1);
                        hkb.setState((byte)2);
                        hkb.setRtime(calendar.getTime());
                        hkb.setRbx(hkb.getYbx());
                        hkb.setRlx(hkb.getYlx());
                        hkb.setRbj(hkb.getYbj());
                        JkbVO jkb = (JkbVO) borrowApplyService.getById(hkb.getBaid());
                        if (jkb.getTerm() == hkb.getDjq()){
                            BorrowApply borrowApply = new BorrowApply();
                            borrowApply.setBaid(hkb.getBaid());
                            borrowApply.setState((byte)5);
                            borrowApplyService.updateState(borrowApply);
                        }
                        userMoney.setUid(userMoney.getUid());
                        userMoney.setZmoney(userMoney.getZmoney().subtract(hkb.getYbx()));
                        userMoney.setKymoney(userMoney.getKymoney().subtract(hkb.getYbx()));
                        userMoneyService.update(userMoney);
                        LogMoney logMoney = new LogMoney();
                        logMoney.setUid(hkb.getUid());
                        logMoney.setOut(hkb.getYbx());
                        logMoney.setIn(new BigDecimal(0));
                        logMoney.setType((byte)3);
                        logMoneyService.save(logMoney);
                        SkbQuery skbQuery = new SkbQuery();
                        skbQuery.setDjq(hkb.getDjq());
                        skbQuery.setBaid(hkb.getBaid());
                        List<Skb> skbs = (List) skbService.list(skbQuery);
                        for (Skb skb1 : skbs){
                            skb1.setState((byte)1);
                            skbService.update(skb1);
                        }
                    }
                    hkbService.update(hkb);
                }

            }
        }

        Hkb hkb = new Hkb();
        List<Hkb> hkbList = (List)hkbService.listByBaid(hkb);
        if (hkbList.size() > 0){
            //判断是否为失效的前一天，如果是则发站内信提醒用户
            for (Hkb hkb1 : hkbList){
                if (calendar2.getTime().before(hkb1.getYtime())){
                    //TODO 发送站内信提示要还款了
                }
            }
        }


    }
}
