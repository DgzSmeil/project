package com.gs.controller;

import com.alibaba.fastjson.JSON;
import com.gs.bean.ControllerResult;
import com.gs.loan.ACMLoanCalculator;
import com.gs.loan.ACPIMLoanCalculator;
import com.gs.loan.Loan;
import com.gs.loan.LoanUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

/**
 * Created by Wang Genshen on 2017-04-02.
 */
@WebServlet(name="LoanServlet", urlPatterns="/cal.servlet")
public class LoanServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String typeStr = req.getParameter("type");
        String rateStr = req.getParameter("rate");
        String percentStr = req.getParameter("percent");
        String totalStr = req.getParameter("total");
        String yearStr = req.getParameter("year");

        if (typeStr != null && !typeStr.trim().equals("")
                && rateStr != null && !rateStr.trim().equals("")
                && percentStr != null && !percentStr.trim().equals("")
                && totalStr != null && !totalStr.trim().equals("")
                && yearStr != null && !yearStr.trim().equals("")) {
            double rate = Double.valueOf(rateStr);
            BigDecimal total = BigDecimal.valueOf(Double.valueOf(totalStr));
            double percent = Double.valueOf(percentStr);
            int year = Integer.valueOf(yearStr);
            Loan loan = null;
            BigDecimal totalLoan = LoanUtil.totalLoanMoney(total, percent / 100);
            int monthes = LoanUtil.totalMonth(year);
            if (typeStr.equals("ACM")) {
                ACMLoanCalculator cal = new ACMLoanCalculator();
                loan = cal.calLoan(totalLoan, monthes, rate, LoanUtil.RATE_TYPE_YEAR);
            } else if (typeStr.equals("ACPIM")) {
                ACPIMLoanCalculator cal = new ACPIMLoanCalculator();
                loan = cal.calLoan(totalLoan, monthes, rate, LoanUtil.RATE_TYPE_YEAR);
            }
            out.write(JSON.toJSONString(loan));
        } else {
            ControllerResult result = ControllerResult.getFailResult("请输入或选择正确的数据！");
            out.write(JSON.toJSONString(result));
        }

    }

}
