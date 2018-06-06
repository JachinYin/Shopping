package com.jachin.shopping.service;

import com.jachin.shopping.bean.CartUserBook;
import com.jachin.shopping.mapper.BookMapper;
import com.jachin.shopping.mapper.CartMapper;
import com.jachin.shopping.mapper.UserMapper;
import com.jachin.shopping.po.Book;
import com.jachin.shopping.po.Cart;
import com.jachin.shopping.po.CartExample;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

public class CartService {

    private static ApplicationContext ioc =
            new ClassPathXmlApplicationContext("classpath:spring.xml");

    @Autowired
    private CartMapper cartMapper = (CartMapper) ioc.getBean("cartMapper");
    @Autowired
    private BookMapper bookMapper = (BookMapper) ioc.getBean("bookMapper");
    @Autowired
    private UserMapper userMapper = (UserMapper) ioc.getBean("userMapper");

    // 加入购物车
    public void addToCart(Cart cart){
        CartExample cartExample = new CartExample();
        CartExample.Criteria criteria = cartExample.createCriteria();
        criteria.andUseridEqualTo(cart.getUserid());
        criteria.andBookidEqualTo(cart.getBookid());
        List<Cart> carts = cartMapper.selectByExample(cartExample);
        if(!carts.isEmpty()){
            Book book = bookMapper.selectByPrimaryKey(cart.getBookid());
            cart.setCount(carts.get(0).getCount()+1);
            cart.setPrice(book.getPrice()*cart.getCount());
            cart.setCartid(carts.get(0).getCartid());
            cartMapper.updateByPrimaryKeySelective(cart);
        }else{
            Book book = bookMapper.selectByPrimaryKey(cart.getBookid());
            cart.setPrice(book.getPrice()*cart.getCount());
            cartMapper.insertSelective(cart);
        }
    }

     //查看用户购物车
    public List<CartUserBook> getCart(int userId){
        CartExample cartExample = new CartExample();
        CartExample.Criteria criteria = cartExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        List<Cart> carts = cartMapper.selectByExample(cartExample);
        List<CartUserBook> list = new ArrayList<>();
        for(Cart c : carts){
            list.add(new CartUserBook(
                    bookMapper.selectByPrimaryKey(c.getBookid()),
                    c.getCartid(),
                    c.getUserid(),
                    c.getCount(),
                    c.getPrice()));
        }
        return list;
    }

     // 修改数量
    public Boolean editCount(Cart cart){

        cart.setPrice(cart.getCount()*
                bookMapper.selectByPrimaryKey(cart.getBookid())
                        .getPrice());
        if(cartMapper.updateByPrimaryKeySelective(cart)>0){
            return true;
        }
        return false;
    }

    // 清空购物车
    public void deleteAll(int userId){
        CartExample cartExample = new CartExample();
        CartExample.Criteria criteria = cartExample.createCriteria();
        criteria.andUseridEqualTo(userId);
        cartMapper.deleteByExample(cartExample);
    }

    // 删除购物车指定项
    public void deleteById(int cartId){
        cartMapper.deleteByPrimaryKey(cartId);
    }

    @Test
    public void test(){
//        List<CartUserBook> list = cartMapper.selectByExampleWithUB(null);
//        System.out.println(list);
        CartService  cartService = new CartService();
        System.out.println(cartService.getCart(2));

    }

}
