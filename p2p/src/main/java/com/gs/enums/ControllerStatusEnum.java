package com.gs.enums;

import com.gs.bean.HUser;

/**
 * Created by Administrator on 2017/11/23.
 */
public enum ControllerStatusEnum {

    USER_LOGIN_SUCCESS(100, "ok", "登录成功"),
    USER_LOGIN_ERROR_CODE(101, "error", "验证码错误"),
    USER_LOGIN_FAIL(102, "error", "用户名或密码错误"),
    USER_ALREADY_LOGIN(103, "logined", "已登录"),
    CASH_SAVE_SUCCESS(104, "ok", "添加成功"),
    CASH_SAVE_FAIL(105, "error", "添加失败，稍候再试"),
    USER_SAVE_SUCCESS(106, "ok", "用户注册成功"),
    USER_SAVE_FAIL(107, "error", "用户注册失败，请稍后重试！！"),
    CASH_UPDATE_SUCCESS(108, "ok", "修改成功"),
    CASH_UPDATE_FAIL(109, "error", "修改失败，稍候再试"),
    PHONE_EXIST(110, "exist", "手机号已存在"),
    PHONE_UNEXIST(111, "unexist", "手机号不存在"),
    USERCODE_EXIST(112, "exist", "推荐码存在"),
    USERCODE_UNEXIST(113, "unexist", "推荐码不存在"),
    RECOMMEND_DELETE_SUCCESS(114, "ok", "删除成功"),
    RECOMMEND_DELETE_FAIL(115, "error", "删除失败，请稍后再试"),
    USER_RECHARGE_SUCCESS(201, "ok", "充值成功"),
    USER_RECHARGE_FAIL(202, "error", "充值失败"),
    REG_PHONE_FAIL(202, "error", "充值失败"),
    USER_DEPOSIT_SUCCESS(203, "ok", "提现成功"),
    USER_DEPOSIT_FAIL(204, "error", "提现失败"),
    USER_BANK_DELETE(301,"ok","解绑成功"),
    USER_CANCL_SUCCESS(205, "ok", "取消成功"),
    USER_CANCL_FAIL(206, "error", "取消失败"),
    USER_ADUIT_SUCCESS(207, "ok", "操作成功"),
    USER_BANK_FAIL(208, "error", "该账户已存在"),
    USER_ADUIT_FAIL(208, "error", "操作失败"),
    USER_PASS_FAIL(206, "error", "密码错误"),
    JKB_SAVE_WAIT(10000, "ok", "我们将在1至3个工作日(国家节假日除外)之内完成审核"),
    JUR_SAVE_SUCCESS(108,"ok","权限导入成功"),
    JUR_SAVE_FAIL(109,"error","权限导入失败"),
    JUR_UPDATE_SUCCESS(110,"ok","权限修改成功"),
    JUR_UPDATE_FAIL(111,"error","权限修改失败"),
    JUR_DEL_SUCCESS(215,"ok","权限删除成功"),

    ROLE_SAVE_SUCCESS(112,"ok","角色与角色权限新增成功"),
    ROLE_SAVE_FAIL(113,"error","角色与角色权限新增失败"),
    ROLE_UPDATE_SUCCESS(114,"ok","角色修改成功"),
    ROLE_UPDATE_FAIL(115,"error","角色修改失败"),

    ROLE_USER_SAVE_SUCCESS(210,"ok","角色用户添加成功"),
    ROLE_USER_SAVE_FAIL(211,"fail","角色用户添加失败"),
    ROLE_USER_UPDATE_SUCCESS(212,"ok","角色用户修改成功"),
    ROLE_USER_UPDATE_FAIL(213,"fail","角色用户修改失败"),
    ROLE_USER_DEL_SUCCESS(214,"ok","角色用户删除成功"),
    HUSER_LOGIN_UNAUTH(215,"fail","用户登录未授权"),

    HUSER_SAVE_SUCCESS(216,"ok","后台用户新增成功,密码默认为123456！"),
    HUSER_SAVE_FAIL(217,"fail","后台用户新增失败！"),
    HUSER_UPDATE_SUCCESS(218,"ok","后台用户信息修改成功！"),
    HUSER_UPDATE_FAIL(219,"fail","后台用户信息修改失败！"),
    HUSER_DEL_SUCCESS(220,"ok","后台用户删除成功！"),
    HUSER_DEL_FAIL(221,"fail","后台用户删除失败！"),
    JUR_DEL_FAIL(224,"fail","权限删除失败！"),
    HUSER_UPDATEPWD_SUCCESS(225,"ok","后台用户修改密码成功"),
    HUSER_UPDATEPWD_FAIL(226,"fail","后台用户修改密码失败"),
    HUSER_UPDATEPWD(227,"fail","旧密码输入错误，请重新输入"),

