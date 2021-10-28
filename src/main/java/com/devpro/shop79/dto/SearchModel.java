package com.devpro.shop79.dto;

public class SearchModel extends BaseSearchModel
{
    // tìm theo keyword
    public String keyword;

    // tìm theo category
    public Integer categoryId;

    public String seo;

    //page hiện tại
    public Boolean isHot;
    public String getKeyword() {
        return keyword;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public String getSeo() {
        return seo;
    }

}