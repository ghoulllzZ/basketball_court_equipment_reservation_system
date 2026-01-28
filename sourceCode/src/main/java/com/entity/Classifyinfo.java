package com.entity;

import org.springframework.stereotype.Component;

@Component
public class Classifyinfo {
    private String classifyinfoid;
     private String title;
    private String slogan;
    private String opendate;
    private String contact;
    private String contents;
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getClassifyinfoid() {
        return classifyinfoid;
    }

    public void setClassifyinfoid(String classifyinfoid) {
        this.classifyinfoid = classifyinfoid;
    }


    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlogan() {
        return this.slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }

    public String getOpendate() {
        return this.opendate;
    }

    public void setOpendate(String opendate) {
        this.opendate = opendate;
    }

    public String getContact() {
        return this.contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }


    public String getContents() {
        return this.contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }


}
