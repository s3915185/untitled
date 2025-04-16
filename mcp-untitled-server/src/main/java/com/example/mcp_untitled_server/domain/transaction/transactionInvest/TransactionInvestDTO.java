package com.example.mcp_untitled_server.domain.transaction.transactionInvest;

import com.example.mcp_untitled_server.enums.TransactionDebtType;
import com.example.mcp_untitled_server.enums.TransactionInvestType;
import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionInvestDTO {
    private Long id;
    private Long userId;
    private Long investorId;
    private BigDecimal principal;
    private BigDecimal apr;
    private Integer numberOfYear;
    private TransactionInvestType type;
}
