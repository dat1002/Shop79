package com.devpro.shop79.entities;

import javax.persistence.*;

@Entity
@Table(name = "tbl_product_details")
public class Details extends BaseEntity {
    @Column(name = "size", length = 5, nullable = false)
    private String size;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_detail_id")
    private Product product;

    @Column(name = "color", length = 45, nullable = false)
    private String color;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
