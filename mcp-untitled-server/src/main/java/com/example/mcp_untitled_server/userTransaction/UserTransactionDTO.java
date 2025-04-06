package com.example.mcp_untitled_server.userTransaction;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserTransactionDTO {
    private Long id;
    private Long userInfoId;
    private BigDecimal amount;
    private String transactionCategory;
    private String name;
    private LocalDateTime localDateTime;
}
