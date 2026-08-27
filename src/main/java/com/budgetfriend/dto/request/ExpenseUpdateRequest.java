package com.budgetfriend.dto.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import org.springframework.data.annotation.Id;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

public class ExpenseUpdateRequest {
    @Positive
    private BigDecimal amount;
    @Size(max = 50, message = "Category must be less than 50 characters")
    private String category;
    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate expenseDate;

    public LocalDate getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(LocalDate expenseDate) {
        this.expenseDate = expenseDate;
    }

    public @Size(max = 250, message = "Description must be less than 250 characters") String getDescription() {
        return description;
    }

    public void setDescription(@Size(max = 250, message = "Description must be less than 250 characters") String description) {
        this.description = description;
    }

    public @Size(max = 50, message = "Category must be less than 50 characters") String getCategory() {
        return category;
    }

    public void setCategory(@Size(max = 50, message = "Category must be less than 50 characters") String category) {
        this.category = category;
    }

    public @Positive BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(@Positive BigDecimal amount) {
        this.amount = amount;
    }

}
