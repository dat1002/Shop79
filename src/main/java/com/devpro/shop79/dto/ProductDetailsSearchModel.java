package com.devpro.shop79.dto;

public class ProductDetailsSearchModel extends BaseSearchModel{
    public Integer id;

    public String keyword;

    public String productDetailsId;

    public String getProductDetailsId() {
        return productDetailsId;
    }

    public void setProductDetailsId(String productDetailsId) {
        this.productDetailsId = productDetailsId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    private String seo;

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }
}
