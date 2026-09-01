package com.budgetfriend.service;

import com.budgetfriend.dto.mapper.BudgetMapper;
import com.budgetfriend.dto.mapper.BudgetUpdateMapper;
import com.budgetfriend.dto.request.BudgetRequest;
import com.budgetfriend.dto.request.BudgetUpdateRequest;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import com.budgetfriend.model.Budget;
import com.budgetfriend.repository.BudgetRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BudgetService {

    private final BudgetRepository budgetRepository;
    private final BudgetMapper budgetMapper;
    private final BudgetUpdateMapper budgetUpdateMapper;

    public BudgetService(BudgetRepository budgetRepository, BudgetMapper budgetMapper, BudgetUpdateMapper budgetUpdateMapper) {
        this.budgetRepository = budgetRepository;
        this.budgetMapper = budgetMapper;
        this.budgetUpdateMapper = budgetUpdateMapper;
    }

    public BudgetResponse createBudget(BudgetRequest request) {
        Budget budget = budgetMapper.toEntity(request);
        Budget saved = budgetRepository.save(budget);
        return budgetMapper.toResponse(saved);
    }

    public List<BudgetResponse> getBudgets() {
        return budgetRepository.findAll()
                .stream()
                .map(budgetMapper::toResponse)
                .toList();
    }

    public BudgetResponse getBudgetById(String id) {
        return budgetRepository.findById(id)
                .map(budgetMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Budget not found",
                        "BUDGET_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));
    }

    public BudgetResponse updateBudget(String id, BudgetUpdateRequest request) {
        Budget existing = budgetRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Budget not found",
                        "BUDGET_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));

        Budget updated = budgetUpdateMapper.updateEntity(existing, request);
        Budget saved = budgetRepository.save(updated);
        return budgetMapper.toResponse(saved);
    }

    public void deleteBudget(String id) {
        Budget existing = budgetRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Budget not found",
                        "BUDGET_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));

        budgetRepository.delete(existing);
    }

    public List<String> getCategories() {
        return budgetRepository.findAll()
                .stream()
                .map(Budget::getCategory)
                .distinct()
                .sorted()
                .collect(Collectors.toList());
    }
}
