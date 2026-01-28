package com.entity;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class Broadcast_kinds {
    private String broadcast_kindsid;
    private String broadcast_kindsname;
    private List<Broadcast> broadcastList = new ArrayList<Broadcast>();

    public List<Broadcast> getBroadcastList() {
        return broadcastList;
    }

    public void setBroadcastList(List<Broadcast> broadcastList) {
        this.broadcastList = broadcastList;
    }

    public String getBroadcast_kindsid() {
        return broadcast_kindsid;
    }

    public void setBroadcast_kindsid(String broadcast_kindsid) {
        this.broadcast_kindsid = broadcast_kindsid;
    }

    public String getBroadcast_kindsname() {
        return this.broadcast_kindsname;
    }

    public void setBroadcast_kindsname(String broadcast_kindsname) {
        this.broadcast_kindsname = broadcast_kindsname;
    }
}
