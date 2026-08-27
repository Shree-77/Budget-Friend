package com.budgetfriend.service;

import com.budgetfriend.dto.mapper.IncomeMapper;
import com.budgetfriend.dto.mapper.IncomeUpdateMapper;
import com.budgetfriend.dto.request.IncomeRequest;
import com.budgetfriend.dto.request.IncomeUpdateRequest;
import com.budgetfriend.dto.response.IncomeResponse;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import com.budgetfriend.model.Income;
import com.budgetfriend.repository.IncomeRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class IncomeService{
    private final IncomeRepository incomeRepository;
    private final IncomeMapper incomeMapper;
    private final IncomeUpdateMapper incomeUpdateMapper;

    public IncomeService(IncomeRepository incomeRepository, IncomeMapper incomeMapper, IncomeUpdateMapper incomeUpdateMapper) {
        this.incomeMapper = incomeMapper;
        this.incomeRepository = incomeRepository;
        this.incomeUpdateMapper = incomeUpdateMapper;
    }

    public IncomeResponse createIncome(IncomeRequest income) {
        Income incomeEntity = incomeMapper.toEntity(income);
        Income savedIncome = incomeRepository.save(incomeEntity);
        return incomeMapper.toResponse(savedIncome);
    }

    public List<IncomeResponse> getIncomes() {
        List<Income> incomeList =  incomeRepository.findAll();
        List<IncomeResponse> result = incomeList.stream()
                .map(incomeMapper::toResponse)
                .toList();
        return result;
    }
    public IncomeResponse getIncomeById(String id) {
        return incomeRepository.findById(id)
                .map(incomeMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Income not found", "INCOME_NOT_FOUND", HttpStatus.NOT_FOUND));
    }

    public IncomeResponse updateIncome(String id, IncomeUpdateRequest request) {

        Income existingIncome = incomeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Income not found",
                        "INCOME_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));

        Income updatedIncome = incomeUpdateMapper.updateEntity(existingIncome, request);

        Income savedIncome = incomeRepository.save(updatedIncome);

        return incomeMapper.toResponse(savedIncome);
    }

    public void deleteIncome(String id) {
        Income existingIncome = incomeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Income not found",
                        "INCOME_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));

        incomeRepository.delete(existingIncome);
    }
}
