package com.budgetfriend.dto.mapper;

import com.budgetfriend.dto.request.IncomeRequest;
import com.budgetfriend.dto.response.IncomeResponse;
import com.budgetfriend.model.Income;
import org.springframework.stereotype.Component;

@Component
public class IncomeMapper {
    public Income toEntity(IncomeRequest incomeRequest) {
        Income income = new Income();
        income.setAmount(incomeRequest.getAmount());
        income.setSource(incomeRequest.getSource());
        income.setReceivedDate(incomeRequest.getReceivedDate());
        income.setDescription(incomeRequest.getDescription());
        return income;
    }

    public IncomeResponse toResponse(Income income) {
        IncomeResponse incomeResponse = new IncomeResponse();
        incomeResponse.setId(income.getId());
        incomeResponse.setAmount(income.getAmount());
        incomeResponse.setSource(income.getSource());
        incomeResponse.setReceivedDate(income.getReceivedDate());
        incomeResponse.setDescription(income.getDescription());
        return incomeResponse;
    }
}
