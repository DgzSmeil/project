package com.gs.job;

import com.gs.bean.UserTicket;
import com.gs.service.UserTicketService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */
public class UserTicketJob implements Job {

    private UserTicketService userTicketService;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        userTicketService = (UserTicketService) jobExecutionContext.getJobDetail().getJobDataMap().get("userTicketService");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Calendar.getInstance().getTime());
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(Calendar.getInstance().getTime());
        calendar2.add(Calendar.DATE, -1);
        Date time = calendar2.getTime();
        List<UserTicket> userTickets = (List)userTicketService.listAll();
        if (userTickets != null && userTickets.size() > 0){
            for (UserTicket userTicket : userTickets){
                //如果时间过了，则优惠券失效
                if (calendar.getTime().before(userTicket.getTktime())){
                    userTicket.setUkid(userTicket.getUkid());
                    userTicket.setStatus(3);
                    userTicketService.update(userTicket);
                }
                //判断是否为失效的前一天，如果是则发站内信提醒用户
                if (time.before(userTicket.getTktime())){

                }
            }
        }
    }

}
