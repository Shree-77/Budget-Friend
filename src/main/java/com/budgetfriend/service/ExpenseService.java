package com.budgetfriend.service;

import com.budgetfriend.model.Expense;
import com.budgetfriend.repository.ExpenseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpenseService {
    public final ExpenseRepository expenseRepository;

    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }
    public Expense createExpense(Expense expense) {
        return expenseRepository.save(expense);
    }
    public List<Expense> getExpenses(){
        return expenseRepository.findAll();
    }
}
