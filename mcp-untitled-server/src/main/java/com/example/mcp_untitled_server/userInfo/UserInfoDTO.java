package com.example.mcp_untitled_server.userInfo;

import com.example.mcp_untitled_server.enums.TransactionCategory;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserInfoDTO {
    private Long id;
    private String name;
}
