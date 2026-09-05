package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.BudgetRequest;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.model.Budget;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class BudgetMapper {

    public Budget toEntity(BudgetRequest request) {
        Budget budget = new Budget();
        budget.setCategory(request.getCategory());
        budget.setAmount(request.getAmount());
        budget.setDescription(request.getDescription());
        budget.setMonth(LocalDate.now().getMonthValue());
        budget.setYear(LocalDate.now().getYear());
        return budget;
    }

    public BudgetResponse toResponse(Budget budget) {
        BudgetResponse response = new BudgetResponse();
        response.setId(budget.getId());
        response.setCategory(budget.getCategory());
        response.setAmount(budget.getAmount());
        response.setDescription(budget.getDescription());
        response.setMonth(budget.getMonth());
        response.setYear(budget.getYear());
        return response;
    }
}
