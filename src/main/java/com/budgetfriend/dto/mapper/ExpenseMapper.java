package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.ExpenseRequest;
import com.budgetfriend.dto.response.ExpenseResponse;
import com.budgetfriend.model.Expense;
import org.springframework.stereotype.Component;

@Component
public class ExpenseMapper {

    public Expense toEntity(ExpenseRequest expenseRequest) {
        Expense expense = new Expense();
        expense.setAmount(expenseRequest.getAmount());
        expense.setCategory(expenseRequest.getCategory());
        expense.setDescription(expenseRequest.getDescription());
        expense.setExpenseDate(expenseRequest.getExpenseDate());
        return expense;
    }
    public ExpenseResponse toResponse(Expense expense) {
        ExpenseResponse expenseResponse = new ExpenseResponse();
        expenseResponse.setId(expense.getId());
        expenseResponse.setAmount(expense.getAmount());
        expenseResponse.setCategory(expense.getCategory());
        expenseResponse.setDescription(expense.getDescription());
        expenseResponse.setExpenseDate(expense.getExpenseDate());
        return expenseResponse;
    }
}
