/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;


/**
 *
 * @author dell
 */
public class OrderDetailDto {
    private OrderDetails orderDetail;
    private Products product;
    private Sizes size;
    private Categories category;

    public OrderDetailDto() {
    }

    public OrderDetailDto(OrderDetails orderDetail, Products product, Sizes size, Categories category) {
        this.orderDetail = orderDetail;
        this.product = product;
        this.size = size;
        this.category = category;
    }

    public OrderDetails getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetails orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public Sizes getSize() {
        return size;
    }

    public void setSize(Sizes size) {
        this.size = size;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
    }
    
}
