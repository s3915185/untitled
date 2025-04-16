package com.example.mcp_untitled_server.domain.transactionPlan.transactionDebtToPay;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;


@Data
@Entity
@Table(name = "TRANSACTION_DEBT_TO_PAY")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_DEBT_TO_PAY_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionDebtToPay extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "MONTHLY_FINANCIAL_SUMMARY_ID")
    private Long monthlyFinancialSummaryId;

    @NotNull
    @Column(name = "LENDER_ID")
    private Long lenderId;

    @NotNull
    @Column(name = "AMOUNT")
    private BigDecimal amount;
}