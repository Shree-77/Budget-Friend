package com.budgetfriend.service;

import com.budgetfriend.dto.mapper.ExpenseMapper;
import com.budgetfriend.dto.mapper.ExpenseUpdateMapper;
import com.budgetfriend.dto.request.ExpenseRequest;
import com.budgetfriend.dto.request.ExpenseUpdateRequest;
import com.budgetfriend.dto.response.ExpenseResponse;
import com.budgetfriend.exception.custom.InvalidInputException;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import com.budgetfriend.model.Budget;
import com.budgetfriend.model.Expense;
import com.budgetfriend.repository.ExpenseRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ExpenseService {
    private final ExpenseRepository expenseRepository;
    private final ExpenseMapper expenseMapper;
    private final ExpenseUpdateMapper expenseUpdateMapper;
    private final FinancialService financialService;

    public ExpenseService(ExpenseRepository expenseRepository, ExpenseMapper expenseMapper, ExpenseUpdateMapper expenseUpdateMapper, FinancialService financialService) {
        this.expenseRepository = expenseRepository;
        this.expenseMapper = expenseMapper;
        this.expenseUpdateMapper = expenseUpdateMapper;
        this.financialService = financialService;
    }

    public ExpenseResponse createExpense(ExpenseRequest expenseRequest) {
        Expense expense = expenseMapper.toEntity(expenseRequest);
        int month = expense.getMonth();
        int year = expense.getYear();

        if(!financialService.isCategoryExists(expense)){
            throw new InvalidInputException(
                    "A budget with category '" + expenseRequest.getCategory() + "'is Not exists",
                    "BUDGET_DOES_NOT_EXISTS",
                    HttpStatus.NOT_FOUND
            );
        }

        if(financialService.isExpenseExceeded(expense)){
            throw new InvalidInputException(
                    "Expense Date'" + expenseRequest.getExpenseDate() + "'should be with in the Current Month",
                    "DATE_OUT_OF_RANGE",
                    HttpStatus.BAD_REQUEST
            );
        }

        Budget budget = financialService.getBudgetByExpense(expense);
        BigDecimal expenseAmount = expense.getAmount();
        BigDecimal budgetAmount = budget.getAmount();

        if(expenseAmount.compareTo(budgetAmount) <= 0) {
            Expense response = expenseRepository.save(expense);
            return expenseMapper.toResponse(response);
        }

        BigDecimal remainingIncome = financialService.getRemainingIncomeForMonth(month,year);
        BigDecimal exceededAmount=financialService.getExceededAmount(expense);

        if(remainingIncome.compareTo(exceededAmount)>=0){
            BigDecimal updatedBudget = budget.getAmount().add(exceededAmount);
            financialService.updateBudgetAmount(budget.getId(), updatedBudget);
            Expense response =  expenseRepository.save(expense);
            return expenseMapper.toResponse(response);
        }else{
            throw new InvalidInputException(
                    "Expense is higher than remaining amount",
                    "EXPENSE_LIMIT_REACHED",
                    HttpStatus.NOT_ACCEPTABLE
            );
        }
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
        int month = updatedExpense.getMonth();
        int year = updatedExpense.getYear();

        Budget budget = financialService.getBudgetByExpense(updatedExpense);
        BigDecimal expenseAmount = updatedExpense.getAmount();
        BigDecimal budgetAmount = budget.getAmount();

        //  Updated expense is within the allotted budget
        if(expenseAmount.compareTo(budgetAmount) <= 0) {
            Expense response = expenseRepository.save(updatedExpense);
            return expenseMapper.toResponse(response);
        }

        // Updated expense exceeds budget
        BigDecimal remainingIncome = financialService.getRemainingIncomeForMonth(month, year);
        BigDecimal exceededAmount = financialService.getExceededAmount(updatedExpense);

        if(remainingIncome.compareTo(exceededAmount) >= 0){
            BigDecimal updatedBudget = budget.getAmount().add(exceededAmount);
            financialService.updateBudgetAmount(budget.getId(), updatedBudget);
            Expense response = expenseRepository.save(updatedExpense);
            return expenseMapper.toResponse(response);
        } else {
            throw new InvalidInputException(
                    "Expense is higher than remaining amount",
                    "EXPENSE_LIMIT_REACHED",
                    HttpStatus.NOT_ACCEPTABLE
            );
        }
    }

}
