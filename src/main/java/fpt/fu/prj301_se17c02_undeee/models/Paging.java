/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Paging {

    private int page;
    private int perPage;
    private int total;
    private List<Products> p;
    private List<OrderDto> o;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPerPage() {
        return perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Products> getP() {
        return p;
    }

    public void setP(List<Products> p) {
        this.p = p;
    }

    public List<OrderDto> getO() {
        return o;
    }

    public void setO(List<OrderDto> o) {
        this.o = o;
    }

}
