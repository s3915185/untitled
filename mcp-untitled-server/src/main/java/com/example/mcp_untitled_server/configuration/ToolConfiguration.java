package com.example.mcp_untitled_server.configuration;


import com.example.mcp_untitled_server.tool.UserConfigurationGlobalTool;
import com.example.mcp_untitled_server.tool.UserInfoGlobalTool;
import com.example.mcp_untitled_server.tool.UserTransactionGlobalTool;
import org.springframework.ai.tool.ToolCallbackProvider;
import org.springframework.ai.tool.method.MethodToolCallbackProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class ToolConfiguration {
    @Bean
    public ToolCallbackProvider userTransactionToolCallbackProvider(UserTransactionGlobalTool userTransactionGlobalTool,
                                                                    UserInfoGlobalTool userInfoGlobalTool,
                                                                    UserConfigurationGlobalTool userConfigurationGlobalTool) {
        return MethodToolCallbackProvider.builder()
                .toolObjects(userTransactionGlobalTool, userInfoGlobalTool, userConfigurationGlobalTool)
                .build();
    }
}
