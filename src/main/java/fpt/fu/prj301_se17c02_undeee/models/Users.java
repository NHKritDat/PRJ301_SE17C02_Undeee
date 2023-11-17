package fpt.fu.prj301_se17c02_undeee.models;

import java.util.Date;

public class Users {

    private int id;
    private String email;
    private String password;
    private String fullname;
    private String phone;
    private String avatar;
    private int role;
    private Date created_at;

    public Users(int id, String email, String password, String fullname, String phone, String avatar, int role, Date created_at) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.avatar = avatar;
        this.role = role;
        this.created_at = created_at;
    }

    public Users() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", email=" + email + ", password=" + password + ", fullname=" + fullname + ", phone=" + phone + ", avatar=" + avatar + ", role=" + role + ", created_at=" + created_at + '}';
    }

}
