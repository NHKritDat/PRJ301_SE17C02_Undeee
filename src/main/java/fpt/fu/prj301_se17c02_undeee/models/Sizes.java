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
    private int product_id;
    private double price;
    private Date create_at;

    public Sizes(int size_id, int product_id, double price, Date create_at) {
        this.size_id = size_id;
        this.product_id = product_id;
        this.price = price;
        this.create_at = create_at;
    }

    public Sizes() {
    }

    public int getSize_id() {
        return size_id;
    }

    public void setSize_id(int size_id) {
        this.size_id = size_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "Sizes{" + "size_id=" + size_id + ", product_id=" + product_id + ", price=" + price + ", create_at=" + create_at + '}';
    }
    
}
