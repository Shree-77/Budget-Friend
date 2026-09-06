package com.budgetfriend.repository;

import com.budgetfriend.model.Income;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface IncomeRepository extends MongoRepository<Income, String> {
    List<Income>findByMonthAndYear(int month,int year);
}
