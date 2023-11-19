/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.Date;

/**
 *
 * @author dell
 */
public class OrderDetails {

    private int order_detail_id;
    private int order_id;
    private int product_id;
    private int size_id;
    private int quantity;
    private Date created_at;

    public OrderDetails() {
    }

    public OrderDetails(int id, int order_id, int product_id, int size_id, int quantity, Date created_at) {
        this.order_detail_id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.size_id = size_id;
        this.quantity = quantity;
        this.created_at = created_at;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int id) {
        this.order_detail_id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSize_id() {
        return size_id;
    }

    public void setSize_id(int size_id) {
        this.size_id = size_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

}
