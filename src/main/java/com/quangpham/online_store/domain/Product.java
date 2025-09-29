package com.quangpham.online_store.domain;


import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String product_name;
    private double price;
    private String image_url;
    private String detailDescription;
    private String shortDescription;
    private long stock;
    private long sold;
    private String brand;
    private String usage_tag;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> getOrderDetails;

    @OneToMany(mappedBy = "product")
    private List<ProductSpec> productSpecs;

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getDetailDescription() {
        return detailDescription;
    }

    public void setDetailDescription(String detailDescription) {
        this.detailDescription = detailDescription;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public long getStock() {
        return stock;
    }

    public void setStock(long stock) {
        this.stock = stock;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getUsage_tag() {
        return usage_tag;
    }

    public void setUsage_tag(String usage_tag) {
        this.usage_tag = usage_tag;
    }

    @Override
    public String toString() {
        return "test{" +
                "id=" + id +
                ", product_name='" + product_name + '\'' +
                ", price=" + price +
                ", image_url='" + image_url + '\'' +
                ", detailDescription='" + detailDescription + '\'' +
                ", shortDescription='" + shortDescription + '\'' +
                ", stock=" + stock +
                ", sold=" + sold +
                ", brand='" + brand + '\'' +
                ", usage_tag='" + usage_tag + '\'' +
                '}';
    }
}
