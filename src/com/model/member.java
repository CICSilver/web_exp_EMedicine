package com.model;


public class member {
    private Integer userId = 0;
    private String userName = "";
    private String userPhoneNumber = "";
    private String userEmail = "";
    private String userPasswd = "";
    private String userProvince = "";
    private String userCity = "";

    public member(){}

    public member(member m) {
        this.userId=m.userId;
        this.userName=m.userName;
        this.userPhoneNumber=m.userPhoneNumber;
        this.userEmail=m.userEmail;
        this.userPasswd=m.userPasswd;
        this.userProvince=m.userProvince;
        this.userCity=m.userCity;

    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPasswd() {
        return userPasswd;
    }

    public void setUserPasswd(String userPasswd) {
        this.userPasswd = userPasswd;
    }

    public String getUserProvince() {
        return userProvince;
    }

    public void setUserProvince(String userProvince) {
        this.userProvince = userProvince;
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public void setAll(String userName,String userEmail,String userPhoneNumber,String userPasswd,String userProvince,String userCity){
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPhoneNumber = userPhoneNumber;
        this.userPasswd = userPasswd;
        this.userProvince = userProvince;
        this.userCity = userCity;
    }
}
