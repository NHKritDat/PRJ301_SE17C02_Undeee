/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.Date;

/**
 *
 * @author Phong
 */
public class Addresses {

    private int id;
    private int user_id;
    private String address_detail;
    private Date created_at;

    public Addresses(int id, int user_id, String address_detail, Date created_at) {
        this.id = id;
        this.user_id = user_id;
        this.address_detail = address_detail;
        this.created_at = created_at;
    }

    public Addresses() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAddress_detail() {
        return address_detail;
    }

    public void setAddress_detail(String address_detail) {
        this.address_detail = address_detail;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Addresses{" + "id=" + id + ", user_id=" + user_id + ", address_detail=" + address_detail + ", created_at=" + created_at + '}';
    }

}
