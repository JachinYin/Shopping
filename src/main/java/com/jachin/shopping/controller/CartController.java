package com.jachin.shopping.controller;

import com.jachin.shopping.bean.CartUserBook;
import com.jachin.shopping.bean.Msg;
import com.jachin.shopping.po.Cart;
import com.jachin.shopping.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

    private CartService cartService = new CartService();

    /**
     * 加入购物车
     * @param bookId ；
     * @param httpSession；
     * @return JSON
     */
    @RequestMapping(value = "/cart/{bookId}",method = RequestMethod.POST)
    @ResponseBody
    public Msg addToCart(@PathVariable("bookId")Integer bookId, HttpSession httpSession){

        Cart cart = new Cart();
        cart.setUserid((Integer) httpSession.getAttribute("userId"));
        cart.setBookid(bookId);
        cart.setCount(1);
        cartService.addToCart(cart);

        return Msg.success();
    }

    /**
     * 跳转到购物车
     * @param httpSession；
     * @return JSON
     */
    @RequestMapping(value = "/cart",method = RequestMethod.GET)
    @ResponseBody
    public Msg toCart(HttpSession httpSession){
        int id = (Integer) httpSession.getAttribute("userId");
        List<CartUserBook> carts = cartService.getCart(id);
        return Msg.success().add("cartInfo",carts);
    }

    /**
     * 修改数量
     * @return Json
     */
    @RequestMapping(value = "/cart",method = RequestMethod.PUT)
    @ResponseBody
    public Msg toCart(@RequestParam("cartid")Integer cartId,
                      @RequestParam("count")Integer count,
                      @RequestParam("bookid")Integer bookId){
        Cart cart = new Cart();
        cart.setCartid(cartId);
        cart.setCount(count);
        cart.setBookid(bookId);
        if(cartService.editCount(cart)){
            return Msg.success();
        }
        return Msg.fail();
    }

    // 清空购物车
    @RequestMapping(value = "/cart",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteAll(HttpSession httpSession){
        int userId = (Integer) httpSession.getAttribute("userId");
        cartService.deleteAll(userId);
        return Msg.success();
    }

    // 删除单项
    @RequestMapping(value = "/cart/{cartid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteById(@PathVariable("cartid")Integer cartId){
        cartService.deleteById(cartId);
        return Msg.success();
    }
}
