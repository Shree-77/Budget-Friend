package com.budgetfriend.dto.request;

import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDate;

public class IncomeUpdateRequest {

    @Positive(message = "Amount must be positive")
    private BigDecimal amount;
    @Size(max = 150, message = "Source must be less than 150 characters")
    private String source;
    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;
    private LocalDate receivedDate;

    public LocalDate getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(LocalDate receivedDate) {
        this.receivedDate = receivedDate;
    }

    public @Positive(message = "Amount must be positive") BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(@Positive(message = "Amount must be positive") BigDecimal amount) {
        this.amount = amount;
    }

    public @Size(max = 150, message = "Source must be less than 150 characters") String getSource() {
        return source;
    }

    public void setSource(@Size(max = 150, message = "Source must be less than 150 characters") String source) {
        this.source = source;
    }

    public @Size(max = 250, message = "Description must be less than 250 characters") String getDescription() {
        return description;
    }

    public void setDescription(@Size(max = 250, message = "Description must be less than 250 characters") String description) {
        this.description = description;
    }
}
