package com.devpro.shop79.services;

import com.devpro.shop79.entities.BaseEntity;

import java.util.List;

public class SortData<E extends BaseEntity> {

	private List<E> data;

	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}


}
