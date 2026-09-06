package com.budgetfriend.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.mapping.Document;
import java.math.BigDecimal;

@Document(collection = "budgets")
@CompoundIndex(name = "category_month_year_unique", def = "{'category': 1, 'month': 1, 'year': 1}", unique = true, collation = "{ 'locale': 'en', 'strength': 2 }")
public class Budget {

    @Id
    private String id;

    @NotBlank
    @Size(max = 50, message = "Category must be less than 50 characters")
    private String category;

    @NotNull
    @Positive
    private BigDecimal amount;

    @Size(max = 250, message = "Description must be less than 250 characters")
    private String description;

    @NotNull
    private int month;

    @NotNull
    private int year;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

}
