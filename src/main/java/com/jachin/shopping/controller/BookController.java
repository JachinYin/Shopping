package com.jachin.shopping.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jachin.shopping.bean.Msg;
import com.jachin.shopping.po.Book;
import com.jachin.shopping.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService = new BookService();

    @RequestMapping("/books")
    @ResponseBody
    public Msg getBooks(@RequestParam(value = "pn", required = false, defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,8);
        List<Book> books = bookService.getBooks("Game");
        PageInfo pageInfo = new PageInfo<>(books,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/books/{num}")
    @ResponseBody
    public Msg kind(@PathVariable("num")Integer num,@RequestParam(value = "pn", required = false, defaultValue = "1")Integer pn){
        PageInfo pageInfo = null;
        switch (num){
            case 1:
                PageHelper.startPage(pn,8);
                List<Book> books1 = bookService.getBooks("Game");
                pageInfo = new PageInfo<>(books1,5);
                break;
            case 2:
                PageHelper.startPage(pn,8);
                List<Book> books2 = bookService.getBooks("Story");
                pageInfo = new PageInfo<>(books2,5);
                break;
            case 3:
                PageHelper.startPage(pn,8);
                List<Book> books3 = bookService.getBooks("Science");
                pageInfo = new PageInfo<>(books3,5);
                break;
            case 4:
                PageHelper.startPage(pn,8);
                List<Book> books4 = bookService.getBooks("literature");
                pageInfo = new PageInfo<>(books4,5);
                break;
            case 5:
                PageHelper.startPage(pn,8);
                List<Book> books5 = bookService.getBooks("Tool");
                pageInfo = new PageInfo<>(books5,5);
                break;
        }
        return Msg.success().add("pageInfo",pageInfo);
    }

}
