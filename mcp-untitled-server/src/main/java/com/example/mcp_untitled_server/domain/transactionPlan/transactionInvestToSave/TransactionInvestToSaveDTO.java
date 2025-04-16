package com.example.mcp_untitled_server.domain.transactionPlan.transactionInvestToSave;

import lombok.*;

import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionInvestToSaveDTO {
    private Long id;
    private Long monthlyFinancialSummaryId;
    private Long lenderId;
    private BigDecimal amount;
}
