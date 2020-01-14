package com.dfxy.pojo;

import org.springframework.stereotype.Component;

@Component
public class Admin {
    private String id;
    private String psaaword;

    public Admin() {

    }

    public Admin(String id, String psaaword) {
        this.id = id;
        this.psaaword = psaaword;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPsaaword() {
        return psaaword;
    }

    public void setPsaaword(String psaaword) {
        this.psaaword = psaaword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", psaaword='" + psaaword + '\'' +
                '}';
    }
}
