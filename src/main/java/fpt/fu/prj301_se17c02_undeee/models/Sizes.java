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
public class Sizes {

    private int size_id;
    private int category_id;
    private String name;
    private double percent;
    private Date created_at;

    public Sizes(int size_id, int category_id, String name, double percent, Date created_at) {
        this.size_id = size_id;
        this.category_id = category_id;
        this.name = name;
        this.percent = percent;
        this.created_at = created_at;
    }

    public Sizes() {
    }

    public int getId() {
        return size_id;
    }

    public void setId(int id) {
        this.size_id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPercent() {
        return percent;
    }

    public void setPercent(double percent) {
        this.percent = percent;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;


    }
}
