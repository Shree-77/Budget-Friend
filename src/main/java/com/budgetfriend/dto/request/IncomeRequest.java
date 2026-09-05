package com.budgetfriend.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDate;

public class IncomeRequest {
    @NotNull
    @Positive(message = "Amount must be positive")
    private BigDecimal amount;
    @Size(max = 150, message = "Source must be less than 150 characters")
    @NotBlank(message = "Source is required")
    private String source;
    @NotNull
    private LocalDate receivedDate;
    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;


    public @NotNull @Positive(message = "Amount must be positive") BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(@NotNull @Positive(message = "Amount must be positive") BigDecimal amount) {
        this.amount = amount;
    }

    public @Size(max = 150, message = "Source must be less than 150 characters") @NotBlank(message = "Source is required") String getSource() {
        return source;
    }

    public void setSource(@Size(max = 150, message = "Source must be less than 150 characters") @NotBlank(message = "Source is required") String source) {
        this.source = source;
    }

    public @NotNull LocalDate getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(@NotNull LocalDate receivedDate) {
        this.receivedDate = receivedDate;
    }

    public @Size(max = 250, message = "Description must be less than 250 characters") String getDescription() {
        return description;
    }

    public void setDescription(@Size(max = 250, message = "Description must be less than 250 characters") String description) {
        this.description = description;
    }

}
