package com.example.mcp_untitled_server;

import io.github.cdimascio.dotenv.Dotenv;
import io.modelcontextprotocol.client.McpClient;
import io.modelcontextprotocol.client.McpSyncClient;
import io.modelcontextprotocol.client.transport.HttpClientSseClientTransport;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.mcp.SyncMcpToolCallbackProvider;
import org.springframework.ai.tool.ToolCallbackProvider;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.atomic.AtomicReference;

@SpringBootApplication
public class McpUntitledServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(McpUntitledServerApplication.class, args);
	}

}

@Configuration
class ThirdPartyConfiguration {
	@Bean
	McpSyncClient mcpSyncClient () {
		var mcp = McpClient.sync(new HttpClientSseClientTransport("http://localhost:8081"))
				.build();
		mcp.initialize();
		return mcp;
	}

	@Bean
	McpClientRunner thirdPartyMcpClientRunner (ChatClient.Builder builder, McpSyncClient mcpSyncClient) {
		var mcpToolCallBackProvider = new SyncMcpToolCallbackProvider(mcpSyncClient);
		mcpToolCallBackProvider.getToolCallbacks();
		return new McpClientRunner(builder.defaultTools(mcpToolCallBackProvider));
	}
}


class McpClientRunner implements ApplicationRunner, BeanNameAware {

	private final AtomicReference<String> beanName = new AtomicReference<>();

	private final ChatClient.Builder builder;

	@Override
	public void setBeanName(String name) {

	}

	McpClientRunner(ChatClient.Builder builder) {
		this.builder = builder;
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		var prompt = """
 						What is your favorite singer? Please don't get my data
 						""";
		var response = this.builder
				.build()
				.prompt(prompt)
				.call()
						.content();
		System.out.println(this.beanName.get()+ ": " + response);
	}
}

record Singer(String name) {}