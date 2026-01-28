package com.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class Purchases {
    private String purchasesid;
    private String membersid;
    private String thinginfoid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addtime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchase_time;
    private String status;
    private String memo;
    private String username;
    private String realname;

    public List getThinginfoid_list() {
        return thinginfoid_list;
    }

    public void setThinginfoid_list(List thinginfoid_list) {
        this.thinginfoid_list = thinginfoid_list;
    }

    private List thinginfoid_list;
    public String getThinginfoname() {
        return thinginfoname;
    }

    public void setThinginfoname(String thinginfoname) {
        this.thinginfoname = thinginfoname;
    }

    private String thinginfoname;

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPurchasesid() {
        return purchasesid;
    }

    public void setPurchasesid(String purchasesid) {
        this.purchasesid = purchasesid;
    }

    public String getMembersid() {
        return this.membersid;
    }

    public void setMembersid(String membersid) {
        this.membersid = membersid;
    }

    public String getThinginfoid() {
        return this.thinginfoid;
    }

    public void setThinginfoid(String thinginfoid) {
        this.thinginfoid = thinginfoid;
    }

    public Date getAddtime() {
        return this.addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Date getPurchase_time() {
        return this.purchase_time;
    }

    public void setPurchase_time(Date purchase_time) {
        this.purchase_time = purchase_time;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
