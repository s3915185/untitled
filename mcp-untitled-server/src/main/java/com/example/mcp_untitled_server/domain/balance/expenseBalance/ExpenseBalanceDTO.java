package com.example.mcp_untitled_server.domain.balance.expenseBalance;

import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class ExpenseBalanceDTO {
    private Long id;
    private Long userId;
    private BigDecimal balance;
}
