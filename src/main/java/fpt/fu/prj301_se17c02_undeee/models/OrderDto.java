/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class OrderDto {

    private Orders order;
    private OrderDetails orderDetail;
    private Users user;
    private Addresses address;
    private Categories category;
    private Products product;
    private Sizes size;
    private List<OrderDto> orderDetailList;


    public OrderDto() {
    }

    public OrderDto(Orders order, OrderDetails orderDetail, Users user, Addresses address, Categories category, Products product, Sizes size, List<OrderDetails> orderDetailList) {
        this.order = order;
        this.orderDetail = orderDetail;
        this.user = user;
        this.address = address;
        this.category = category;
        this.product = product;
        this.size = size;
        this.orderDetailList = new ArrayList<>();
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public OrderDetails getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetails orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Addresses getAddress() {
        return address;
    }

    public void setAddress(Addresses address) {
        this.address = address;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
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

    public List<OrderDto> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDto> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

}
