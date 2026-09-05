package com.budgetfriend.controller;

import com.budgetfriend.dto.request.IncomeRequest;
import com.budgetfriend.dto.request.IncomeUpdateRequest;
import com.budgetfriend.dto.response.IncomeResponse;
import com.budgetfriend.service.IncomeService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/incomes")
public class IncomeController {
    private final IncomeService incomeService;

    public IncomeController(IncomeService incomeService) {
        this.incomeService = incomeService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public IncomeResponse addIncome(@Valid @RequestBody IncomeRequest income){
       return incomeService.createIncome(income);
    }

    @PutMapping("/{id}")
    public IncomeResponse updateIncome(@PathVariable String id, @Valid @RequestBody IncomeUpdateRequest updatedIncome) {
        return incomeService.updateIncome(id, updatedIncome);
    }
    @GetMapping("/{id}")
    public IncomeResponse getIncomeById(@PathVariable String id) {
       return  incomeService.getIncomeById(id);
    }
    @GetMapping
    public List<IncomeResponse> getIncomes() {
        return incomeService.getIncomes();
    }
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteIncome(@PathVariable String id) {
        incomeService.deleteIncome(id);
    }

}
