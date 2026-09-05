package com.budgetfriend.dto.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDate;

public class ExpenseRequest {

    @NotNull
    @Positive
    private BigDecimal amount;
    @NotBlank
    @Size(max = 50, message = "Category must be less than 50 characters")
    private String category;
    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;
    @NotNull
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate expenseDate;


    public @NotBlank @Size(max = 50, message = "Category must be less than 50 characters") String getCategory() {
        return category;
    }

    public void setCategory(@NotBlank @Size(max = 50, message = "Category must be less than 50 characters") String category) {
        this.category = category;
    }

    public @NotNull @Positive BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(@NotNull @Positive BigDecimal amount) {
        this.amount = amount;
    }


    public @Size(max = 250, message = "Description must be less than 250 characters") String getDescription() {
        return description;
    }

    public void setDescription(@Size(max = 250, message = "Description must be less than 250 characters") String description) {
        this.description = description;
    }

    public @NotNull LocalDate getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(@NotNull LocalDate expenseDate) {
        this.expenseDate = expenseDate;
    }

}
