package com.gs.enums;

/**
 * 创建类名：HKStatesEnum
 * 创建时间：2018/1/8 21:32
 *
 * @author 温宁宁
 * @version 1.0
 */
public enum HKStatesEnum {

    /**
     * 未还款
     */
    UNREPAY(1,"未还款"),
    /**
     * 已还款
     */
    REPAYED(2,"已还款"),
    /**
     * 已逾期
     */
    TIMEOUT(3,"已逾期");

    private int code;
    private String message;

    HKStatesEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}