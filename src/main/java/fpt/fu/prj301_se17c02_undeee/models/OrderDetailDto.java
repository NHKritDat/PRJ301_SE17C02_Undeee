/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.OrderDetails;
import fpt.fu.prj301_se17c02_undeee.models.Products;
import fpt.fu.prj301_se17c02_undeee.models.Sizes;

/**
 *
 * @author dell
 */
public class OrderDetailDto {
    private OrderDetails orderDetail;
    private Products product;
    private Sizes size;

    public OrderDetailDto() {
    }

    public OrderDetailDto(OrderDetails orderDetail, Products product, Sizes size) {
        this.orderDetail = orderDetail;
        this.product = product;
        this.size = size;
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
    
}
