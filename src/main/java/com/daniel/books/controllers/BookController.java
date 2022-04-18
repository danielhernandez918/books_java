package com.daniel.books.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;

//import java.util.ArrayList;

//import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daniel.books.models.Book;
import com.daniel.books.services.BookService;


@Controller
public class BookController {
	@Autowired
	BookService bookService;
	
	
	@GetMapping("/books/{bookId}") 
    public String index(Model model, @PathVariable("bookId") Long bookId, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
//		System.out.print(bookId);
		Book book = bookService.findBook(bookId);
//		System.out.println(book);
		model.addAttribute("book", book);
        
		return "show.jsp";
	}
	
    @RequestMapping("/books")
    public String allBooks(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
        List<Book> books = bookService.allBooks();
        model.addAttribute("books", books);
		return "all.jsp";
    }
	@GetMapping("/books/new")
	public String bookForm(@ModelAttribute("book") Book book, HttpSession session){
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
		return "newBook.jsp";
	}
    @PostMapping("/books/create")
    public String bookCreate(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if(result.hasErrors()) {
    		return "newBook.jsp";
    	}
    	else {
    		bookService.createBook(book);
    		return "redirect:/books";
    	}
    }
	@GetMapping("/books/{bookId}/edit") 
    public String editBook(Model model, @PathVariable("bookId") Long bookId, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/books";
    	}
//		System.out.print(bookId);
		Book book = bookService.findBook(bookId);
    	if(session.getAttribute("userId")!= book.getPoster().getId()) {
    		return "redirect:/books";
    	}
//		System.out.println(book);
		model.addAttribute("book", book);    
		return "editBook.jsp";
	}
    @PutMapping(value="/books/{id}/edit")
    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if(result.hasErrors()) {
    		return "editBook.jsp";
    	}
    	else {
    		bookService.updateBook(book);
    		return "redirect:/books";
    	}
    }
	@DeleteMapping("/books/{id}/delete")
	public String deleteBook( @PathVariable("id")Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
}
