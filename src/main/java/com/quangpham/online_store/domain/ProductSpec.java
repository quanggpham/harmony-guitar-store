package com.quangpham.online_store.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "product_specs")
public class ProductSpec {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String specKey;
    private String specValue;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSpecKey() {
        return specKey;
    }

    public void setSpecKey(String specKey) {
        this.specKey = specKey;
    }

    public String getSpecValue() {
        return specValue;
    }

    public void setSpecValue(String specValue) {
        this.specValue = specValue;
    }

    @Override
    public String toString() {
        return "ProductSpec{" +
                "id=" + id +
                ", specKey='" + specKey + '\'' +
                ", specValue='" + specValue + '\'' +
                '}';
    }
}
