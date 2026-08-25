package com.budgetfriend.controller;

import com.budgetfriend.model.Expense;
import com.budgetfriend.service.ExpenseService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/expense")
public class ExpenseController {
    private final ExpenseService expenseService;

    public ExpenseController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @PostMapping
    public Expense addExpense(@RequestBody Expense expense){
       return expenseService.createExpense(expense);
    }
    @GetMapping
    public List<Expense> getExpenses() {
        return expenseService.getExpenses();
    }

}
