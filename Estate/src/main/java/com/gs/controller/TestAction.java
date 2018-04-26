package com.gs.controller;

import org.apache.log4j.Logger;

import com.gs.pojo.Test;
import com.gs.service.TestService;
import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport {

	private static final long serialVersionUID = -5445582745875528730L;
	private Logger logger = Logger.getLogger(TestAction.class);
	
	private Test test;
	
	private TestService testService;
	
	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public void setTestService(TestService testService) {
		this.testService = testService;
	}

	public String page() {
		
		return "page";
	}
	
	public String add() {
		System.out.println(test.getId() + test.getTest()+test.getTested());
		testService.add(test);
		return "add";
	}

}
