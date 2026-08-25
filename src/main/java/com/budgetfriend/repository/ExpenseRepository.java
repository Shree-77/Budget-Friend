package com.budgetfriend.repository;

import com.budgetfriend.model.Expense;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ExpenseRepository extends MongoRepository<Expense, String>{
}
