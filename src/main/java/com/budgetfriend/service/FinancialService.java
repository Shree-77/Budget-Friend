package com.budgetfriend.service;

import com.budgetfriend.controller.BudgetController;
import com.budgetfriend.dto.response.BudgetResponse;
import com.budgetfriend.model.Budget;
import com.budgetfriend.model.Expense;
import com.budgetfriend.model.Income;
import com.budgetfriend.repository.BudgetRepository;
import com.budgetfriend.repository.ExpenseRepository;
import com.budgetfriend.repository.IncomeRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class FinancialService {
    private final BudgetRepository budgetRepository;
    private final IncomeRepository incomeRepository;
    private final ExpenseRepository expenseRepository;

    public FinancialService(BudgetRepository budgetRepository, IncomeRepository incomeRepository, ExpenseRepository expenseRepository) {
        this.budgetRepository = budgetRepository;
        this.incomeRepository = incomeRepository;
        this.expenseRepository = expenseRepository;
    }

    //Check if budget is less than the remaining total income
    public boolean canAddBudget(Budget budget) {
        int month = budget.getMonth();
        int year = budget.getYear();
        return getRemainingIncomeForMonth(month,year).compareTo(budget.getAmount())>=0;
    }

    public boolean isCategoryExists(Budget budget){
        String category = budget.getCategory();
        int month = budget.getMonth();
        int year = budget.getYear();

        return budgetRepository.findByMonthAndYear(month, year)
                .stream()
                .anyMatch(b -> b.getCategory().equalsIgnoreCase(category));
    }

    // Overloaded method for Expense
    public boolean isCategoryExists(Expense expense){
        String category = expense.getBudgetCategory();
        int month = expense.getMonth();
        int year = expense.getYear();

        return expenseRepository.findByMonthAndYear(month, year)
                .stream()
                .anyMatch(e -> e.getBudgetCategory().equalsIgnoreCase(category));
    }

    public Budget getBudgetByExpense(Expense expense){
        String category = expense.getBudgetCategory();
        int month = expense.getMonth();
        int year = expense.getYear();
        return budgetRepository.findByCategoryAndMonthAndYear(category,month,year);
    }

    public List<Expense>getExpensesByBudget(Budget budget){
        String category = budget.getCategory();
        int month = budget.getMonth();
        int year = budget.getYear();
        return expenseRepository.findByBudgetCategoryAndMonthAndYear(category,month,year);
    }
    public boolean isExpenseExceeded(Expense expense){
       return getExceededAmount(expense).compareTo(BigDecimal.ZERO)>0;
    }

    public BigDecimal getExceededAmount(Expense expense){
        Budget allottedBudget = getBudgetByExpense(expense);
        List<Expense> expenseList =getExpensesByBudget(allottedBudget);
        BigDecimal totalExpenseAmount = expenseList.stream().map(Expense::getAmount).reduce(BigDecimal.ZERO,BigDecimal::add);

        return allottedBudget.getAmount().subtract(totalExpenseAmount);
    }

    private BigDecimal getTotalIncome(int month,int year){
       return incomeRepository.findByMonthAndYear(month,year)
                .stream()
                .map(Income::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal getTotalAllottedBudget(int month,int year){
        return budgetRepository.findByMonthAndYear(month,year)
                .stream()
                .map(Budget::getAmount)
                .reduce(BigDecimal.ZERO,BigDecimal::add);
    }

    public BigDecimal getRemainingIncomeForMonth(int month,int year){
        BigDecimal totalIncome = getTotalIncome(month,year);
        BigDecimal totalAllocatedBudget = getTotalAllottedBudget(month,year);
        return totalIncome.subtract(totalAllocatedBudget);
    }
    public void updateBudgetAmount(String id,BigDecimal amount){
        budgetRepository.updateAmountById(id,amount);
    }
    public boolean isExpenseDateWithInRange(Expense expense){
        LocalDate expenseDate = expense.getExpenseDate();
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfMonth = today.withDayOfMonth(1);
        LocalDate lastDayOfMonth = today.withDayOfMonth(today.lengthOfMonth());

        return !expenseDate.isBefore(firstDayOfMonth) && !expenseDate.isAfter(lastDayOfMonth);
    }

}
