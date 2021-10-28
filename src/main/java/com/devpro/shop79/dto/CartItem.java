package com.devpro.shop79.dto;

import java.math.BigDecimal;

/**
 * danh sách sản phẩm.
 * @author daing
 *
 */
public class CartItem {
	// mã sản phẩm 
	private int productId;
	
	// tên sản phẩme
	private String productName;
	
	// số lương sản phẩm
	private int quantity;

	private String avatar;


	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
}
