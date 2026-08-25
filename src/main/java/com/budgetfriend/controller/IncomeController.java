package com.budgetfriend.controller;

import com.budgetfriend.model.Income;
import com.budgetfriend.service.IncomeService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/income")
public class IncomeController {
    private final IncomeService incomeService;

    public IncomeController(IncomeService incomeService) {
        this.incomeService = incomeService;
    }

    @PostMapping
    public Income addIncome(@RequestBody Income income){
       return incomeService.createIncome(income);
    }

    @PutMapping("/{id}")
    public void updateIncome(@PathVariable String id,@RequestBody Income updatedIncome) {
        incomeService.updateIncome(id, updatedIncome);
    }
    @GetMapping("/{id}")
    public Income getIncomeById(@PathVariable String id) {
       return  incomeService.getIncomeById(id);
    }
    @GetMapping
    public Iterable<Income> getIncomes() {
        return incomeService.getIncomes();
    }

}
