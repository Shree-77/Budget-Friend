package com.budgetfriend.controller;

import com.budgetfriend.dto.request.ExpenseRequest;
import com.budgetfriend.dto.request.ExpenseUpdateRequest;
import com.budgetfriend.dto.response.ExpenseResponse;
import com.budgetfriend.service.ExpenseService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/expenses")
public class ExpenseController {
    private final ExpenseService expenseService;

    public ExpenseController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @PostMapping
    public ExpenseResponse addExpense(@Valid @RequestBody ExpenseRequest expenseRequest){
       return expenseService.createExpense(expenseRequest);
    }
    @GetMapping
    public List<ExpenseResponse> getExpenses() {
        return expenseService.getExpenses();
    }
    @GetMapping("/{id}")
    public ExpenseResponse getExpenseById(@PathVariable String id) {
        return expenseService.getExpenseById(id);
    }
    @PutMapping("/{id}")
    public ExpenseResponse updateExpense(@PathVariable String id, @Valid @RequestBody ExpenseUpdateRequest expenseUpdateRequest) {
        return expenseService.updateExpense(id, expenseUpdateRequest);
    }
    @DeleteMapping("/{id}")
    public void deleteExpense(@PathVariable String id) {
        expenseService.deleteExpense(id);
    }

}
