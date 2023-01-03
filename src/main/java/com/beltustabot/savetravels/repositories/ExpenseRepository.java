package com.beltustabot.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.beltustabot.savetravels.models.Expenses;
@Repository
public interface ExpenseRepository extends CrudRepository<Expenses,Long> {
	List<Expenses> findAll();
	

}
