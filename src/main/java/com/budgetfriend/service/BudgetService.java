package com.budgetfriend.service;

import com.budgetfriend.dto.mapper.BudgetMapper;
import com.budgetfriend.dto.mapper.BudgetUpdateMapper;
import com.budgetfriend.dto.request.BudgetRequest;
import com.budgetfriend.dto.request.BudgetUpdateRequest;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.exception.custom.InvalidInputException;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import com.budgetfriend.model.Budget;
import com.budgetfriend.repository.BudgetRepository;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BudgetService {

    private final BudgetRepository budgetRepository;
    private final BudgetMapper budgetMapper;
    private final BudgetUpdateMapper budgetUpdateMapper;
    private final FinancialService financialService;

    public BudgetService(BudgetRepository budgetRepository, BudgetMapper budgetMapper, BudgetUpdateMapper budgetUpdateMapper, FinancialService financialService) {
        this.budgetRepository = budgetRepository;
        this.budgetMapper = budgetMapper;
        this.budgetUpdateMapper = budgetUpdateMapper;
        this.financialService = financialService;
    }

    public BudgetResponse createBudget(BudgetRequest request) {
        Budget budget = budgetMapper.toEntity(request);

        if(financialService.isCategoryExists(budget)) {
            throw new InvalidInputException(
                    "A budget with category '" + request.getCategory() + "' already exists for this month and year",
                    "DUPLICATE_BUDGET_CATEGORY",
                    HttpStatus.CONFLICT
            );
        }

        if(financialService.canAddBudget(budget)) {
            try {
                Budget saved = budgetRepository.save(budget);
                return budgetMapper.toResponse(saved);
            } catch (DuplicateKeyException e) {
                throw new InvalidInputException(
                        "A budget with category '" + request.getCategory() + "' already exists for this month and year",
                        "DUPLICATE_BUDGET_CATEGORY",
                        HttpStatus.CONFLICT
                );
            }
        }else{
            throw  new InvalidInputException(
                    "Insufficient Income to allocate a Budget for "+budget.getCategory(),
                    "INSUFFICIENT_AMOUNT",
                    HttpStatus.BAD_REQUEST
            );
        }
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

        // Check for duplicate category (case-insensitive) excluding the current budget
        List<Budget> budgetsForMonthYear = budgetRepository.findByMonthAndYear(updated.getMonth(), updated.getYear());
        boolean isDuplicate = budgetsForMonthYear.stream()
                .filter(b -> !b.getId().equals(id)) // Exclude current budget
                .anyMatch(b -> b.getCategory().equalsIgnoreCase(updated.getCategory()));

        if(isDuplicate) {
            throw new InvalidInputException(
                    "A budget with category '" + request.getCategory() + "' already exists for this month and year",
                    "DUPLICATE_BUDGET_CATEGORY",
                    HttpStatus.CONFLICT
            );
        }

        try {
            Budget saved = budgetRepository.save(updated);
            return budgetMapper.toResponse(saved);
        } catch (DuplicateKeyException e) {
            throw new InvalidInputException(
                    "A budget with category '" + request.getCategory() + "' already exists for this month and year",
                    "DUPLICATE_BUDGET_CATEGORY",
                    HttpStatus.CONFLICT
            );
        }
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
