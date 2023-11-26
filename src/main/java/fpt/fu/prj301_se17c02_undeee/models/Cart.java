/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {

    private Map<String, OrderDetails> cart = new HashMap<>();

    public Cart() {
    }

    public Cart(Map<String, OrderDetails> cart) {
        this.cart = cart;
    }

    public Map<String, OrderDetails> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderDetails> cart) {
        this.cart = cart;
    }

    public void add(OrderDetails ods) {
        String key = String.valueOf(ods.getProduct_id()) + "_" + String.valueOf(ods.getSize_id());
        if (cart.containsKey(key)) {
            int currentQuantity = cart.get(key).getQuantity();
            cart.get(key).setQuantity(currentQuantity + ods.getQuantity());
        } else {
            cart.put(key, ods);
        }
    }

    public void remove(String key) {
        if (cart.containsKey(key)) {
            cart.remove(key);
        }
    }

    public void update(String newKey, OrderDetails ods) {
        String key = ods.getProduct_id() + "_" + ods.getSize_id();
        if (!key.equals(newKey)) {
            remove(key);
            String size_id = newKey.split("_")[1];
            ods.setSize_id(Integer.parseInt(size_id));
            add(ods);
        } else {
            cart.replace(key, ods);
        }
    }

    public List<OrderDetails> getAll() {
        List<OrderDetails> list = new ArrayList<>();
        for (Map.Entry<String, OrderDetails> entry : cart.entrySet()) {
            list.add(entry.getValue());
        }
        return list;
    }

    public int getSize() {
        return cart.size();
    }

    public OrderDetails getByKey(String key) {
        return cart.get(key);
    }
}
