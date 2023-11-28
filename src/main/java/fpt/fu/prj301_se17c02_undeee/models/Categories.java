/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.Date;

/**
 *
 * @author Hp
 */
public class Categories {

    private int category_id;
    private String name;
    private Date created_at;

    public Categories(int id, String name, Date created_at) {
        this.category_id = id;
        this.name = name;
        this.created_at = created_at;
    }

    public Categories() {
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int id) {
        this.category_id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Categories{" + "id=" + category_id + ", name=" + name + ", created_at=" + created_at + '}';
    }

}
