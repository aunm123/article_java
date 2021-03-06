package com.bean;

import com.annotation.Column;
import com.annotation.Table;

import javax.xml.crypto.Data;
import java.util.Date;

@Table(tableName = "t_user")
public class UserBean {

    @Column(type = "varchar(30)" ,field = "id" ,primaryKey = true ,defaultNull = false)
    private String id;    //主键，采用UUID
    @Column(type = "varchar(20)" ,field = "username")
    private String username;  //用户名
    @Column(type = "varchar(20)" ,field = "password")
    private String password;  //密码
    @Column(type = "varchar(60)" ,field = "headerpic")
    private String headerPic; //头像
    @Column(type = "varchar(60)" ,field = "email")
    private String email;     //电子邮箱
    @Column(type = "varchar(2)" ,field = "sex")
    private Integer male;     //性别 0男 1女 3保密
    @Column(type = "datetime" ,field = "create_time")
    private Date createTime;//创建时间
    @Column(type = "datetime" ,field = "uodate_time")
    private Date updateTime;//最后更新时间
    @Column(type = "int(1)" ,field = "is_delete")
    private Integer isDelete; // 删除状态0未删除1删除
    @Column(type = "varchar(200)" ,field = "address")
    private String address;   //地址
    @Column(type = "varchar(15)" ,field = "telephone")
    private String telephone; //电话

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeaderPic() {
        return headerPic;
    }

    public void setHeaderPic(String headerPic) {
        this.headerPic = headerPic;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMale() {
        return male;
    }

    public void setMale(Integer male) {
        this.male = male;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", headerPic='" + headerPic + '\'' +
                ", email='" + email + '\'' +
                ", male=" + male +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", isDelete=" + isDelete +
                ", address='" + address + '\'' +
                ", telephone='" + telephone + '\'' +
                '}';
    }
}
