package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.ExpenseRequest;
import com.budgetfriend.dto.response.ExpenseResponse;
import com.budgetfriend.model.Expense;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class ExpenseMapper {

    public Expense toEntity(ExpenseRequest expenseRequest) {
        Expense expense = new Expense();
        expense.setAmount(expenseRequest.getAmount());
        expense.setBudgetCategory(expenseRequest.getCategory());
        expense.setDescription(expenseRequest.getDescription());
        expense.setExpenseDate(expenseRequest.getExpenseDate());
        expense.setMonth(LocalDate.now().getMonthValue());
        expense.setYear(LocalDate.now().getYear());
        return expense;
    }

    public ExpenseResponse toResponse(Expense expense) {
        ExpenseResponse expenseResponse = new ExpenseResponse();
        expenseResponse.setId(expense.getId());
        expenseResponse.setAmount(expense.getAmount());
        expenseResponse.setCategory(expense.getBudgetCategory());
        expenseResponse.setDescription(expense.getDescription());
        expenseResponse.setExpenseDate(expense.getExpenseDate());
        expenseResponse.setMonth(expense.getMonth());
        expenseResponse.setYear(expense.getYear());
        return expenseResponse;
    }
}
