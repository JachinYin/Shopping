package com.jachin.shopping.service;

import com.jachin.shopping.mapper.BookMapper;
import com.jachin.shopping.po.Book;
import com.jachin.shopping.po.BookExample;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class BookService {

    private static ApplicationContext ioc =
            new ClassPathXmlApplicationContext("classpath:spring.xml");

    @Autowired
    private BookMapper bookMapper = (BookMapper) ioc.getBean("bookMapper");

    //获取书籍
    public List<Book> getBooks(String kind){
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andKindEqualTo(kind);
        List<Book> books = bookMapper.selectByExample(bookExample);
        return books;
    }

    @Test
    public void test(){
        System.out.println(bookMapper.selectByExample(null));
    }

    @Test
    public void insertBook(){
        Book book = new Book("MineCraft","something here","Notch",21.0,"Game","game01.jpg",13);
        for(int i=0; i < 20; i++){
            bookMapper.insertSelective(book);
        }
    }
}
