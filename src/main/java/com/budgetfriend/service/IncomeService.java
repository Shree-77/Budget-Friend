package com.budgetfriend.service;

import com.budgetfriend.model.Income;
import com.budgetfriend.repository.IncomeRepository;
import org.springframework.stereotype.Service;

@Service
public class IncomeService{
    public final IncomeRepository incomeRepository;

    public IncomeService(IncomeRepository incomeRepository) {
        this.incomeRepository = incomeRepository;
    }

    public Income createIncome(Income income) {
        return incomeRepository.save(income);
    }

    public Iterable<Income> getIncomes() {
        return incomeRepository.findAll();
    }
    public Income getIncomeById(String id) {
        return incomeRepository.findById(id).orElse(null);
    }

    public Income updateIncome(String id, Income updatedIncome) {
        Income existingIncome = incomeRepository.findById(id).orElse(null);
        if (existingIncome != null) {
            existingIncome.setAmount(updatedIncome.getAmount());
            existingIncome.setSource(updatedIncome.getSource());
            existingIncome.setReceivedDate(updatedIncome.getReceivedDate());
            existingIncome.setDescription(updatedIncome.getDescription());
            return incomeRepository.save(existingIncome);
        }
        return null;
    }
}
