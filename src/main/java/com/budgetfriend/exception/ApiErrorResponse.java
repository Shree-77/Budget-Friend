package com.budgetfriend.exception;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;

public class ApiErrorResponse {
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
        private HttpStatus status;
        private String errorCode;
        private String message;
        private String path;
        private LocalDateTime timestamp;


        // Constructor
        public ApiErrorResponse(HttpStatus status, String errorCode, String message, String path) {
            this.timestamp = LocalDateTime.now();
            this.status = status;
            this.errorCode = errorCode;
            this.message = message;
            this.path= path;
        }

        public LocalDateTime getTimestamp() { return timestamp; }
        public HttpStatus getStatus() { return status; }
        public String getErrorCode() { return errorCode; }
        public String getMessage() { return message; }


    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
