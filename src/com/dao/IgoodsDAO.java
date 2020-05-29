package com.dao;

import com.model.goods;

public interface IgoodsDAO {
    public int insert(goods g);
    public int update(goods g);
    public int delete(goods g);
}
