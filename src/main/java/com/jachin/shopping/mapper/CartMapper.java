package com.jachin.shopping.mapper;

import com.jachin.shopping.bean.CartUserBook;
import com.jachin.shopping.po.Cart;
import com.jachin.shopping.po.CartExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    long countByExample(CartExample example);

    int deleteByExample(CartExample example);

    int deleteByPrimaryKey(Integer cartid);

    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByExample(CartExample example);

    List<CartUserBook> selectByExampleWithUB(CartExample example);

    Cart selectByPrimaryKey(Integer cartid);

    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}