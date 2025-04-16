package com.example.mcp_untitled_server.domain.transactionPlan.transactionDebtToPay;

import com.example.mcp_untitled_server.enums.TransactionInvestType;
import jakarta.persistence.Column;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionDebtToPayDTO {
    private Long id;
    private Long monthlyFinancialSummaryId;
    private Long lenderId;
    private BigDecimal amount;
}
