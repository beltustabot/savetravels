package com.beltustabot.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.beltustabot.savetravels.models.Expenses;
import com.beltustabot.savetravels.services.ExpenseService;

@Controller
public class MainController {
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/")
	public String index( Model model){
		model.addAttribute("expense", new Expenses());
		List<Expenses> expenses = expenseService.allExpense();
		model.addAttribute("expenses",expenses);
		return "dashboard.jsp";
		}

    @PostMapping("/expense/add")
    public String addExpense(@Valid @ModelAttribute("expense") Expenses  expense, BindingResult result,Model model){
    	if(result.hasErrors()) {
			List<Expenses> expenses = expenseService.allExpense();
			model.addAttribute("expenses", expenses);
			return "dashboard.jsp";
		}
	    expenseService.createExpense(expense);
		return "redirect:/";
    }

//  ===========edit form==============
//  =======display edit form+++=========
  
	@GetMapping("/expense/edit/{id}")
	public String edit(@PathVariable("id") Long id, @ModelAttribute("expense") Expenses expense, Model model) {	
		model.addAttribute("expense", expenseService.findExpense(id));
		return "edit.jsp";
	}
	
	@PutMapping("/expense/edit/{id}")
	public String update(
			@PathVariable("id") Long id, 
			Model model, 
			@Valid @ModelAttribute("expense") Expenses expense, 
			BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "edit.jsp";
		}else {
			expenseService.updateExpense(expense);
			return "redirect:/";
		}
	}
	
	  @DeleteMapping("/expense/delete/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	        expenseService.deleteExpense(id);
	        return "redirect:/";
	    }
	  
	  @GetMapping("/expense/show/{id}")
	  public String show(@PathVariable("id") Long id, Model model) {
		  model.addAttribute("expense", expenseService.findExpense(id));
		  return "show.jsp";
		  
	  }
}

