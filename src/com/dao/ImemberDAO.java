package com.dao;

import com.model.member;
import java.util.List;

public interface ImemberDAO {
    public int insert(member m);// 保存会员信息

    public List select(); // 查询会员信息

    public int update(member m);

    public int delete(member m);

    public member select1();
}
