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
public class Products {

    private int product_id;
    private String name;
    private int category_id;
    private String image;
    private double price;
    private String status;
    private Date created_at;

    public Products(int id, String name, int category_id, String image, double price, String status, Date created_at) {
        this.product_id = id;
        this.name = name;
        this.category_id = category_id;
        this.image = image;
        this.price = price;
        this.status = status;
        this.created_at = created_at;
    }

    public Products() {
    }

    public int getId() {
        return product_id;
    }

    public void setId(int id) {
        this.product_id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + product_id + ", name=" + name + ", category_id=" + category_id + ", image=" + image + ", price=" + price + ", status=" + status + ", created_at=" + created_at + '}';
    }

}
