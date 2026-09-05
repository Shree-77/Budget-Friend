package com.budgetfriend.exception;

import com.budgetfriend.exception.custom.InvalidInputException;
import com.budgetfriend.exception.custom.ResourceNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.List;


@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiErrorResponse> handleValidationExceptions(MethodArgumentNotValidException ex, HttpServletRequest request) {
        List<String> details = ex.getBindingResult().getFieldErrors()
                .stream()
                .map(error -> error.getField() + ": " + error.getDefaultMessage())
                .toList();
        ApiErrorResponse apiErrorResponse = new ApiErrorResponse(
                HttpStatus.BAD_REQUEST,
                "VALIDATION_ERROR",
                String.join(", ", details),
                request.getRequestURI()
        );
        return ResponseEntity.badRequest().body(apiErrorResponse);
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ApiErrorResponse> handleResourceNotFoundException(ResourceNotFoundException ex, HttpServletRequest request) {
        ApiErrorResponse apiErrorResponse = new ApiErrorResponse(
               HttpStatus.NOT_FOUND,
                ex.getErrorCode(),
                ex.getMessage(),
                request.getRequestURI()
        );
        return new ResponseEntity<>(apiErrorResponse, ex.getStatus());
    }
    @ExceptionHandler(InvalidInputException.class)
    public ResponseEntity<ApiErrorResponse>handleInvalidInputException(InvalidInputException ex , HttpServletRequest request){
        ApiErrorResponse apiErrorResponse = new ApiErrorResponse(
                HttpStatus.BAD_REQUEST,
                ex.getErrorCode(),
                "Invalid input "+ex.getMessage(),
                request.getRequestURI()
        );
        return new ResponseEntity<>(apiErrorResponse,ex.getStatus());
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiErrorResponse> handleGenericException(Exception ex, HttpServletRequest request) {
        ApiErrorResponse apiErrorResponse = new ApiErrorResponse(
                HttpStatus.INTERNAL_SERVER_ERROR,
                "INTERNAL_SERVER_ERROR",
                ex.getMessage(),
                request.getRequestURI()
        );
        return new ResponseEntity<>(apiErrorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
