package com.budgetfriend.controller;

import com.budgetfriend.dto.request.BudgetRequest;
import com.budgetfriend.dto.request.BudgetUpdateRequest;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.service.BudgetService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/budgets")
public class BudgetController {

    private final BudgetService budgetService;

    public BudgetController(BudgetService budgetService) {
        this.budgetService = budgetService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public BudgetResponse createBudget(@Valid @RequestBody BudgetRequest request) {
        return budgetService.createBudget(request);
    }

    @GetMapping
    public List<BudgetResponse> getBudgets() {
        return budgetService.getBudgets();
    }

    @GetMapping("/categories")
    public List<String> getCategories() {
        return budgetService.getCategories();
    }

    @GetMapping("/{id}")
    public BudgetResponse getBudgetById(@PathVariable String id) {
        return budgetService.getBudgetById(id);
    }

    @PutMapping("/{id}")
    public BudgetResponse updateBudget(@PathVariable String id, @Valid @RequestBody BudgetUpdateRequest request) {
        return budgetService.updateBudget(id, request);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteBudget(@PathVariable String id) {
        budgetService.deleteBudget(id);
    }
}
