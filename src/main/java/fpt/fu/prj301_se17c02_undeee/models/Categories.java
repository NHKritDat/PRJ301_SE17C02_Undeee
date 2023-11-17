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
    private Date create_at;

    public Categories(int id, String name, Date create_at) {
        this.category_id = id;
        this.name = name;
        this.create_at = create_at;
    }

    public Categories() {
    }

    public int getId() {
        return category_id;
    }

    public void setId(int id) {
        this.category_id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "Categories{" + "id=" + category_id + ", name=" + name + ", create_at=" + create_at + '}';
    }

}
