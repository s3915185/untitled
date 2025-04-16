package com.example.mcp_untitled_server.domain.balance.debtBalance;

import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class DebtBalanceDTO {
    private Long id;
    private Long userId;
    private BigDecimal balance;
}