    BZ_SAVE_FAIL(1501, "error", "保存失败"),
    BZ_SAVE_SUCCESS(1502, "ok", "保存成功"),
    BZ_UPDATE_FAIL(1503, "error", "修改失败"),
    BZ_UPDATE_SUCCESS(1504, "ok", "修改成功"),
    BZ_DELETE_FAIL(1505, "error", "删除失败"),
    BZ_DELETE_SUCCESS(1506, "ok", "删除成功"),
    BZ_UPDATE_STATE_FAIL(1507, "error", "修改状态失败"),
    BZ_UPDATE_STATE_SUCCESS(1508, "ok", "修改状态成功"),

    JKLX_SAVE_FAIL(1601, "error", "保存失败"),
    JKLX_SAVE_SUCCESS(1602, "ok", "保存成功"),
    JKLX_UPDATE_FAIL(1603, "error", "修改失败"),
    JKLX_UPDATE_SUCCESS(1604, "ok", "修改成功"),
    JKLX_DELETE_FAIL(1605, "error", "删除失败"),
    JKLX_DELETE_SUCCESS(1606, "ok", "删除成功"),
    JKLX_UPDATE_STATE_FAIL(1607, "error", "修改状态失败"),
    JKLX_UPDATE_STATE_SUCCESS(1608, "ok", "修改状态成功"),

    SWAY_SAVE_FAIL(1701, "error", "保存失败"),
    SWAY_SAVE_SUCCESS(1702, "ok", "保存成功"),
    SWAY_UPDATE_FAIL(1703, "error", "修改失败"),
    SWAY_UPDATE_SUCCESS(1704, "ok", "修改成功"),
    SWAY_DELETE_FAIL(1705, "error", "删除失败"),
    SWAY_DELETE_SUCCESS(1706, "ok", "删除成功"),
    SWAY_UPDATE_STATE_FAIL(1707, "error", "修改状态失败"),
    SWAY_UPDATE_STATE_SUCCESS(1708, "ok", "修改状态成功"),

    DxModel_SAVE_FAIL(1801, "error", "保存失败"),
    DxModel_SAVE_SUCCESS(1802, "ok", "保存成功"),
    DxModel_UPDATE_FAIL(1803, "error", "修改失败"),
    DxModel_UPDATE_SUCCESS(1804, "ok", "修改成功"),
    DxModel_DELETE_FAIL(1805, "error", "删除失败"),
    DxModel_DELETE_SUCCESS(1806, "ok", "删除成功"),

    TICKET_SAVE_SUCCESS(600,"ok","优惠券添加成功"),
    TICKET_SAVE_FAIL(601,"error","添加失败，请稍后再试"),
    TICKET_UPDATE_SUCCESS(602,"ok","优惠券修改成功"),
    TICKET_UPDATE_FAIL(603,"error","优惠券修改失败"),
    UTICKET_SAVE_SUCCESS(604,"ok","领券成功"),
    UTICKET_SAVE_FAIL(605,"error","领券失败，请稍后再试"),
    UTICKET_DELETE_SUCCESS(606,"ok","删除成功"),
    UTICKET_DELETE_FAIL(607,"error","删除失败，请稍后再试"),
    OPTION_SAVE_SUCCESS(608,"ok","用户反馈成功"),
    OPTION_SAVE_FAIL(609,"error","用户反馈失败，请稍后再试"),
    OPTION_DELETE_SUCCESS(610,"ok","删除成功"),
    OPTION_DELETE_FAIL(611,"error","删除失败，请稍后再试"),

    TZB_SAVE_SUCCESS(1806,"ok", "投资成功"),
    TZB_SAVE_OR(1807,"or", "你已经投资过该产品,现已经为你增加投资金额！"),
    TZB_SAVE_FAIL(1808,"fail", "投资失败！不能给自己投资"),
    TZB_SAVE_ERROR(1809,"error", "投资失败！请先登录"),
    TZB_SAVE_NO(1813,"error", "投资失败！投资金额不足1000元，无法抵扣"),

    HKB_UPDATE_FAIL(1810,"fail", "还款失败！余额不足"),
    HKB_UPDATE_SUCCESS(1811,"success", "还款成功！"),
    SKB_UPDATE_SUCCESS(1812,"success", "收款成功！");




    private Integer code;
    private String result;
    private String message;

    ControllerStatusEnum(Integer code, String result, String message) {
        this.code = code;
        this.result = result;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
