/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

import java.util.HashMap;
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

    public void update(String key, OrderDetails ods) {
        String newKey = String.valueOf(ods.getProduct_id()) + "_" + String.valueOf(ods.getSize_id());
        if (!key.equals(newKey)) {
            remove(key);
            add(ods);
        } else {
            cart.replace(key, ods);
        }
    }

}
