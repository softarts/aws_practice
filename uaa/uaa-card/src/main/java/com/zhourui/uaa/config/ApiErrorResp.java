package com.zhourui.uaa.config;

import lombok.Data;

import java.io.Serializable;

@Data
public class ApiErrorResp implements Serializable {
    private static final long serialVersionUID = -4054168366440917113L;
    private long timestamp;
    private String errorType;
    private String errorCode;
    private String errorDescription;
    private String methodName;
}
