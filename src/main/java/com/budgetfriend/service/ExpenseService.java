package com.budgetfriend.service;

import com.budgetfriend.dto.mapper.ExpenseMapper;
import com.budgetfriend.dto.mapper.ExpenseUpdateMapper;
import com.budgetfriend.dto.request.ExpenseRequest;
import com.budgetfriend.dto.request.ExpenseUpdateRequest;
import com.budgetfriend.dto.response.ExpenseResponse;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import com.budgetfriend.model.Expense;
import com.budgetfriend.repository.ExpenseRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpenseService {
    private final ExpenseRepository expenseRepository;
    private final ExpenseMapper expenseMapper;
    private final ExpenseUpdateMapper expenseUpdateMapper;

    public ExpenseService(ExpenseRepository expenseRepository, ExpenseMapper expenseMapper, ExpenseUpdateMapper expenseUpdateMapper) {
        this.expenseRepository = expenseRepository;
        this.expenseMapper = expenseMapper;
        this.expenseUpdateMapper = expenseUpdateMapper;
    }
    public ExpenseResponse createExpense(ExpenseRequest expenseRequest) {
        Expense response =  expenseRepository.save(expenseMapper.toEntity(expenseRequest));
        return expenseMapper.toResponse(response);
    }
    public List<ExpenseResponse> getExpenses(){
        List<Expense> expenseList =  expenseRepository.findAll();
        return expenseList.stream()
                .map(expenseMapper::toResponse)
                .toList();
    }
    public ExpenseResponse getExpenseById(String id) {
        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Expense not found",
                        "EXPENSE_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));
        return expenseMapper.toResponse(expense);
    }
    public void deleteExpense(String id) {
        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Expense not found",
                        "EXPENSE_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));
        expenseRepository.delete(expense);
    }
    public ExpenseResponse updateExpense(String id, ExpenseUpdateRequest expenseUpdateRequest) {
        Expense existingExpense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Expense not found",
                        "EXPENSE_NOT_FOUND",
                        HttpStatus.NOT_FOUND
                ));
        Expense updatedExpense = expenseUpdateMapper.updateEntity(existingExpense, expenseUpdateRequest);
        return expenseMapper.toResponse(expenseRepository.save(updatedExpense));
    }
}
