package com.budgetfriend.model;

import jakarta.validation.constraints.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigDecimal;
import java.time.LocalDate;

@Document(collection = "incomes")
public class Income {
    @Id
    private String id;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }


    public LocalDate getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(LocalDate receivedDate) {
        this.receivedDate = receivedDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

