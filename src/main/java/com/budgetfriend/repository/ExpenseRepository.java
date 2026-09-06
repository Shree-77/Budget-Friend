package com.budgetfriend.repository;

import com.budgetfriend.model.Expense;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ExpenseRepository extends MongoRepository<Expense, String>{
    List<Expense>findByMonthAndYear(int month,int year);
    List<Expense>findByBudgetCategoryAndMonthAndYear(String BudgetCategory,int month, int year);
}
