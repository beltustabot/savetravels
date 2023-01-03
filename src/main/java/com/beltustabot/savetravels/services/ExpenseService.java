package com.beltustabot.savetravels.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.beltustabot.savetravels.models.Expenses;
import com.beltustabot.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;

	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;

}
	// returns all the expense
		public List<Expenses> allExpense() {
		    return expenseRepository.findAll();
   }
		// creates a expense
		public Expenses createExpense(Expenses b) {
		    return expenseRepository.save(b);
		}
		// retrieves an expense
		public Expenses findExpense(Long id) {
		    Optional<Expenses> optionalExpense = expenseRepository.findById(id);
		    if(optionalExpense.isPresent()) {
		        return optionalExpense.get();
		    } else {
		        return null;
  		    }
		}
		public void updateExpense(@Valid Expenses expense) {
			expenseRepository.save(expense);
			
		}
		public void deleteExpense(Long id) {
			expenseRepository.deleteById(id);
		
			
		}
}