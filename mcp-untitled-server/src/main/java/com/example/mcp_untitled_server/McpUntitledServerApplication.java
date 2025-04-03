package com.example.mcp_untitled_server;

import org.springframework.ai.tool.ToolCallbackProvider;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.method.MethodToolCallbackProvider;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class McpUntitledServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(McpUntitledServerApplication.class, args);
	}

	@Bean
	ToolCallbackProvider getSingerToolProvider(FileTools fileTools) {
		return MethodToolCallbackProvider.builder().toolObjects(fileTools).build();
	}
}


@Component
class FileTools {

	@Tool(description = "return the name of the favorite singer")
	String getFavoriteSinger() {
		return "Justin Bieber";
	}
}