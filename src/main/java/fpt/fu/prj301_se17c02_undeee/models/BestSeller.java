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
public class BestSeller {

    private int product_id;
    private int count;
    private Date create_at;

    public BestSeller(int product_id, int count, Date create_at) {
        this.product_id = product_id;
        this.count = count;
        this.create_at = create_at;
    }

    public BestSeller() {
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "BestSeller{" + "product_id=" + product_id + ", count=" + count + ", create_at=" + create_at + '}';
    }

}
