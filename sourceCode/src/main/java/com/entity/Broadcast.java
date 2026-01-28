package com.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Broadcast {
    private String broadcastid;
    private String title;
    private String image;
    private String broadcast_kindsid;
    private String istop;
    private String isflv;
    private String contents;
    private String membersrealname;
    private String membersid;
    private String videopath;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addtime;

    private String hits;
    private String broadcast_kindsname;

    public String getBroadcastid() {
        return broadcastid;
    }

    public void setBroadcastid(String broadcastid) {
        this.broadcastid = broadcastid;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBroadcast_kindsid() {
        return this.broadcast_kindsid;
    }

    public void setBroadcast_kindsid(String broadcast_kindsid) {
        this.broadcast_kindsid = broadcast_kindsid;
    }

    public String getIstop() {
        return this.istop;
    }

    public void setIstop(String istop) {
        this.istop = istop;
    }

    public String getIsflv() {
        return this.isflv;
    }

    public void setIsflv(String isflv) {
        this.isflv = isflv;
    }

    public String getContents() {
        return this.contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getAddtime() {
        return this.addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getHits() {
        return this.hits;
    }

    public void setHits(String hits) {
        this.hits = hits;
    }

    public String getBroadcast_kindsname() {
        return broadcast_kindsname;
    }

    public void setBroadcast_kindsname(String broadcast_kindsname) {
        this.broadcast_kindsname = broadcast_kindsname;
    }

    public String getMembersrealname() {
        return membersrealname;
    }

    public void setMembersrealname(String membersrealname) {
        this.membersrealname = membersrealname;
    }

    public String getMembersid() {
        return membersid;
    }

    public void setMembersid(String membersid) {
        this.membersid = membersid;
    }

    public String getVideopath() {
        return videopath;
    }

    public void setVideopath(String videopath) {
        this.videopath = videopath;
    }
}
