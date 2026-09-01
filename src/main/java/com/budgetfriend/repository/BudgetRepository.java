package com.budgetfriend.repository;

import com.budgetfriend.model.Budget;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BudgetRepository extends MongoRepository<Budget, String> {
}
