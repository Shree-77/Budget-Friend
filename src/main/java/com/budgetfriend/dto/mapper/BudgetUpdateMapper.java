package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.BudgetUpdateRequest;
import com.budgetfriend.model.Budget;
import org.springframework.stereotype.Component;

@Component
public class BudgetUpdateMapper {

    public Budget updateEntity(Budget existing, BudgetUpdateRequest request) {
        if (request.getCategory() != null) {
            existing.setCategory(request.getCategory());
        }
        if (request.getAmount() != null) {
            existing.setAmount(request.getAmount());
        }
        if (request.getDescription() != null) {
            existing.setDescription(request.getDescription());
        }

        return existing;
    }
}
