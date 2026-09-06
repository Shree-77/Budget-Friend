package com.budgetfriend.repository;

import com.budgetfriend.model.Budget;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.Update;

import java.math.BigDecimal;
import java.util.List;

public interface BudgetRepository extends MongoRepository<Budget, String> {
    List<Budget> findByMonthAndYear(int month, int year);
    Budget findByCategoryAndMonthAndYear(String category,int month , int year);
    @Query("{ '_id' : ?0 }")
    @Update("{ '$set' : { 'amount' : ?1 } }")
    void updateAmountById(String id , BigDecimal amount);
}
