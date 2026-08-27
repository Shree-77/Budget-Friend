package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.IncomeUpdateRequest;
import com.budgetfriend.model.Income;
import org.springframework.stereotype.Component;

@Component
public class IncomeUpdateMapper {

    public Income updateEntity(Income existing, IncomeUpdateRequest request) {
        if (request.getAmount() != null) {
            existing.setAmount(request.getAmount());
        }
        if (request.getSource() != null) {
            existing.setSource(request.getSource());
        }
        if (request.getReceivedDate() != null) {
            existing.setReceivedDate(request.getReceivedDate());
        }
        if (request.getDescription() != null) {
            existing.setDescription(request.getDescription());
        }
        return existing;
    }
}
