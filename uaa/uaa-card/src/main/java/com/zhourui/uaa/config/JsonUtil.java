package com.zhourui.uaa.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import java.io.Writer;

@Slf4j
public enum JsonUtil {
    INSTANCE;
    private final ObjectMapper objectMapper = new ObjectMapper();
    public void writeValue(Writer writer, Object value) {
        try {
            objectMapper.writeValue(writer, value);
        } catch (Exception e) {
            log.error("[ERROR] Error writing value:{}", e.getMessage());
        }
    }
}
