package com.budgetfriend.dto.request;


import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;

public class BudgetUpdateRequest {

    @Size(max = 100, message = "Category must be less than 100 characters")
    private String category;

    @Positive(message = "Amount must be positive")
    private BigDecimal amount;

    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
