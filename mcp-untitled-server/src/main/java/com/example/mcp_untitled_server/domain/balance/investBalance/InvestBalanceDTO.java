package com.example.mcp_untitled_server.domain.balance.investBalance;

import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class InvestBalanceDTO {
    private Long id;
    private Long userId;
    private BigDecimal balance;
}
