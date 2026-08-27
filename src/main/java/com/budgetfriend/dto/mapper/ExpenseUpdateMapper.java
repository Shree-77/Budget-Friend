package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.ExpenseUpdateRequest;
import com.budgetfriend.model.Expense;
import org.springframework.stereotype.Component;

@Component
public class ExpenseUpdateMapper {
    public Expense updateEntity(Expense existing, ExpenseUpdateRequest request) {
        if (request.getAmount() != null) {
            existing.setAmount(request.getAmount());
        }
        if (request.getCategory() != null) {
            existing.setCategory(request.getCategory());
        }
        if (request.getDescription() != null) {
            existing.setDescription(request.getDescription());
        }
        if (request.getExpenseDate() != null) {
            existing.setExpenseDate(request.getExpenseDate());
        }
        return existing;
    }
}
