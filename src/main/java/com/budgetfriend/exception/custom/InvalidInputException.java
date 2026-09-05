package com.budgetfriend.exception.custom;

import org.springframework.http.HttpStatus;


public class InvalidInputException extends RuntimeException {
    private final String errorCode;
    private final HttpStatus status;

    public String getErrorCode() {
        return errorCode;
    }

    public HttpStatus getStatus() {
        return status;
    }

    public InvalidInputException(String message, String errorCode, HttpStatus status) {
        super(message);
        this.errorCode = errorCode;
        this.status = status;
    }
}
