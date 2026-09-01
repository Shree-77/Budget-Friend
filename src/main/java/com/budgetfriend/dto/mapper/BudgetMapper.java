package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.BudgetRequest;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.model.Budget;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class BudgetMapper {

    public Budget toEntity(BudgetRequest request) {
        Budget budget = new Budget();
        budget.setCategory(request.getCategory());
        budget.setAmount(request.getAmount());
        budget.setPeriodStart(request.getPeriodStart());
        budget.setPeriodEnd(request.getPeriodEnd());
        return budget;
    }

    public BudgetResponse toResponse(Budget budget) {
        BudgetResponse response = new BudgetResponse();
        response.setId(budget.getId());
        response.setCategory(budget.getCategory());
        response.setAmount(budget.getAmount());
        response.setPeriodStart(budget.getPeriodStart());
        response.setPeriodEnd(budget.getPeriodEnd());
        return response;
    }
}
